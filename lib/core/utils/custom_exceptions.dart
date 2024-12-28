import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

class AppExceptionHandler {
  /// Handles FirebaseAuthException
  static String handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No user found with these credentials.';
      case 'wrong-password':
        return 'The password is incorrect. Please try again.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'operation-not-allowed':
        return 'This sign-in method is currently not allowed.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        return 'An unexpected authentication error occurred: ${e.message}';
    }
  }

  /// Handles FirestoreException
  static String handleFirestoreException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'unavailable':
        return 'The Firestore service is currently unavailable.';
      case 'not-found':
        return 'The requested document was not found.';
      case 'already-exists':
        return 'The document already exists.';
      case 'resource-exhausted':
        return 'Quota exceeded. Please try again later.';
      default:
        return 'An unexpected Firestore error occurred: ${e.message}';
    }
  }

  /// Handles GoogleSignInException
  static String handleGoogleSignInException(Exception e) {
    if (e is FirebaseAuthException) {
      return handleFirebaseAuthException(e);
    } else if (e is SocketException) {
      return 'Network issue: ${e.message}. Please check your connection.';
    } else {
      return 'An unexpected error occurred during Google Sign-In: ${e.toString()}';
    }
  }

  /// Handles network-related exceptions
  static String handleNetworkException(Object e) {
    if (e is SocketException) {
      return 'Network issue: ${e.message}. Please check your connection.';
    } else if (e is HttpException) {
      return 'HTTP error: ${e.message}. Please try again later.';
    } else if (e is TimeoutException) {
      return 'The request timed out. Please try again later.';
    } else {
      return 'An unexpected network error occurred.';
    }
  }

  static String handleFormatException(FormatException e) {
    return 'A format exception is occurred, try again';
  }

  /// Handles general exceptions
  static String handleGenericException(Object e) {
    if (e is FirebaseAuthException) {
      return handleFirebaseAuthException(e);
    } else if (e is FirebaseException) {
      return handleFirestoreException(e);
    } else if (e is FormatException) {
      return handleFormatException(e);
    } else if (e is SocketException ||
        e is HttpException ||
        e is TimeoutException) {
      return handleNetworkException(e);
    } else {
      return 'An unexpected error occurred: ${e.toString()}';
    }
  }
}
