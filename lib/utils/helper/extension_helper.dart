// ignore_for_file: unused_element

import 'package:intl/intl.dart';

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

  double get flexAll => ((DEVICE_WIDTH * this) + (DEVICE_HEIGHT * this));
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
  SizedBox get boxHeight => SizedBox(height: DEVICE_HEIGHT * toDouble());

  SizedBox get boxWidth => SizedBox(width: DEVICE_WIDTH * toDouble());
}

extension FormatTime on String {
  //DateFormat.jm().format(DateTime.parse(item['created_at'])),
  String get formatFullDate {
    return '${DateFormat('dd/MM/yyy').format(DateTime.parse(this))}   ${DateFormat.jm().format(DateTime.parse(this))}';
  }

  String get formatDate {
    return DateFormat('dd/MM/yyy').format(DateTime.parse(this));
  }

  String get formatTime {
    return DateFormat.jm().format(DateTime.parse(this));
  }
}
