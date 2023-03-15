import '../../general_exports.dart';

CommonTextModel pickPhotoTitleStyle = appTextStyles.h3MediumStyle().copyWith(
      fontColor: AppColors.black,
    );

CommonContainerModel bottomSheetPickPictureStyle = CommonContainerModel(
  borderRadius: 0.02,
  backgroundColor: Color(AppColors.primary).withOpacity(0.04),
  paddingHorizontal: 0.04,
  // width: 0.43,
  // height: 0.15,
  touchEffect: TouchableEffect(
    type: TouchTypes.opacity,
  ),
);

CommonContainerModel parentSheet = const CommonContainerModel(
  paddingHorizontal: 0.05,
  paddingBottom: 0.05,
  paddingTop: 0.02,
  height: 0.3,
  backgroundColor: Colors.white,
);
