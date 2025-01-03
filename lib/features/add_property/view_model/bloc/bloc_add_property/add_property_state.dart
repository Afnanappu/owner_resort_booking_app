part of 'add_property_bloc.dart';

@freezed
class AddPropertyState with _$AddPropertyState {
  const factory AddPropertyState.initial() = _Initial;
  const factory AddPropertyState.added() = _Added;
  const factory AddPropertyState.loading() = _Loading;
  const factory AddPropertyState.error(String error) = _Error;
}
