import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(iconData, size: 28),
        const SizedBox(height: 10),
        Text('$value'),
        const SizedBox(height: 10),
        Text(units),
      ],
    );
  }
}
