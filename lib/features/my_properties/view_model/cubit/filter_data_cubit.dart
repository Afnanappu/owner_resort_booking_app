import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/filter_data_model.dart';

class FilterDataCubit extends Cubit<FilterDataModel?> {
  FilterDataCubit() : super(null);

  void setFilterData(FilterDataModel filterModel) {
    emit(filterModel);
  }

  void clear(){
    emit(null);
  }
}
