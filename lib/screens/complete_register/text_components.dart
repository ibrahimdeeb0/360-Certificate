import '../../general_exports.dart';

class TextComponent extends StatelessWidget {
  const TextComponent({
    super.key,
    this.text,
  });

  final String? text;
  @override
  Widget build(BuildContext context) {
    return CommonText(
      text,
      fontSize: fontH2,
      marginLeft: 0.017,
      textAlign: TextAlign.start,
      fontColor: AppColors.black,
    );
  }
}
