part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginWithEmailAndId(String email, String ownerId) = _LoginWithEmailAndId;
  const factory AuthEvent.loginWithGoogle() = _LoginWithGoogle;
  const factory AuthEvent.register(UserModel user) = _Register;
}
