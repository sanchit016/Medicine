import 'dart:io';

import 'package:vigorus/file_exporter.dart';

List<dynamic> colors = [
  Colors.pink.shade100,
  Colors.deepPurple.shade100,
  Colors.red.shade200,
  Colors.green.shade100,
  Colors.brown.shade100,
  Colors.blue.shade100,
];

List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
List<String> months = [
  'Janu',
  'Febr',
  'Mar',
  'Apr',
  'May',
  'June',
  'July',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
List<String> frequency = [
  "Everyday",
  "Alternate Days",
  "Once a Week",
  "Once a Month"
];
List<String> times = ["One Time", "Two Times", "Three Times", "Four Times"];

List<String> type = ["Tablet", "Capsule", "Cream", "Lotion"];

List<String> options = [
  "Before Food",
  "After Food",
  "Before Sleep",
  "Empty Stomach"
];

class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
