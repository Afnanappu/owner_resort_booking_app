import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:owner_resort_booking_app/core/data/models/review_model.dart';
import 'package:owner_resort_booking_app/core/utils/exceptions/custom_exceptions.dart';

class ReviewServices {
  final __propertyCollection =
      FirebaseFirestore.instance.collection('properties');
  final _reviewCollectionName = 'reviews';

  Future<void> addReview(ReviewModel review) async {
    try {
      final doc = __propertyCollection
          .doc(review.propertyId)
          .collection(_reviewCollectionName)
          .doc();
      review.reviewId = doc.id;
      await doc.set(review.toMap());
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<List<Map<String, dynamic>>> fetchReviews(String propertyId) async {
    try {
      final data = await __propertyCollection
          .doc(propertyId)
          .collection(_reviewCollectionName)
          .get();
      final list = <Map<String, dynamic>>[];
      for (var e in data.docChanges) {
        if (e.doc.data() != null) {
          list.add(e.doc.data()!);
        }
      }

      return list;
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }

  Future<Map<String, dynamic>?> fetchMyReview(
      {required String propertyId, required String bookingId}) async {
    try {
      final data = await __propertyCollection
          .doc(propertyId)
          .collection(_reviewCollectionName)
          .where('bookingId', isEqualTo: bookingId)
          .get();

      return data.docs.firstOrNull?.data();
    } on FirebaseException catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleFirestoreException(e);
    } catch (e, stack) {
      log(e.toString(), stackTrace: stack);
      throw AppExceptionHandler.handleGenericException(e);
    }
  }
}
