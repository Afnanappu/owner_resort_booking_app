import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/constants/spaces.dart';
import 'package:owner_resort_booking_app/features/my_properties/model/filter_data_model.dart';
import 'package:owner_resort_booking_app/features/my_properties/services/my_property_services.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/bloc/bloc_property_list/my_property_list_bloc.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/cubit/filter_data_cubit.dart';
import 'package:owner_resort_booking_app/features/my_properties/view_model/cubit/property_type_cubit.dart';

void openFilterBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => FilterBottomSheet(),
  );
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            // Tab Bar
            TabBar(
              labelColor: MyColors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(text: "Sort Options"), // Tab 1
                Tab(text: "Filters"), // Tab 2
              ],
            ),
            // Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 Content: Sort Options
                  _SortOptionsTab(),
                  // Tab 2 Content: Filters
                  _FiltersTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SortOptionsTab extends StatefulWidget {
  @override
  State<_SortOptionsTab> createState() => _SortOptionsTabState();
}

class _SortOptionsTabState extends State<_SortOptionsTab> {
  // Variable to hold the selected sort option
  FilterOptions? _selectedSortOption;

  @override
  void initState() {
    super.initState();

    _selectedSortOption = context.read<FilterDataCubit>().state?.filterOptions;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Sorting options with selection state
        ListTile(
          title: Text("aA-zZ"),
          leading: Icon(Icons.sort_by_alpha),
          trailing: _selectedSortOption == FilterOptions.acceding
              ? Icon(Icons.check, color: Colors.blue)
              : null,
          onTap: () {
            setState(() {
              _selectedSortOption = FilterOptions.acceding;
            });
          },
        ),
        ListTile(
          title: Text("zZ-aA"),
          leading: Icon(Icons.sort_by_alpha_rounded),
          trailing: _selectedSortOption == FilterOptions.descending
              ? Icon(Icons.check, color: Colors.blue)
              : null,
          onTap: () {
            setState(() {
              _selectedSortOption = FilterOptions.descending;
            });
          },
        ),
        ListTile(
          title: Text("Low To High (Price)"),
          leading: Icon(Icons.arrow_upward),
          trailing: _selectedSortOption == FilterOptions.priceLowToHigh
              ? Icon(Icons.check, color: Colors.blue)
              : null,
          onTap: () {
            setState(() {
              _selectedSortOption = FilterOptions.priceLowToHigh;
            });
          },
        ),
        ListTile(
          title: Text("High To Low (Price)"),
          leading: Icon(Icons.arrow_downward),
          trailing: _selectedSortOption == FilterOptions.priceHighToLow
              ? Icon(Icons.check, color: Colors.blue)
              : null,
          onTap: () {
            setState(() {
              _selectedSortOption = FilterOptions.priceHighToLow;
            });
          },
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  final filterCubit = context.read<FilterDataCubit>();

                  if (filterCubit.state == null) {
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    final filterModel = FilterDataModel(
                      uid: uid,
                      filterOptions: _selectedSortOption,
                    );

                    filterCubit.setFilterData(filterModel);
                  } else {
                    final model = filterCubit.state;
                    model?.filterOptions = _selectedSortOption;
                    filterCubit.setFilterData(model!);
                  }

                  final filterModel = filterCubit.state!;

                  context.read<FilterDataCubit>().setFilterData(
                        FilterDataModel(
                          uid: filterModel.uid,
                          category: filterModel.category,
                          filterOptions: filterModel.filterOptions,
                          priceRange: filterModel.priceRange,
                          rating: filterModel.rating,
                        ),
                      );

                  context.read<MyPropertyListBloc>().add(
                        MyPropertyListEvent.fetchProperties(
                          uid: filterModel.uid,
                          category: filterModel.category,
                          filterOptions: filterModel.filterOptions,
                          priceRange: filterModel.priceRange,
                          rating: filterModel.rating,
                        ),
                      );

                  context.pop();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: MyColors.orange),
                child: Text("Apply"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _FiltersTab extends StatefulWidget {
  @override
  State<_FiltersTab> createState() => _FiltersTabState();
}

class _FiltersTabState extends State<_FiltersTab> {
  RangeValues _priceRange = RangeValues(0, 4000);

  int? _selectedRating;

  final List<String> _selectedResortTypes = [];

  @override
  void initState() {
    super.initState();

    context.read<PropertyTypeCubit>().fetchRoomCategories();
    final cubit = context.read<FilterDataCubit>();
    _selectedRating = cubit.state?.rating;
    _selectedResortTypes.addAll(cubit.state?.category ?? []);
    final price = cubit.state?.priceRange;
    if (price != null) {
      final start = double.parse(price.split('-').first);
      final end = double.parse(price.split('-').last);
      _priceRange = RangeValues(start, end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Price Range Selector
        ListTile(
          title: Text("Price Range"),
          leading: Icon(Icons.attach_money),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              RangeSlider(
                values: _priceRange,
                min: 0,
                max: 10000,
                divisions: 50,
                labels: RangeLabels(
                  "₹${_priceRange.start.round()}",
                  "₹${_priceRange.end.round()}",
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;
                  });
                },
                activeColor: MyColors.orange,
              ),
              Text(
                "Range: ₹${_priceRange.start.round()} - ₹${_priceRange.end.round()}",
              ),
            ],
          ),
        ),
        Divider(),

        // Rating Selector
        ListTile(
          title: Text("Rating"),
          leading: Icon(Icons.star),
          trailing: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _selectedRating = null;
              });
            },
          ),
        ),
        Column(
          children: List.generate(5, (index) {
            return RadioListTile<int>(
              title: Text("${index + 1} Star${index > 0 ? "s" : ""}"),
              value: index + 1,
              groupValue: _selectedRating,
              onChanged: (value) {
                setState(() {
                  _selectedRating = value;
                });
              },
            );
          }),
        ),
        Divider(),

        // Resort Type Selector with Chips
        ListTile(
          title: Text("Resort Type"),
          leading: Icon(Icons.beach_access),
          trailing: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _selectedResortTypes.clear(); // Clear all selected resort types
              });
            },
          ),
        ),
        BlocBuilder<PropertyTypeCubit, List<String>>(
          builder: (context, resortTypes) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: resortTypes.isEmpty
                  ? Center(
                      child: Text('Categories are empty'),
                    )
                  : Wrap(
                      spacing: 8.0,
                      children: resortTypes.map((type) {
                        final isSelected = _selectedResortTypes.contains(type);
                        return ChoiceChip(
                          label: Text(type),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _selectedResortTypes.add(type);
                              } else {
                                _selectedResortTypes.remove(type);
                              }
                            });
                          },
                          selectedColor: MyColors.orange,
                          backgroundColor: Colors.grey.shade200,
                          // iconTheme: IconThemeData(
                          //   color: MyColors.white,
                          // ),
                          checkmarkColor: MyColors.white,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? MyColors.white
                                : Colors.grey.shade800,
                          ),
                        );
                      }).toList(),
                    ),
            );
          },
        ),
        MySpaces.hSpace20,

        // Bottom buttons for Apply and Clear
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Clear Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Reset all filters
                    _priceRange = RangeValues(100, 1000);
                    _selectedRating = null;
                    _selectedResortTypes.clear();

                    final uid = FirebaseAuth.instance.currentUser!.uid;

                    context.read<FilterDataCubit>().setFilterData(
                          FilterDataModel(
                            uid: uid,
                            category: [],
                            filterOptions: null,
                            priceRange: null,
                            rating: null,
                          ),
                        );

                    context.pop();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: Text("Clear"),
              ),

              // Apply Button
              ElevatedButton(
                onPressed: () {
                  final uid = FirebaseAuth.instance.currentUser!.uid;

                  final filterCubit = context.read<FilterDataCubit>();
                  FilterOptions? filterOption =
                      filterCubit.state?.filterOptions;

                  final priceRange = '${_priceRange.start}-${_priceRange.end}';

                  context.read<MyPropertyListBloc>().add(
                        MyPropertyListEvent.fetchProperties(
                          uid: uid,
                          category: _selectedResortTypes,
                          filterOptions: filterOption,
                          priceRange: priceRange,
                          rating: _selectedRating,
                        ),
                      );

                  context.read<FilterDataCubit>().setFilterData(
                        FilterDataModel(
                          uid: uid,
                          category: _selectedResortTypes,
                          filterOptions: filterOption,
                          priceRange: priceRange,
                          rating: _selectedRating,
                        ),
                      );

                  print("Applying Filters:");
                  print(
                      "Price: ₹${_priceRange.start.round()} - ₹${_priceRange.end.round()}");
                  print("Rating: $_selectedRating Stars");
                  print("Resort Types: $_selectedResortTypes");
                },
                child: Text("Apply"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
