import '../../general_exports.dart';

class StepperHeader extends StatelessWidget {
  const StepperHeader({
    required this.currentIndex,
    required this.lastIndex,
    this.fontSize = fontH3,
    this.title,
    this.bgColor,
    super.key,
  });

  final int currentIndex;
  final int lastIndex;
  final String? title;
  final double? fontSize;
  final dynamic bgColor;

  @override
  Widget build(BuildContext context) {
    // final double tweenValue = double.parse(currentIndex.toString());
    // consoleLog(((currentIndex - 1) / (lastIndex - 1)), key: 'tweenValue');
    return CommonContainer(
      style: appContainerStyles.bottomShadowStyle,
      paddingVertical: 0.015,
      paddingHorizontal: 0.04,
      backgroundColor: bgColor ?? Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            // color: Colors.red,
            width: 0.8.flexWidth,
            child: CommonText(
              title ?? '',
              fontSize: fontSize,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
              fontColor: AppColors.primary,
            ),
          ),
          CreateCustomerTween(
            // end: tweenValue == 1 ? 0.5 : 1,
            end: currentIndex == lastIndex ? 1 : ((currentIndex) / (lastIndex)),
            numbers: '${currentIndex + 1} /${lastIndex + 1}',
          ),
        ],
      ),
    );
  }
}
