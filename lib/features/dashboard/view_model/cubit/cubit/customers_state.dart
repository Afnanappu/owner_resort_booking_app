part of 'customers_cubit.dart';

@freezed
class CustomersState with _$CustomersState {
  const factory CustomersState.loading() = _Loading;
  const factory CustomersState.loaded(List<UserModel> users) = _Loaded;
  const factory CustomersState.error(String error) = _Error;
}
