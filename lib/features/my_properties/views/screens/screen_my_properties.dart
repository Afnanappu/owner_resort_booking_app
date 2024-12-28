import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/core/components/custom_search_bar.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/core/constants/text_styles.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/property_card_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/views/widgets/property_widget.dart';
import 'package:owner_resort_booking_app/routes/route_names.dart';

class ScreenMyProperties extends StatelessWidget {
  ScreenMyProperties({super.key});
  final searchController = SearchController();
  final sortItems = [
    'All'
        'aA-zZ'
        'zZ-aA'
        'Low-to-High',
    'High-to-Low',
  ];

  final propertyList = <PropertyCardModel>[
    PropertyCardModel(
      image: 'assets/images/popular_2.jpg',
      propertyName: 'Banditti Resort',
      location: 'Gulgachi, Kolkatha',
      price: 4290,
      rating: 3.3,
      reviews: 251,
      rooms: 4,
    ),
    PropertyCardModel(
      image: 'assets/images/popular_4.jpg',
      propertyName: 'Banditti Resort',
      location: 'Gulgachi, Kolkatha',
      price: 4290,
      rating: 3.3,
      reviews: 251,
      rooms: 4,
    ),
    PropertyCardModel(
      image: 'assets/images/popular_4.jpg',
      propertyName: 'Banditti Resort',
      location: 'Gulgachi, Kolkatha',
      price: 4290,
      rating: 3.3,
      reviews: 251,
      rooms: 4,
    ),
    PropertyCardModel(
      image: 'assets/images/popular_4.jpg',
      propertyName: 'Banditti Resort',
      location: 'Gulgachi, Kolkatha',
      price: 4290,
      rating: 3.3,
      reviews: 251,
      rooms: 4,
    ),
    PropertyCardModel(
      image: 'assets/images/popular_4.jpg',
      propertyName: 'Banditti Resort',
      location: 'Gulgachi, Kolkatha',
      price: 4290,
      rating: 3.3,
      reviews: 251,
      rooms: 4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: ClampingScrollPhysics(),
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
                      builder: (context) => SizedBox(
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text('Bottom Sheet'),
                              ],
                            ),
                          )),
                    );
                  },
                  icon: Image.asset(
                    'assets/icons/filter.png',
                    height: 20,
                  ),
                )
              ],
            ),
            MySpaces.hSpace20,
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
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: PropertyWidget(
                          image: property.image,
                          propertyName: property.propertyName,
                          location: property.location,
                          rating: property.rating,
                          reviews: property.reviews,
                          rooms: property.rooms,
                          price: property.price,
                        ),
                      );
                    },
                  ),
          ],
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
    );
  }
}
