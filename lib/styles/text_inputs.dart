import '../../general_exports.dart';

class DefaultTextInputStyles {
  // CommonInput defaultTextInputModel() => const CommonInput(
  //       fontSize: fontH3,
  //     );
  CommonInputModel defaultTextInput() => const CommonInputModel(
        fontSize: fontH5,
      );

  CommonInputModel loginTextInput() => CommonInputModel(
        fillColor: AppColors.grey,
        borderWidth: 0,
      );

  CommonInputModel hintStyle = CommonInputModel(
    contentPaddingHorizontal: 0.02,
    marginBottom: 0.025,
    borderWidth: 0.1,
    borderColor: AppColors.greyLightBorder,
  );

  CommonTextInputModel loginTextInputWithIcon({
    String? hint,
    // bool? enable = true,
    IconData? prefixIcon,
    IconData? suffixIcon,
    TextInputType? textInputType,
  }) =>
      CommonTextInputModel(
        textInputAction: TextInputAction.next,
        textInputType: textInputType ?? TextInputType.emailAddress,
        focusBorderColor: AppColors.primary,
        hint: hint,
        radius: 4,
        maxLines: 1,
        fillColor: AppColors.white,
        hintColor: AppColors.grey,
        //enabled: enable,
        borderWidth: 0,
        contentPaddingVertical: DEVICE_HEIGHT * 0.021,
        prefixIcon: prefixIcon != null
            ? CommonIcon(
                path: prefixIcon,
                color: AppColors.grey,
              )
            : null,
        prefixMinWidth: DEVICE_WIDTH * 0.1,
        suffixIcon: suffixIcon != null
            ? CommonIcon(
                path: suffixIcon,
              )
            : null,
        suffixMinWidth: DEVICE_WIDTH * 0.1,
      );
}
