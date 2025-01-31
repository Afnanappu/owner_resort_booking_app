part of 'my_property_list_bloc.dart';

@freezed
class MyPropertyListEvent with _$MyPropertyListEvent {
  const factory MyPropertyListEvent.fetchProperties({
    required String uid,
    String? search,
    FilterOptions? filterOptions,
    String? priceRange,
    List<String>? category,
    int? rating,
  }) = _FetchProperties;
}
