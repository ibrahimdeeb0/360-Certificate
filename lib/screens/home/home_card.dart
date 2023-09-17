
import '../../general_exports.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
    this.title,
    this.subTitle,
    this.iconPath,
    this.width,
    this.bgColor,
    this.onPress,
    this.paddingHorizontal,
  });

  final String? title;
  final String? subTitle;
  final String? iconPath;
  final double? width;
  final dynamic bgColor;
  final Function? onPress;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;

    return CommonContainer(
      onPress: onPress,
      backgroundColor: bgColor ?? AppColors.homeClr1,
      width: width ?? 0.45,
      // height: 0.12,
      // style: appContainerStyles.containertTabletStyles,
      borderRadius: 0.06,
      paddingHorizontal: paddingHorizontal ?? 0.02,
      paddingVertical: 0.015,
      marginBottom: 0.015,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText(
            title ?? '8',
            fontColor: AppColors.primary,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rightChild: SvgIconHelper(
             iconPath:  iconPath ?? iconOutCerts,
              width: DEVICE_WIDTH * 0.03,
              height: DEVICE_HEIGHT * 0.03,
              color: Color(AppColors.primary),
            ),
            containerStyle: const CommonContainerModel(
              width: 1,
              marginBottom: 0.01,
            ),
          ),
          CommonText(
            subTitle ?? 'Not Completed Certs',
            fontSize: fontTitle,
            fontColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
