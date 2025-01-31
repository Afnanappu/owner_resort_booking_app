double getAverage(List<num> numbers) {
  final result = numbers.fold(
        0.0,
        (previousValue, element) => previousValue + element,
      ) /
      numbers.length;
  if (result.isNaN) {
    return 0.0;
  } else {
    return result;
  }
}
