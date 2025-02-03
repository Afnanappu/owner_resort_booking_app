import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_google_map_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_list_points_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/about_the_resort_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/app_bar_for_my_property_details_screen.dart';
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
      appBar: AppBarForMyPropertyDetailsScreen(),
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
                        _locationBuilder(),

                        //Review and rating
                        ReviewAndRatingWidget(
                          reviews: propertyModel.reviews,
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

  CustomContainerForPropertyDetails _locationBuilder() {
    return CustomContainerForPropertyDetails(
      title: 'Location',
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
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (controller) {
                      context
                          .read<GoogleMapBloc>()
                          .getMapController
                          .complete(controller);
                    },
                    markers: state.maybeWhen(
                      locationConfirmed: (selectedLocation) => {
                        Marker(
                          markerId: MarkerId('selectedPlace'),
                          icon: BitmapDescriptor.defaultMarker,
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
    );
  }
}
