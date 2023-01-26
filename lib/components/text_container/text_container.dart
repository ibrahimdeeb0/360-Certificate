import '../../general_exports.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    Key? key,
    this.text,
    this.backgroundColor,
  }) : super(key: key);

  final String? text;
  final dynamic backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text ?? '',
      fontColor: AppColors.orange,
      containerStyle: CommonContainerModel(
        backgroundColor:
            backgroundColor ?? Color(AppColors.primary).withOpacity(0.15),
        paddingHorizontal: 0.028,
        paddingVertical: 0.006,
        borderRadius: 0.1,
        marginHorizontal: 0.02,
      ),
    );
  }
}
