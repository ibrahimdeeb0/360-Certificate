import '../../general_exports.dart';

class ButtonComponents extends StatelessWidget {
  const ButtonComponents({
    super.key,
    this.text,
    this.onPress,
    this.width,
  });
  final String? text;
  final void Function()? onPress;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
        width: width,
        text: text,
        fontSize: fontTitle,
        borderRadius: 0.012,
        backgroundColor: Color(AppColors.primary),
        textStyle: CommonTextModel(
          fontColor: Color(AppColors.white),
        ),
        alignment: Alignment.center,
        height: 0.05,
        onPress: onPress);
  }
}
