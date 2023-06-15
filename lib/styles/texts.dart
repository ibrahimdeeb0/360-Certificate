import '../../general_exports.dart';

class DefaultTextStyles {
  CommonTextModel defaultTextStyle = const CommonTextModel(
    fontFamily: 'Careem',
  );

  CommonTextModel mediumTextStyle = const CommonTextModel(
    fontFamily: 'Careem',
    fontWeight: FontWeight.w500,
  );

  CommonTextModel h1Style() => defaultTextStyle.copyWith(
        fontSize: fontH1,
      );

  CommonTextModel h2Style() => defaultTextStyle.copyWith(
        fontSize: fontH2,
      );

  CommonTextModel h3Style() => defaultTextStyle.copyWith(
        fontSize: fontH3,
      );

  CommonTextModel h4Style() => defaultTextStyle.copyWith(
        fontSize: fontH4,
      );

  CommonTextModel h5Style() => defaultTextStyle.copyWith(
        fontSize: fontH5,
      );

  CommonTextModel h6Style() => defaultTextStyle.copyWith(
        fontSize: fontH6,
      );

  CommonTextModel h1StylePrimary() => h1Style().copyWith(
        fontColor: AppColors.primary,
      );

  CommonTextModel h2StylePrimary() => h2Style().copyWith(
        fontColor: AppColors.primary,
      );

  CommonTextModel h3StylePrimary() => h3Style().copyWith(
        fontColor: AppColors.primary,
      );

  CommonTextModel h4StylePrimary() => h4Style().copyWith(
        fontColor: AppColors.primary,
      );

  CommonTextModel h5StylePrimary() => h5Style().copyWith(
        fontColor: AppColors.primary,
      );

  CommonTextModel h6StylePrimary() => h6Style().copyWith(
        fontColor: AppColors.primary,
      );

  CommonTextModel h1StyleBlack() => h1Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h2StyleBlack() => h2Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h3StyleBlack() => h3Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h4StyleBlack() => h4Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h5StyleBlack() => h5Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h6StyleBlack() => h6Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h1StyleWhite() => h1Style().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h2StyleWhite() => h2Style().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h3StyleWhite() => h3Style().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h4StyleWhite() => h4Style().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h5StyleWhite() => h5Style().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h6StyleWhite() => h6Style().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h1MediumStyleWhite() => h1MediumStyle().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h2MediumStyleWhite() => h2MediumStyle().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h3MediumStyleWhite() => h3MediumStyle().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h4MediumStyleWhite() => h4MediumStyle().copyWith(
        fontColor: AppColors.white,
      );
  CommonTextModel h3MediumStylePrimary() => h3MediumStyle().copyWith(
        fontColor: AppColors.primary,
      );
  CommonTextModel h5MediumStyleWhite() => h5MediumStyle().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h6MediumStyleWhite() => h6MediumStyle().copyWith(
        fontColor: AppColors.white,
      );

  CommonTextModel h3MediumStyleBlack() => h3MediumStyle().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h2MediumStyleBlack() => h2MediumStyle().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h4MediumStyleBlack() => h4MediumStyle().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h5MediumStyleBlack() => h5MediumStyle().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel h1MediumStyle() => mediumTextStyle.copyWith(
        fontSize: fontH1,
        fontColor: AppColors.primary,
      );

  CommonTextModel h2MediumStyle() => mediumTextStyle.copyWith(
        fontSize: fontH2,
        fontColor: AppColors.primary,
      );

  CommonTextModel h3MediumStyle() => mediumTextStyle.copyWith(
        fontSize: fontH3,
        fontColor: AppColors.primary,
      );

  CommonTextModel h4MediumStyle() => mediumTextStyle.copyWith(
        fontSize: fontH4,
        fontColor: AppColors.primary,
      );

  CommonTextModel h4GreyMediumStyle() => h4Style().copyWith(
        fontSize: fontH4,
        fontColor: AppColors.grey,
      );

  CommonTextModel h5GreyMediumStyle() => h5Style().copyWith(
        fontSize: fontH5,
        fontColor: AppColors.grey,
      );
  CommonTextModel h5MediumStyle() => mediumTextStyle.copyWith(
        fontSize: fontH4,
        fontColor: AppColors.primary,
      );

  CommonTextModel h6MediumStyle() => mediumTextStyle.copyWith(
        fontSize: fontH6,
        fontColor: AppColors.primary,
      );

  CommonTextModel buttonTextStyle() => h3MediumStyle().copyWith(
        fontColor: Colors.white,
      );

  CommonTextModel startTextAlignmentStyle() => h4Style().copyWith(
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        fontColor: AppColors.grey,
      );

  CommonTextModel textInvalidStyle() => h5StyleBlack().copyWith(
        fontColor: AppColors.grey,
      );

  CommonTextModel infoTextStyle() => h3StyleBlack().copyWith(
        textAlign: TextAlign.start,
      );

  CommonTextModel statusTextStyle(int color) => h5StyleBlack().copyWith(
        fontColor: color,
      );

  CommonTextModel h3GreyStyle() => h3Style().copyWith(
        fontColor: AppColors.grey,
      );
  CommonTextModel h3DarkGreyStyle() => h3Style().copyWith(
        fontColor: Colors.grey[700],
        textAlign: TextAlign.start,
      );

  CommonTextModel h4MediumBlackStyle() => h4MediumStyle().copyWith(
        fontColor: AppColors.black,
      );

  CommonTextModel titleStyle() => h3MediumStyle().copyWith(
        fontColor: AppColors.black,
      );
  CommonTextModel h5Grey400Style() => h5Style().copyWith(
        fontSize: fontH5,
        fontColor: AppColors.grey,
        fontWeight: FontWeight.w400,
      );
  CommonTextModel h5Primary400Style() =>
      h5Grey400Style().copyWith(fontColor: AppColors.primary);

  CommonTextModel h2MaxWidth() => h2StyleBlack().copyWith(
        fontSize: fontTitle,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        rowMainAxisSize: MainAxisSize.max,
        textAlign: TextAlign.start,
      );

  CommonTextModel h3MaxWidth() => h3StyleBlack().copyWith(
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        textAlign: TextAlign.start,
      );

  CommonTextModel textTitleBoldStyle = const CommonTextModel(
    fontWeight: FontWeight.bold,
    columnCrossAxisAlignment: CrossAxisAlignment.start,
    textAlign: TextAlign.start,
    rowMainAxisSize: MainAxisSize.max,
  );

  CommonTextModel textTitleStyle = const CommonTextModel(
    columnCrossAxisAlignment: CrossAxisAlignment.start,
    textAlign: TextAlign.start,
    rowMainAxisSize: MainAxisSize.max,
  );

  CommonTextModel textStartStyle = const CommonTextModel(
    rowMainAxisSize: MainAxisSize.max,
    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
    textAlign: TextAlign.start,
    columnCrossAxisAlignment: CrossAxisAlignment.start,
  );
}
