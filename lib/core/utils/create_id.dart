import 'dart:developer';

String createOwnerId() {
  final numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  numbers.shuffle();
  final id = numbers.join();
  log("New OwnerId created: $id");
  return id;
}
