import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/carousel_image_picked_show_widget.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_divider.dart';
import 'package:owner_resort_booking_app/core/components/custom_elevated_button.dart';
import 'package:owner_resort_booking_app/core/components/custom_snack_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/my_constants.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_room_list/property_room_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_room_details/property_room_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_container_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_list_points_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/about_the_resort_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/main_details_widget_for_property_details.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenMyPropertyDetails extends StatelessWidget {
  const ScreenMyPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Details Resort',
        needUnderline: false,
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Add editing option here
            },
            icon: Icon(Icons.edit_note_outlined),
          ),
          MySpaces.hSpace5,
        ],
      ),
      body: BlocBuilder<PropertyDetailsBloc, PropertyDetailsState>(
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
            loaded: (propertyModel) {
              final rules = propertyModel.extraDetails.rulesDetailsModel;
              final basicDetails = propertyModel.extraDetails.basicDetailsModel;

              return ListView(
                children: [
                  CarouselImagePickedShowWidget(
                    pickedImages: propertyModel.images,
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
                          child: Placeholder(
                            fallbackHeight: 250,
                            strokeWidth: .5,
                          ),
                        ),

                        //Review and rating
                        CustomContainerForPropertyDetails(
                          padding: 20,
                          title: 'Review & Rating',

                          //TODO: Add Review & Rating.
                          child: Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(borderRad10),
                                  color: const Color.fromARGB(255, 54, 187, 59),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${propertyModel.rating ?? 0}/5',
                                      style: MyTextStyles.ratingStyle.apply(
                                        color: MyColors.white,
                                      ),
                                    ),
                                    Text(
                                      //? NOTE: user review count here
                                      '186 Ratings',
                                      style: TextStyle(
                                        color: MyColors.white,
                                      ),
                                    ),
                                    Text(
                                      //? NOTE: user review count here
                                      '1064 Ratings',
                                      style: TextStyle(
                                        color: MyColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
          // context.read<PropertyRoomDetailsBloc>().add(
          //       PropertyRoomDetailsEvent.fetchRoomDetails(
          //         propertyId: 'VwjrXeUAzf7aMsdDaoqR',
          //         roomId: 'RDSMkD1tFfJyatUNjgtX',
          //       ),
          //     );
          context.push('/${AppRoutes.myPropertyRooms}');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
