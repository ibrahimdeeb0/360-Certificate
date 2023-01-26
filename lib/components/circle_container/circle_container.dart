import '../../general_exports.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    Key? key,
    this.onPress,
    this.marginHorizontal,
    this.marginBottom,
    this.marginTop,
    this.contentPadding,
    this.iconWidget,
    this.backgroundColor,
    this.circuitSize = 0.15,
  }) : super(key: key);

  final Function? onPress;
  final double? marginHorizontal;
  final double? marginBottom;
  final double? contentPadding;
  final double? marginTop;
  final double circuitSize;
  final Widget? iconWidget;
  final dynamic backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      marginHorizontal: marginHorizontal ?? 0.0,
      marginBottom: marginBottom,
      marginTop: marginTop,
      onPress: onPress?.call,
      backgroundColor:
          backgroundColor ?? Color(AppColors.grey).withOpacity(0.16),
      size: circuitSize,
      boxShape: BoxShape.circle,
      alignment: AlignmentDirectional.center,
      padding: contentPadding ?? 0.0,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
        // opacity: 0.4,
      ),
      child: iconWidget ?? const SizedBox(),
    );
  }
}
