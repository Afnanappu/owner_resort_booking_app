import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_search_bar.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/core/utils/debouncer.dart';
import 'package:owner_resort_booking_app/core/utils/math_functions.dart';
import 'package:owner_resort_booking_app/core/utils/screen_size.dart';
import 'package:owner_resort_booking_app/core/data/view_model/bloc/bloc_google_map/google_map_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_details/property_details_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/components/custom_filter_widget.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/property_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenMyProperties extends StatelessWidget {
  ScreenMyProperties({super.key});
  final searchController = SearchController();
  final height = MyScreenSize.height * .65;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            final uid = FirebaseAuth.instance.currentUser!.uid;
            context.read<MyPropertyListBloc>().add(
                  MyPropertyListEvent.fetchProperties(uid: uid),
                );
          },
          edgeOffset: 170,
          child: ListView(
            physics: AlwaysScrollableScrollPhysics(),
            children: [
              CustomAppBar(
                title: 'Property Management',
              ),
              MySpaces.hSpace10,
              CustomSearchBar(
                searchController: searchController,
                trailing: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => FilterBottomSheet(),
                      );
                    },
                    icon: Image.asset(
                      'assets/icons/filter.png',
                      height: 20,
                    ),
                  )
                ],
                onChanged: (value) {
                  Debouncer().call(() {
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    context.read<MyPropertyListBloc>().add(
                          MyPropertyListEvent.fetchProperties(
                            uid: uid,
                            search: value.trim(),
                          ),
                        );
                  });
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return [];
                },
              ),
              MySpaces.hSpace20,
              BlocBuilder<MyPropertyListBloc, MyPropertyListState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    initial: () => SizedBox(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 48, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Welcome! Start exploring properties.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    error: (message) => SizedBox(
                      height: height,
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                            color: MyColors.error,
                          ),
                        ),
                      ),
                    ),
                    loading: () => SizedBox(
                      height: height,
                      child: Center(
                        child: Text(
                          'Loading...',
                        ),
                      ),
                    ),
                    loaded: (propertyList) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Properties (${propertyList.length})',
                            style: MyTextStyles.titleMediumSemiBoldBlack,
                          ),
                          MySpaces.hSpace10,
                          propertyList.isEmpty
                              ? Center(
                                  child: Text('No property added'),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: propertyList.length,
                                  itemBuilder: (context, index) {
                                    final property = propertyList[index];
                                    final ratingAvg = getAverage(
                                      property.reviews
                                          .map(
                                            (e) => e.rating,
                                          )
                                          .toList(),
                                    );
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: PropertyWidget(
                                        image: property.image.base64file,
                                        propertyName: property.name,
                                        location: property.location,
                                        rating: ratingAvg,
                                        reviews: property.reviews.map(
                                          (e) {
                                            return e.feedback;
                                          },
                                        ).toList(),
                                        rooms: property.rooms,
                                        price: property.price,
                                        onTap: () {
                                          context.push(
                                              '/${AppRoutes.myPropertyDetails}');

                                          //Loading the property details for next screen
                                          context
                                              .read<PropertyDetailsBloc>()
                                              .add(
                                                PropertyDetailsEvent
                                                    .fetchPropertyDetails(
                                                  id: property.id!,
                                                ),
                                              );

                                          final latLng = LatLng(
                                            property.location.latitude,
                                            property.location.longitude,
                                          );
                                          context.read<GoogleMapBloc>().add(
                                                GoogleMapEvent.mapInitialized(
                                                  latLng,
                                                ),
                                              );
                                          context.read<GoogleMapBloc>().add(
                                                GoogleMapEvent.confirmLocation(
                                                  latLng,
                                                ),
                                              );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ],
                      );
                    },
                    orElse: () {
                      return Center(
                        child: Text('Something unexpected happened, try again'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/${AppRoutes.addProperties}');
        },
        child: Icon(
          Icons.add,
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
