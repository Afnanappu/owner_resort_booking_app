import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owner_resort_booking_app/core/components/custom_app_bar.dart';
import 'package:owner_resort_booking_app/features/google_map/view_model/bloc/google_map_bloc.dart';

// ignore: must_be_immutable
class ScreenGoogleMap extends StatelessWidget {
  ScreenGoogleMap({super.key});

  // final myCameraPosition = CameraPosition(target: );
  CameraPosition? initialCameraPosition;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<GoogleMapBloc>().add(GoogleMapEvent.mapInitialized());
      },
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Property Location',
        needUnderline: false,
        actions: [
          PopupMenuButton(
            iconSize: 22,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Clear selections'),
                  onTap: () {
                    context
                        .read<GoogleMapBloc>()
                        .add(GoogleMapEvent.clearSelection());
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: BlocBuilder<GoogleMapBloc, GoogleMapState>(
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
          }

          return initialCameraPosition == null
              ? Center(
                  child: Text(
                    'Please wait\ngetting your location...',
                    textAlign: TextAlign.center,
                  ),
                )
              : GoogleMap(
                  initialCameraPosition: initialCameraPosition!,
                  compassEnabled: true,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  rotateGesturesEnabled: true,
                  onMapCreated: (controller) {
                    context
                        .read<GoogleMapBloc>()
                        .getMapController
                        .complete(controller);
                  },
                  onTap: (selectedLocation) {
                    context.read<GoogleMapBloc>().add(
                          GoogleMapEvent.selectLocation(selectedLocation),
                        );
                  },
                  markers: state.maybeWhen(
                    locationSelected: (selectedLocation) => {
                      Marker(
                        markerId: MarkerId('selectedPlace'),
                        icon: BitmapDescriptor.defaultMarker,
                        position: selectedLocation,
                      )
                    },
                    orElse: () => {},
                  ),
                );
        },
      ),
      floatingActionButton: BlocBuilder<GoogleMapBloc, GoogleMapState>(
        builder: (context, state) {
          return ElevatedButton.icon(
            onPressed: () {
              final location = state.maybeWhen(
                locationSelected: (selectedLocation) => selectedLocation,
                orElse: () {},
              );
              log(location.toString());
              context.read<GoogleMapBloc>().add(
                    GoogleMapEvent.confirmLocation(location),
                  );

              context.pop();

              //  showCustomSnackBar(
              //       context: context,
              //       message: 'Some thing happened, can not go forward');
              //   log('Some thing happened, can not go forward');
            },
            label: Text(
              state.maybeWhen(
                locationSelected: (selectedLocation) => 'Select this place',
                orElse: () => 'Use my current location',
              ),
            ),
            icon: Icon(Icons.add_location_alt_outlined),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
