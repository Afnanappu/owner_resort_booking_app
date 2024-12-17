import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/core/models/user_model.dart';
import 'package:owner_resort_booking_app/core/utils/create_id.dart';
import 'package:owner_resort_booking_app/features/authentication/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(_Initial()) {
    on<_Register>((event, emit) async {
      emit(AuthState.loading());
      final personalProof = event.user.personalProof;
      final license = event.user.license;

      if (personalProof == null || license == null) {
        if (personalProof == null) {
          emit(AuthState.error('Personal Proof is not added'));
        } else {
          emit(AuthState.error('License is not added'));
        }
        return;
      }
      final email = event.user.email;
      final password = createOwnerId();
      try {
        final userCredential = await authRepository.register(email, password);
        log(userCredential.user?.photoURL??"profile is null".toString());
        event.user.ownerId = password;
        event.user.uid = userCredential.user?.uid;
        await authRepository.addOwnerToCollection(event.user);
        emit(AuthState.initial());
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
  }
}
