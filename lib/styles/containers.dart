import '../../general_exports.dart';

class DefaultContainerStyles {
  CommonContainerModel containerStyles = const CommonContainerModel(
    width: 1,
    height: 1,
    paddingHorizontal: 0.04,
    backgroundColor: Colors.white,
  );

  CommonContainerModel defaultButtonContainer = const CommonContainerModel(
    width: 1,
    height: 0.06,
  );

  CommonContainerModel linkStyle = CommonContainerModel(
    touchEffect: TouchableEffect(
      type: TouchTypes.opacity,
    ),
  );

  CommonContainerModel genderItemStyle() =>
      CommonContainerStyle().fullShadow.copyWith(
            paddingHorizontal: 0.01,
            paddingVertical: 0.01,
            marginVertical: 0.01,
            minWidth: 0.5,
            touchEffect: TouchableEffect(
              type: TouchTypes.opacity,
            ),
          );

  CommonContainerModel greyCardContainer = CommonContainerModel(
    backgroundColor: AppColors.greyLight,
    paddingHorizontal: 0.03,
    paddingVertical: 0.01,
    alignment: Alignment.center,
    borderRadius: 0.02,
    // height: isRTL ? 0.035 : 0.03,
    // bottom shadow
    shadowSpreadRadius: -10.0,
    shadowBlurRadius: 8.0,
    shadowOffsetDY: 13.0,
    shadowOpacity: 0.1,
  );

  CommonContainerModel dialogContainer({double? height}) =>
      CommonContainerModel(
        height: height ?? 0.4,
        paddingHorizontal: 0.04,
        backgroundColor: AppColors.white,
        borderRadius: 0.05,
        borderColor: AppColors.primary,
        borderWidth: 1.5,
        marginHorizontal: 0.08,
        width: 1,
      );

  CommonContainerModel bottomSheetContainer({double? height}) =>
      CommonContainerModel(
        height: height ?? 0.5,
        paddingHorizontal: 0.04,
        backgroundColor: AppColors.white,
        topLeftRadius: 0.08,
        topRightRadius: 0.08,
        width: 1,
        marginTop: 0.1,
      );

  CommonContainerModel sheetContainer = const CommonContainerModel(
    height: 0.3,
    backgroundColor: Colors.white,
    topRightRadius: 0.05,
    topLeftRadius: 0.05,
    borderRadius: 0.02,
    shadowSpreadRadius: -10.0,
    shadowBlurRadius: 20.0,
    shadowOffsetDY: -15.0,
    shadowOpacity: 0.2,
    paddingTop: 0.02,
  );
  CommonContainerModel lineSeparator = CommonContainerModel(
    height: 0.01,
    marginVertical: 0.02,
    backgroundColor: AppColors.greyInputs,
  );

  CommonContainerModel divider = CommonContainerModel(
    width: 1,
    marginBottom: 0.02,
    height: 0.003,
    backgroundColor: AppColors.greyLight,
  );
  CommonContainerModel dividerWithCopy() =>
      divider.copyWith(width: 0.1, marginHorizontal: 0.01, marginTop: 0.003);

  CommonContainerModel onBoardingDivider() => divider.copyWith(
      backgroundColor: AppColors.greyLightBorder, width: 0.7, height: 0.002);

  CommonContainerModel profileDivider() => divider.copyWith(
      backgroundColor: Colors.grey, width: 0.84, height: 0.001);

  CommonContainerModel sliderShadowContainer =
      CommonContainerStyle().fullShadow.copyWith(
            marginHorizontal: 0.1,
            marginBottom: 0.01,
            paddingHorizontal: 0.02,
            paddingTop: 0.01,
            borderRadius: 0.01,
            shadowBlurRadius: 6.0,
            height: 0.1,
          );

  CommonContainerModel sliderContainer = const CommonContainerModel(
    width: 0.9,
    height: 0.24,
    borderRadius: 0.02,
    clipBehavior: Clip.hardEdge,
  );
  CommonContainerModel loginDivider() =>
      dividerWithCopy().copyWith(width: 0.2, marginHorizontal: 0.02);

  CommonContainerModel defaultBottomSheetContainer(
          {double? paddingHorizontal}) =>
      CommonContainerModel(
        paddingHorizontal: paddingHorizontal ?? 0.04,
        backgroundColor: AppColors.white,
        topLeftRadius: 0.07,
        topRightRadius: 0.07,
        width: 1,
        marginTop: 0.1,
      );

  CommonContainerModel primaryClrCard = CommonContainerModel(
    width: 1,
    marginTop: 0.03,
    paddingHorizontal: 0.03,
    paddingVertical: 0.02,
    borderRadius: 0.02,
    backgroundColor: AppColors.primary,
    touchEffect: TouchableEffect(
      type: TouchTypes.opacity,
      opacity: 0.8,
    ),
  );

  CommonContainerModel bottomBorderStyle = CommonContainerModel(
    width: 1,
    paddingVertical: 0.02,
    borderBottomWidth: 2,
    borderBottomColor: AppColors.greyLight,
    touchEffect: TouchableEffect(
      type: TouchTypes.opacity,
      opacity: 0.7,
    ),
  );
  CommonContainerModel bottomBorder = CommonContainerModel(
    width: 1,
    paddingHorizontal: 0.04,
    borderBottomWidth: 3,
    borderBottomColor: AppColors.greyLight,
    marginBottom: 0.02,
    paddingBottom: 0.01,
  );
//** */
  CommonContainerModel loginContainer = CommonContainerModel(
    backgroundColor: AppColors.white,
    width: 1,
    //height: .4,
    topLeftRadius: 0.06,
    topRightRadius: 0.06,
    paddingHorizontal: 0.06,
    paddingVertical: 0.02,
  );

  CommonContainerModel cardHeader({
    int? backgroundColor,
    double? height,
  }) =>
      CommonContainerModel(
        width: 1,
        backgroundColor: backgroundColor ?? AppColors.red,
        paddingHorizontal: 0.04,
        paddingVertical: 0.01,
        height: height ?? 0.06,
      );

  CommonContainerModel bottomBorderContainer = CommonContainerModel(
    width: 1,
    paddingHorizontal: 0.04,
    paddingTop: 0.02,
    paddingBottom: 0.015,
    backgroundColor: AppColors.white,
    borderBottomWidth: 2,
    borderBottomColor: AppColors.shadowGrey,
  );

  CommonContainerModel topBorderContainer = CommonContainerModel(
    width: 1,
    paddingHorizontal: 0.04,
    paddingTop: 0.02,
    paddingBottom: 0.015,
    backgroundColor: AppColors.white,
    borderTopWidth: 4,
    borderTopColor: AppColors.shadowGrey, //AppColors.shadowGrey,
  );

  CommonContainerModel cardContainer({
    dynamic backgroundColor,
    double? paddingHorizontal,
    double? paddingVertical,
    double? marginHorizontal,
    double? marginTop,
    double? marginBottom,
    TouchTypes? touchType,
  }) =>
      CommonContainerModel(
        width: 1,
        marginBottom: marginBottom ?? 0.015,
        marginTop: marginTop ?? 0.0,
        marginHorizontal: marginHorizontal ?? 0.0,
        paddingVertical: paddingVertical ?? 0.015,
        paddingHorizontal: paddingHorizontal ?? 0.04,
        borderRadius: 0.02,
        backgroundColor:
            backgroundColor ?? Color(AppColors.primary).withOpacity(0.1),
        touchEffect: TouchableEffect(
          type: touchType ?? TouchTypes.opacity,
        ),
      );

  CommonContainerModel formToggleStyle = CommonContainerModel(
    width: 0.21,
    backgroundColor: AppColors.greyLightBorder,
    paddingHorizontal: 0.03,
    paddingVertical: 0.004,
    borderRadius: 0.02,
    alignment: Alignment.center,
  );

  CommonContainerModel topBottomBorderStyle = CommonContainerModel(
    borderBottomWidth: 1.6,
    borderBottomColor: Color(AppColors.textGrey).withOpacity(0.2),
    borderTopWidth: 1.6,
    borderTopColor: Color(AppColors.textGrey).withOpacity(0.2),
    paddingVertical: 0.02,
    paddingHorizontal: paddingFormsCard,
  );

  CommonContainerModel formSectionK12Style = const CommonContainerModel(
    backgroundColor: Colors.white,
    marginHorizontal: 0.02,
    borderRadius: 0.02,
    paddingTop: 0.02,
    marginBottom: 0.02,
    paddingHorizontal: 0.03,
  );

  CommonContainerModel formSectionsStyle = const CommonContainerModel(
    backgroundColor: Colors.white,
    paddingHorizontal: 0.03,
    borderRadius: 0.02,
    paddingVertical: 0.016,
    marginTop: 0.02,
    marginHorizontal: 0.03,
    marginBottom: 0.02,
  );

  CommonContainerModel cardStyle = CommonContainerModel(
    width: 1,
    backgroundColor: Colors.grey[200],
    paddingHorizontal: 0.04,
    paddingVertical: 0.015,
    borderRadius: 0.02,
    marginBottom: 0.02,
  );

  CommonContainerModel bottomShadowStyle = const CommonContainerModel(
    shadowColor: COMMON_GREY_COLOR,
    shadowOpacity: 0.1,
    shadowSpreadRadius: .5,
    shadowOffsetDY: 2,
    shadowBlurRadius: 4,
    backgroundColor: Colors.white,
    paddingBottom: 0.01,
    paddingHorizontal: 0.03,
    width: 1,
  );
}
