// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:owner_resort_booking_app/core/cubit/cubit_upload_file/upload_file_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/repository/add_property_repository.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/amenities_add_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_bullet_point/bullet_point_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_category/category_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_extra_details/extra_details_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_property_image/upload_image_for_property_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_room_image/upload_image_for_room_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_rules_details/rules_details_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit_sub_details/sub_details_cubit.dart';
// import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/room_add_cubit.dart';
// import 'package:owner_resort_booking_app/features/authentication/repository/auth_repository.dart';
// import 'package:owner_resort_booking_app/features/authentication/view_model/bloc/bloc_auth/auth_bloc.dart';

// class AppBlocProviders {
//   static List<BlocProvider> getProviders(BuildContext _) {
//     return [
//       BlocProvider(
//         create: (context) => AuthBloc(context.read<AuthRepository>()),
//       ),
//       BlocProvider(
//         create: (context) => UploadFileCubit(),
//       ),
//       BlocProvider(
//         create: (context) => UploadImageForPropertyCubit(),
//       ),
//       BlocProvider(
//         create: (context) => UploadImageForRoomCubit(),
//       ),
//       BlocProvider(
//         create: (context) => RoomAddCubit(),
//       ),
//       BlocProvider(
//         create: (context) => AmenitiesAddCubit(),
//       ),
//       BlocProvider(
//         create: (context) =>
//             GetPropertyTypeCubit(context.read<AddPropertyRepository>()),
//       ),
//       BlocProvider(
//         create: (context) =>
//             AddPropertyBloc(context.read<AddPropertyRepository>()),
//       ),
//       BlocProvider(
//         create: (context) => BulletPointCubit(),
//       ),
//       BlocProvider(
//         create: (context) => ExtraDetailsCubit(),
//       ),
//       BlocProvider(
//         create: (context) => SubDetailsCubit(),
//       ),
//       BlocProvider(
//         create: (context) => RulesDetailsCubit(),
//       ),
//     ];
//   }
// }
