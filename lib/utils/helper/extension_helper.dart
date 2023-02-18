// ignore_for_file: unused_element

import '../../general_exports.dart';

// you have access to the instance in extension methods via 'this' keyword.

extension on DateTime {
  String get humanize {
    return '$day/$month/$year';
  }
}

extension on double {
  double flexHeight() => (this * DEVICE_HEIGHT);
  //
  // double get flexWidth {
  //   return this * DEVICE_WIDTH;
  // }
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