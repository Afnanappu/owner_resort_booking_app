
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_alert_dialog.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_google_map_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/bloc/bloc_add_property/add_property_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_icon_widget.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_list_points_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/about_the_resort_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/main_details_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/review_and_rating_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

// ignore: must_be_immutable
class ScreenMyPropertyDetails extends StatelessWidget {
  ScreenMyPropertyDetails({super.key});
  CameraPosition? initialCameraPosition;
  late LatLng propertyLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details Resort',
        needUnderline: false,
        actions: [
          PopupMenuButton(
            offset: Offset(0, 40),
            iconSize: 22,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: CustomIconTextWidget(
                    content: Text('Edit'),
                    icon: Icon(Icons.edit_note_outlined),
                  ),
                  onTap: () {
                    // //TODO: Add editing option here
                    context.push('/${AppRoutes.addProperties}');
                    context.read<AddPropertyBloc>().isEdit = true;
                    final id =
                        context.read<PropertyDetailsBloc>().getPropertyId();
                    if (id == null) {
                      showCustomSnackBar(
                          context: context,
                          message: 'Id is null, can\'t show rooms');
                      return;
                    }

                    //TODO: edit room data
                    context.read<PropertyRoomListBloc>().add(
                          PropertyRoomListEvent.fetchRooms(propertyId: id),
                        );
                  },
                ),
                PopupMenuItem(
                  child: CustomIconTextWidget(
                    icon: Icon(Icons.delete_outline),
                    content: Text('Delete'),
                  ),
                  onTap: () {
                    final id =
                        context.read<PropertyDetailsBloc>().getPropertyId();
                    if (id == null) {
                      showCustomSnackBar(
                          context: context,
                          message: 'Id is null, can\'t show rooms');
                      return;
                    }
                    customAlertDialog(
                      context: context,
                      title: 'Delete this property!',
                      content:
                          'You will lose all the reviews and data about this property',
                      firstOnPressed: () {
                        context.read<PropertyDetailsBloc>().add(
                              PropertyDetailsEvent.propertyDeleted(id: id),
                            );
                      },
                    );
                  },
                ),
              ];
            },
          ),
          MySpaces.hSpace5,
        ],
      ),
      body: BlocConsumer<PropertyDetailsBloc, PropertyDetailsState>(
        listener: (context, state) {
          state.maybeWhen(
            propertyDeleted: () {
              showCustomSnackBar(
                context: context,
                message: 'Property deleted successfully',
                bgColor: MyColors.success,
              );

              //refreshing the data
              final uid = FirebaseAuth.instance.currentUser!.uid;
              context
                  .read<MyPropertyListBloc>()
                  .add(MyPropertyListEvent.fetchProperties(uid: uid));

              context.pop();
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () {
              return Center(
                child: Text(
                  'Loading property details, please wait!',
                ),
              );
            },
            loading: () {
              return Center(
                child: Text(
                  'Loading property details, please wait!',
                ),
              );
            },
            error: (message) {
              return Center(
                child: Text(
                  message,
                ),
              );
            },
            propertyDeleted: () => Center(
              child: Text(
                'This property is being deleted!',
              ),
            ),
            loaded: (propertyModel) {
              final rules = propertyModel.extraDetails.rulesDetailsModel;
              final basicDetails = propertyModel.extraDetails.basicDetailsModel;

              return ListView(
                children: [
                  CarouselImagePickedShowWidget(
                    pickedImages: propertyModel.images,
                    isFileImage: false,
                  ),
                  MySpaces.hSpace20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //main details
                        MainDetailsWidgetForPropertyDetails(
                          propertyModel: propertyModel,
                        ),

                        CustomDivider(
                          horizontal: 35,
                        ),

                        //About the Resort
                        AboutTheResortWidgetForPropertyDetails(
                          basicDetails: basicDetails,
                          propertyModel: propertyModel,
                        ),

                        //Resort rules
                        CustomContainerForPropertyDetails(
                          title: 'Resort Rules',
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check-In: ${propertyModel.checkInTime} | Check-Out: ${propertyModel.checkOutTime}',
                                    style: MyTextStyles.bodySmallMediumBlack
                                        .copyWith(letterSpacing: 0),
                                  ),
                                ],
                              ),
                              CustomDivider(
                                vertical: 10,
                                horizontal: 34,
                              ),
                              CustomListPointsWidgetForPropertyDetails(
                                title: rules.title,
                                details: rules.rules,
                              ),
                            ],
                          ),
                        ),

                        //Location
                        CustomContainerForPropertyDetails(
                          title: 'Location',

                          //TODO: Add location here using google map.
                          child: SizedBox(
                            height: 250,
                            width: .5,
                            child: BlocBuilder<GoogleMapBloc, GoogleMapState>(
                              builder: (context, state) {
                                final cameraPosition = state.maybeWhen(
                                  mapLoaded: (cameraPosition, selectedMarker) {
                                    return cameraPosition;
                                  },
                                  orElse: () {
                                    return null;
                                  },
                                );
                                if (cameraPosition != null) {
                                  initialCameraPosition = cameraPosition;
                                } else {
                                  // context.read<GoogleMapBloc>().add(GoogleMapEvent.confirmLocation());
                                }

                                return initialCameraPosition == null
                                    ? Center(
                                        child: Text(
                                          'Loading...',
                                        ),
                                      )
                                    : CustomGoogleMapWidget(
                                        initialCameraPosition:
                                            initialCameraPosition,
                                        onMapCreated: (controller) {
                                          context
                                              .read<GoogleMapBloc>()
                                              .getMapController
                                              .complete(controller);
                                        },
                                        markers: state.maybeWhen(
                                          locationConfirmed:
                                              (selectedLocation) => {
                                            Marker(
                                              markerId:
                                                  MarkerId('selectedPlace'),
                                              icon: BitmapDescriptor
                                                  .defaultMarker,
                                              position: LatLng(
                                                selectedLocation.latitude,
                                                selectedLocation.longitude,
                                              ),
                                            )
                                          },
                                          orElse: () => {},
                                        ),
                                      );
                              },
                            ),
                          ),
                        ),

                        //Review and rating
                        ReviewAndRatingWidget(
                          reviews: [],
                        ),

                        MySpaces.hSpace60,
                        //
                      ],
                    ),
                  ),
                ],
              );
            },
            orElse: () {
              return Center(
                child: Text(
                  'Something unexpected happened, can\'t load property details',
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: CustomElevatedButton(
        width: MyScreenSize.width * .65,
        text: 'Show Rooms',
        onPressed: () {
          final id = context.read<PropertyDetailsBloc>().getPropertyId();
          if (id == null) {
            showCustomSnackBar(
                context: context, message: 'Id is null, can\'t show rooms');
            return;
          }
          context
              .read<PropertyRoomListBloc>()
              .add(PropertyRoomListEvent.fetchRooms(propertyId: id));
          context.push('/${AppRoutes.myPropertyRooms}');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// class RatingAndReviewWidget extends StatelessWidget {
//   const RatingAndReviewWidget({
//     super.key,
//     required this.propertyModel,
//   });

//   final PropertyDetailsModel propertyModel;

//   @override
//   Widget build(BuildContext context) {
//     return CustomContainerForPropertyDetails(
//       padding: 20,
//       title: 'Review & Rating',

//       //TODO: Add Review & Rating.
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         spacing: 10,
//         children: [
//           //green box
//           Container(
//             height: 120,
//             width: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(borderRad10),
//               color: const Color.fromARGB(255, 54, 187, 59),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '${propertyModel.rating}/5',
//                   style: MyTextStyles.ratingStyle.apply(
//                     color: MyColors.white,
//                   ),
//                 ),
//                 Text(
//                   //? NOTE: user review count here
//                   '${propertyModel.rating} Ratings',
//                   style: TextStyle(
//                     color: MyColors.white,
//                   ),
//                 ),
//                 Text(
//                   //? NOTE: user review count here
//                   '${propertyModel.reviews.length} Reviews',
//                   style: TextStyle(
//                     color: MyColors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           //TODO: rating
//           Expanded(
//             child: ListView.builder(
//               itemCount: 5,
//               shrinkWrap: true,
//               physics: AlwaysScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return RatingStartIndicatorComponent(
//                   index: 5 - index,
//                   indicatorValue: Random().nextDouble(),
//                   rating: Random().nextInt(30),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
