import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/authentication/model/owner_auth_model.dart';
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

      if (personalProof.isEmpty) {
        emit(AuthState.error('Personal Proof is not added'));
        return;
      }

      final email = event.user.email;
      final password = createOwnerId();
      try {
        event.user.ownerId = password;
        await authRepository.register(
          email: email,
          password: password,
          user: event.user,
        );

        await authRepository.addOwnerToCollection(event.user);
        emit(AuthState.initial());
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });

    on<_LoginWithEmailAndId>((event, emit) async {
      emit(AuthState.loading());
      try {
        final user = await authRepository.login(event.email, event.ownerId);
        emit(AuthState.authenticated(user));
      } catch (e) {
        emit(AuthState.emailLoginFailed(e.toString()));
      }
    });
  }
}
