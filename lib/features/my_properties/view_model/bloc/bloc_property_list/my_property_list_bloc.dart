import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_card_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/repository/my_property_repository.dart';

part 'my_property_list_event.dart';
part 'my_property_list_state.dart';
part 'my_property_list_bloc.freezed.dart';

class MyPropertyListBloc
    extends Bloc<MyPropertyListEvent, MyPropertyListState> {
  final MyPropertyRepository _repository;
  MyPropertyListBloc(this._repository) : super(_Initial()) {
    on<_FetchProperties>((event, emit) async {
      emit(MyPropertyListState.loading());

      try {
        final propertyList = await _repository.fetchProperties(uid: event.uid);
        emit(MyPropertyListState.loaded(propertyList));
        log(propertyList.toString());
      } catch (e) {
        emit(MyPropertyListState.error(e.toString()));
      }
    });
  }
}
