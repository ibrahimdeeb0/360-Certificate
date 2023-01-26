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
}
