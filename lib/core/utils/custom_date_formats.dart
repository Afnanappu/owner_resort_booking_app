import 'package:intl/intl.dart';

///Eg: Mon, 17 Jan
///
///Eg: Sat, 18 Oct
String customDateFormat(DateTime date) => DateFormat('E, d MMM').format(date);

///Eg: Jan 20, 3:15 PM
///
///Eg: Aug 2, 6:29 PM
String customDateFormat3(DateTime date) =>
    DateFormat('MMM d, h:mm a').format(date);

///Eg: 15/6/2024
///
///Eg: 29/12/2029
String customDateFormat2(DateTime date) =>
    DateFormat("dd/MM/yyyy").format(date);

//Eg: ₹15,600.00
String customCurrencyFormat(num price, [int? decimal]) => NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: decimal,
    ).format(price);

///Eg: Jan 22, 2025 - 03:45 PM
String customDateFormatWithTime(DateTime date) =>
    DateFormat('MMM dd, yyyy - hh:mm a').format(date);
