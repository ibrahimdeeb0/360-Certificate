import '../../general_exports.dart';

void openDialog({
  String? title,
  String? description,
  String? confirmText,
  String? cancelText,
  Function()? onConfirm,
  Function()? onCancel,
  Widget? child,
}) {
  Get.defaultDialog(
    backgroundColor: Colors.white,
    barrierDismissible: false,
    contentPadding: EdgeInsets.symmetric(
      horizontal: DEVICE_WIDTH * 0.03,
      vertical: DEVICE_HEIGHT * 0.015,
    ),
    title: title ?? 'Alert',
    content: child ??
        CommonText(
          description ?? 'Save this form as a template',
          style: appTextStyles.h3StyleBlack(),
        ),
    confirm: CommonButton(
      onPress: onConfirm?.call,
      text: confirmText ?? 'Confirm',
      // buttonStyle: appButtonStyles.dialogConfirmBTN,
      width: 0.3,
      height: 0.045,
      borderRadius: 0.02,
      backgroundColor: AppColors.primary,
      marginLeft: 0.02,
    ),
    cancel: CommonButton(
      onPress: onCancel?.call,
      text: cancelText ?? 'Cancel',
      fontColor: AppColors.primary,
      width: 0.3,
      height: 0.045,
      borderColor: AppColors.primary,
      borderWidth: 1,
      borderRadius: 0.015,
      backgroundColor: AppColors.white,
    ),
  );
}

Future<dynamic> formsDialog({
  String? title,
  String? description,
}) {
  return Get.defaultDialog(
    title: title ?? 'title',
    content: CommonText(
      description ?? 'Description',
      style: appTextStyles.h4StyleBlack(),
      marginTop: 0.01,
      marginBottom: 0.01,
    ),
    // onConfirm: Get.back,
    confirm: CommonButton(
      onPress: Get.back,
      text: 'Ok',
      height: 0.045,
      width: 0.5,
    ),
    backgroundColor: Colors.white,
  );
}

Future<dynamic> openSimpleDialog({
  Widget? titleIcon,
  String? title,
  String? description,
  String? btnText,
  Function()? onPress,
}) {
  return Get.dialog(
    CustomDialog(
      description: description,
      onPress: onPress,
      title: title,
      titleIcon: titleIcon,
      btnText: btnText,
    ),
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.titleIcon,
    this.title,
    this.description,
    this.btnText,
    this.onPress,
  });
  final Widget? titleIcon;
  final String? title;
  final String? description;
  final String? btnText;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: CommonText(
        title ?? '',
        marginTop: titleIcon != null ? 0.025 : null,
        fontWeight: FontWeight.bold,
        topChild: titleIcon,
      ),
      content: CommonText(
        description ?? '',
        fontSize: fontH3,
        fontColor: Colors.grey[700],
      ),
      actions: <Widget>[
        CommonButton(
          text: btnText ?? '',
          onPress: onPress,
          width: 1,
        ),
      ],
    );
  }
}
