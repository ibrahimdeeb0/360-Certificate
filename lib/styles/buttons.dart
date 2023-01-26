import '../../general_exports.dart';

final DefaultTextStyles _defaultTextStyles = DefaultTextStyles();
final DefaultContainerStyles _defaultContainerStyles = DefaultContainerStyles();

class DefaultButtonStyles {
  CommonButtonStyle defaultButtonStyle() => CommonButtonStyle(
        containerStyle: _defaultContainerStyles.defaultButtonContainer,
        textStyle: _defaultTextStyles.h3MediumStyleWhite(),
      );
  CommonButtonModel onBoardingButton = const CommonButtonModel(
    width: 0.7,
  );

  CommonButtonModel loginButton() => onBoardingButton.copyWith(height: .06);
}
