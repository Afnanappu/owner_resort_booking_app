
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_card_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';
import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';

part 'my_property_list_event.dart';
part 'my_property_list_state.dart';
part 'my_property_list_bloc.freezed.dart';

class MyPropertyListBloc
    extends Bloc<MyPropertyListEvent, MyPropertyListState> {
  final MyPropertyRepository _repository;
  MyPropertyListBloc(this._repository) : super(_Loading()) {
    on<_FetchProperties>((event, emit) async {
      emit(MyPropertyListState.loading());
     
      try {
        final propertyList = await _repository.fetchProperties(
          uid: event.uid,
          search: event.search,
          filterOptions: event.filterOptions,
          category: event.category ?? [],
          priceRange: event.priceRange,
          rating: event.rating,
        );
        emit(MyPropertyListState.loaded(propertyList));
      } catch (e) {
        emit(MyPropertyListState.error(e.toString()));
      }
    });
  }
}
