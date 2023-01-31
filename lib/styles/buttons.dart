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

  // CommonButtonModel loginButton() => onBoardingButton.copyWith(height: .06);

  CommonButtonStyle loginButton({int? color}) => defaultButtonStyle().copyWith(
        containerStyle:
            appButtonStyles.defaultButtonStyle().containerStyle!.copyWith(
                  width: 1,
                  marginBottom: 0.03,
                ),
        style: appButtonStyles.defaultButtonStyle().style!.copyWith(
              backgroundColor: color,
            ),
      );

//* Forms Style
  CommonButtonModel bgGreyTextPrimaryStyle = CommonButtonModel(
    width: 0.2,
    height: 0.04,
    borderRadius: 0.015,
    backgroundColor: Colors.grey.withOpacity(0.2),
    textStyle: appTextStyles.h3StylePrimary(),
  );
}
