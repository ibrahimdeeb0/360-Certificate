import '../../general_exports.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({
    this.title,
    this.withPaddingHorizontal = false,
    Key? key,
  }) : super(key: key);

  final String? title;
  final bool withPaddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      title ?? '',
      style: appTextStyles.h2MaxWidth(),
      marginBottom: 0.02,
      containerStyle: CommonContainerModel(
        paddingHorizontal: withPaddingHorizontal ? 0.03 : 0.0,
      ),
    );
  }
}
