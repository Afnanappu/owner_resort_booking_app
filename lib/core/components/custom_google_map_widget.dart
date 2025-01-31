import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapWidget extends StatelessWidget {
  const CustomGoogleMapWidget({
    super.key,
    required this.initialCameraPosition,
    this.onMapCreated,
    this.onTap,
    this.markers = const {},
  });

  final CameraPosition? initialCameraPosition;
  final void Function(GoogleMapController)? onMapCreated;
  final void Function(LatLng)? onTap;
  final Set<Marker> markers;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition!,
      compassEnabled: true,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      rotateGesturesEnabled: true,
      onMapCreated: onMapCreated,
      onTap: onTap,
      markers: markers,
    );
  }
}
