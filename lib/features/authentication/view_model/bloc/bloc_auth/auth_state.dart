part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(OwnerAuthModel user) = _Authenticated;
  const factory AuthState.emailLoginFailed(String message) = _EmailLoginFailed;
  const factory AuthState.googleLoginFailed(String message) =
      _GoogleLoginFailed;
  const factory AuthState.error(String message) = _Error;
}
