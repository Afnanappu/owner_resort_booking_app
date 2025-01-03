import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:owner_resort_booking_app/core/constants/my_colors.dart';
import 'package:owner_resort_booking_app/core/models/amenities_model.dart';
import 'package:owner_resort_booking_app/features/add_property/view_model/cubit/amenities_add_cubit.dart';

class ShowDialogAmenities extends StatefulWidget {
  final List<AmenitiesModel> amenities;

  const ShowDialogAmenities({
    super.key,
    required this.amenities,
  });

  @override
  State<ShowDialogAmenities> createState() => _AmenitiesDialogState();
}

class _AmenitiesDialogState extends State<ShowDialogAmenities> {
  late List<AmenitiesModel> _selectedAmenities;

  @override
  void initState() {
    super.initState();
    _selectedAmenities = context.read<AmenitiesAddCubit>().state;
  }

  void _onAmenityToggle(AmenitiesModel amenity) {
    setState(() {
      if (_selectedAmenities.contains(amenity)) {
        _selectedAmenities.remove(amenity);
      } else {
        _selectedAmenities.add(amenity);
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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.amenities.length,
          itemBuilder: (context, index) {
            final amenity = widget.amenities[index];
            return CheckboxListTile(
              value: _selectedAmenities.contains(amenity),
              onChanged: (value) => _onAmenityToggle(amenity),
              title: Row(
                children: [
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
                .updateAmenities(_selectedAmenities);
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
