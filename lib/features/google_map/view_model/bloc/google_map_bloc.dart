import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:owner_resort_booking_app/core/models/location_model.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/google_map_exception.dart';

part 'google_map_bloc.freezed.dart';
part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  GoogleMapBloc() : super(_Initial()) {
    late LatLng myLocation;

    ///initialization of map and getting current user location
    on<_MapInitialized>((event, emit) async {
      try {
        myLocation = await getCurrentLocation();
        log('Current location: $myLocation');
        final cameraPosition = CameraPosition(
          target: LatLng(myLocation.latitude, myLocation.longitude),
          zoom: 13,
        );

        //emit initial location
        emit(
          GoogleMapState.mapLoaded(
            cameraPosition: cameraPosition,
            selectedMarker: {},
          ),
        );
      } on GoogleMapException catch (e) {
        emit(GoogleMapState.error(e.toString()));
      } catch (e) {
        emit(
          GoogleMapState.error(
              "An error occurred while initializing the map: $e"),
        );
      }
    });

    ///location selection
    on<_SelectLocation>(
      (event, emit) {
        log('Current location: ${event.selectedLocation}');
        //emit selected location
        emit(
          GoogleMapState.locationSelected(
            selectedLocation: event.selectedLocation,
          ),
        );
      },
    );

    /// Clearing the current location selections
    on<_ClearSelection>(
      (event, emit) {
        emit(GoogleMapState.initial());
      },
    );

    ///Confirm selection, take current location if selected location is null
    on<_ConfirmLocation>(
      (event, emit) async {
        LatLng? location = event.selectedLocation;

        location ??= myLocation;
        log('Current location: $location');
        late final Address address;
        late final String addressLocation;
        try {
          address = await getAddressFromLatLng(location);
          addressLocation =
              "${address.streetAddress ?? ''}, ${address.city ?? ''}, ${address.region ?? ''}, ${address.countryName ?? ''}";
        } catch (e, stack) {
          log(e.toString(), stackTrace: stack);
          emit(GoogleMapState.error(e.toString()));
        }

        if (addressLocation.contains('Throttled')) {
          log('find it is throttled, so assigning location directly');
          addressLocation =
              "${location.latitude.toStringAsFixed(3)}° N, ${location.longitude.toStringAsFixed(3)}° W";
        } else {
          log('No throttled');
        }
        log('Current address: $address');
        final locationModel = LocationModel(
          latitude: location.latitude,
          longitude: location.longitude,
          address: addressLocation,
        );
        emit(
            GoogleMapState.locationConfirmed(confirmedLocation: locationModel));
      },
    );
  }

  ///Map Controller
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  ///Location Controller
  final Location _locationController = Location();

  ///Map controller getter
  Completer<GoogleMapController> get getMapController => _mapController;

  ///Location controller getter
  Location get getLocationController => _locationController;

  Future<LatLng> getCurrentLocation() async {
    bool isServiceEnabled;
    PermissionStatus permissionGranted;

    try {
      isServiceEnabled = await _locationController.serviceEnabled();

      if (!isServiceEnabled) {
        isServiceEnabled = await _locationController.requestService();
        if (!isServiceEnabled) {
          throw GoogleMapException(
              "Location Service is not enabled, try to enable it!");
        }
      }

      permissionGranted = await _locationController.hasPermission();

      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _locationController.requestPermission();
        if (permissionGranted == PermissionStatus.denied ||
            permissionGranted == PermissionStatus.deniedForever) {
          throw GoogleMapException("Location permissions are not granted.");
        }
      }

      final location = await _locationController.getLocation();

      if (location.latitude == null || location.longitude == null) {
        throw GoogleMapException(
            'Due to some issue, we can\'t retrieve the location, try again');
      }

      return LatLng(location.latitude!, location.longitude!);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }

    // return _locationController.getLocation();
    // _locationController.onLocationChanged.listen(
    //   (location) {
    //     if (location.latitude != null && location.longitude != null) {
    //       // setState(() async {
    //       //   _myPosition = LatLng(location.latitude!, location.longitude!);
    //       //   // await goToAnyLocation(_myPosition);
    //       //   log('Current location = $_myPosition');
    //       // });
    //     }
    //   },
    // );
  }

  Future<void> goToAnyLocation(LatLng? latLng) async {
    try {
      final GoogleMapController controller = await _mapController.future;
      if (latLng == null) {
        log('latLng is null, can\'t change camera position');
        throw GoogleMapException('Google map is facing some issue');
      }
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng,
            zoom: 18,
            bearing: 0,
            tilt: 50,
          ),
        ),
      );
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    }
  }

//Function to get the latitude and longitude of the address.
  Future<LatLng?> getLatLngFromAddress(String address) async {
    try {
      final coordinates = await GeoCode().forwardGeocoding(address: address);
      log('coordinates: ${coordinates.latitude}, ${coordinates.longitude}');
      if (coordinates.latitude == null || coordinates.longitude == null) {
        log('Can\'t get any location from the query, returning null');
        throw GoogleMapException('Can\'t find any location');
      }
      return LatLng(coordinates.latitude!, coordinates.longitude!);
    } catch (e) {
      rethrow;
    }
  }

  Future<Address> getAddressFromLatLng(LatLng latLng) async {
    try {
      final address = await GeoCode().reverseGeocoding(
          latitude: latLng.latitude, longitude: latLng.longitude);
      return address;
    } on GeocodeException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
