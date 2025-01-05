import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/cubit/amenities_add_cubit.dart';

class ShowDialogAmenities extends StatefulWidget {
  List<AmenitiesModel> selectedAmenities;

  ShowDialogAmenities({
    super.key,
    required this.selectedAmenities,
  });

  @override
  State<ShowDialogAmenities> createState() => _AmenitiesDialogState();
}

class _AmenitiesDialogState extends State<ShowDialogAmenities> {
  @override
  void initState() {
    super.initState();
    context.read<AmenitiesAddCubit>().fetchAmenities();
  }

  void _onAmenityToggle(AmenitiesModel amenity) {
    setState(() {
      if (widget.selectedAmenities.contains(amenity)) {
        widget.selectedAmenities.remove(amenity);
      } else {
        widget.selectedAmenities.add(amenity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Select Amenities",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: BlocBuilder<AmenitiesAddCubit, AmenitiesAddState>(
          builder: (context, state) {
            return state.maybeWhen(
              error: (error) => Center(
                child: Text(error),
              ),
              loading: () => Center(
                child: Text('Loading...'),
              ),
              loaded: (amenities) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: amenities.length,
                  itemBuilder: (context, index) {
                    final amenity = amenities[index];
                    return CheckboxListTile(
                      value: widget.selectedAmenities.contains(amenity),
                      onChanged: (value) => _onAmenityToggle(amenity),
                      title: Row(
                        children: [
                          if (amenity.image != null)
                            Image.memory(
                              base64Decode(amenity.image!),
                              height: 12,
                            ),
                          Text(
                            amenity.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      activeColor: MyColors.orange,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  },
                );
              },
              orElse: () {
                return Center(
                  child:
                      Text('An unexpected error occurred, please try again!'),
                );
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(null),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context
                .read<AmenitiesAddCubit>()
                .updateAmenities(widget.selectedAmenities);
            context.pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.orange,
          ),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
