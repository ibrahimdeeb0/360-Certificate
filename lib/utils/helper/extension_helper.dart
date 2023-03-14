// ignore_for_file: unused_element

import '../../general_exports.dart';

// you have access to the instance in extension methods via 'this' keyword.

extension on DateTime {
  String get humanize {
    return '$day/$month/$year';
  }
}

extension ScreenSize on num {
  double get flexHeight => (DEVICE_HEIGHT * this);

  double get flexWidth => (DEVICE_WIDTH * this);
}

// extension on double {
//   double get flexWidth {
//     return this * DEVICE_WIDTH;
//   }
// }

extension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: DEVICE_HEIGHT * toDouble());

  SizedBox get pw => SizedBox(width: DEVICE_WIDTH * toDouble());
}

//
//DateFormat('dd-MM-yyyy')
         //               .format(DateTime.parse(item['created_at'].toString()))
//
