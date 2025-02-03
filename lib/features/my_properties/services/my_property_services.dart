// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:owner_resort_booking_app/core/data/services/review_services.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

enum FilterOptions {
  acceding,
  descending,
  priceLowToHigh,
  priceHighToLow,
}

class MyPropertyServices {
  final ReviewServices _reviewServices;
  MyPropertyServices(
    this._reviewServices,
  );
  final _additionalOptionCollection =
      FirebaseFirestore.instance.collection('additional_options');
  final _propertiesCollection =
      FirebaseFirestore.instance.collection('properties');
  final _roomCollectionName = 'rooms';
  //All this owner property with filter enabled
  Future<List<Map<String, dynamic>>> fetchProperties({
    required String uid,
    String? search,
    FilterOptions? filterOptions,
    String? priceRange,
    List<String> category = const [],
    int? rating,
  }) async {
    try {
      //filtering property of the current owner.
      var query = _propertiesCollection.where('ownerId', isEqualTo: uid);

      // if (search != null) {
      //   log('search is working $search');
      //   query
      //       .where('name', isGreaterThanOrEqualTo: search)
      //       .where('name', isLessThanOrEqualTo: search + '\uf8ff');
      // }

      //filter with price range if not null
      if (priceRange != null) {
        final start = double.parse(priceRange.split('-').first);
        final end = double.parse(priceRange.split('-').last);
        query = query.where(
          'roomPrice',
          isGreaterThanOrEqualTo: start,
          isLessThanOrEqualTo: end,
        );
      }

      //with category if any
      if (category.isNotEmpty) {
        query = query.where('type', whereIn: category);
      }

      //with rating if not null
      if (rating != null) {
        query = query.where(
          'rating',
          isGreaterThanOrEqualTo: rating,
          isLessThan: rating + 1,
        );
      }

      //with sorting order if given
      if (filterOptions != null) {
        switch (filterOptions) {
          case FilterOptions.acceding:
            query = query.orderBy('name', descending: false);

          case FilterOptions.descending:
            query = query.orderBy(
              'name',
              descending: true,
            );

          case FilterOptions.priceLowToHigh:
            query = query.orderBy('roomPrice', descending: false);

          case FilterOptions.priceHighToLow:
            query = query.orderBy('roomPrice', descending: true);
        }
      } else {
        query = query.orderBy('name', descending: false);
      }

      final data = await query.get();

      final modelList = data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
      log(data.size.toString());
      for (var property in modelList) {
        final propertyId = property['id'];
        final reviews = await _reviewServices.fetchReviews(propertyId);
        property['reviews'] = reviews;
        final rooms = await fetchPropertyRooms(propertyId: propertyId);
        property['rooms'] = rooms;
      }

      return modelList;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  //Property details
  Future<Map<String, dynamic>> fetchPropertyDetails(
      {required String id}) async {
    try {
      final data = await _propertiesCollection.doc(id).get();
      final property = data.data()!;
      final propertyId = property['id'];
      final reviews = await _reviewServices.fetchReviews(propertyId);
      property['reviews'] = reviews;
      return property;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<void> deleteProperty(String id) async {
    try {
      await _propertiesCollection.doc(id).delete();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  // Future<void>

  Future<List<Map<String, dynamic>>> fetchPropertyRooms(
      {required String propertyId}) async {
    try {
      final data = await _propertiesCollection
          .doc(propertyId)
          .collection(_roomCollectionName)
          .get();
      return data.docs
          .map(
            (e) => e.data(),
          )
          .toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  //Property details
  Future<Map<String, dynamic>> fetchRoomDetails({
    required String propertyId,
    required String roomId,
  }) async {
    try {
      //fetching room details form room collection
      final data = await _propertiesCollection
          .doc(propertyId)
          .collection(_roomCollectionName)
          .doc(roomId)
          .get();
      return data.data()!;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<String>> fetchPropertyCategories() async {
    try {
      final data = await _additionalOptionCollection
          .doc('Property_Categories')
          .collection('data')
          .get();

      return data.docs.map(
        (e) {
          final map = e.data();
          return map['name'] as String;
        },
      ).toList();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
