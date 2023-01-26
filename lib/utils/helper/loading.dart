import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../general_exports.dart';

/// start loading spinner
void startLoading() {
  SmartDialog.showLoading(
    // msg: '',
    // maskColorTemp: Colors.black54,
    // clickBgDismissTemp: true,
    builder: (BuildContext context) => CircularProgressIndicator(
      strokeWidth: 5,
      valueColor: AlwaysStoppedAnimation<Color>(
        Color(
          AppColors.primary,
        ),
      ),
    ),
  );
}

/// start loading spinner
void startLoadingBooking({String? msg}) {
  SmartDialog.showLoading(
    msg: msg ?? 'reservation_being_sent'.tr,
  );
}

/// stop loading spinner
void dismissLoading() {
  SmartDialog.dismiss();
}
