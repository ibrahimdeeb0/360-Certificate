import '../../general_exports.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({
    this.child,
    this.title,
    this.height,
    this.style,
    this.icon,
    this.onClosePress,
    this.iconBackGroundColor,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final String? title;
  final double? height;
  final CommonContainerModel? style;
  final IconData? icon;
  final Function? onClosePress;
  final dynamic iconBackGroundColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: CommonContainer(
        style: style ?? appContainerStyles.dialogContainer(height: height),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            CommonContainer(
              style: const CommonContainerModel(
                marginTop: 0.06,
              ),
              child: child ?? const SizedBox(),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CommonText(
                title ?? '',
                style: appTextStyles.h2StyleBlack().copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                containerStyle: CommonContainerModel(
                  backgroundColor: AppColors.white,
                  marginTop: 0.01,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: CommonContainer(
                onPress: () {
                  Get.back();
                  onClosePress?.call();
                },
                style: CommonContainerModel(
                  alignment: AlignmentDirectional.centerEnd,
                  marginTop: 0.015,
                  backgroundColor: AppColors.white,
                ),
                child: Icon(
                  Icons.close,
                  color: Color(AppColors.grey).withOpacity(0.6),
                ),
              ),
            ),
            if (icon != null)
              Positioned(
                top: DEVICE_HEIGHT * -0.04,
                right: 0,
                left: 0,
                child: CommonContainer(
                  onPress: () => Get.back(),
                  style: CommonContainerModel(
                    alignment: AlignmentDirectional.center,
                    backgroundColor: iconBackGroundColor ?? AppColors.red,
                    boxShape: BoxShape.circle,
                    padding: 0.02,
                    borderColor: AppColors.white,
                    clipBehavior: Clip.hardEdge,
                    borderWidth: 3,
                  ),
                  child: Icon(
                    icon,
                    color: Color(AppColors.white),
                    size: DEVICE_WIDTH * 0.1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
