import '../../general_exports.dart';

/// show alert
void showMessage({
  String? description,
  String? type,
  int? textColor,
  bool withBackground = true,
  int duration = 3,
}) {
  Get.snackbar(
    '',
    '',
    titleText: CommonText(
      style: appTextStyles
          .h3MediumStyleBlack()
          .copyWith(textAlign: TextAlign.start),
      containerStyle: const CommonContainerModel(
          alignment: AlignmentDirectional.centerStart),
      'Alert'.tr,
      // 'Alert'.tr,
      // text: description!,
    ),
    messageText: CommonText(
      style: appTextStyles.h3MediumStyle().copyWith(
            textAlign: TextAlign.start,
          ),
      fontColor: textColor,
      description!,
    ),
    backgroundColor: withBackground ? Colors.white60 : null,
    barBlur: 2,
    duration: Duration(seconds: duration),
  );
}

/// show popup
void showPopUp({Widget? child}) {
  Get.dialog(
    child!,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
  );
}
