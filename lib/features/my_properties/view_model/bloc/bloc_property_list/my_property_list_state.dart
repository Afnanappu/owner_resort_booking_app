part of 'my_property_list_bloc.dart';

@freezed
class MyPropertyListState with _$MyPropertyListState {
  const factory MyPropertyListState.initial() = _Initial;
  const factory MyPropertyListState.loading() = _Loading;
  const factory MyPropertyListState.loaded(
      List<PropertyCardModel> propertyList) = _Loaded;
  const factory MyPropertyListState.error(String message) = _Error;
}
