import '../../../general_exports.dart';

class CreateCustomerHeader extends StatelessWidget {
  const CreateCustomerHeader({
    required this.currentIndex,
    this.pressBack,
    super.key,
  });

  final int currentIndex;
  final Function()? pressBack;

  @override
  Widget build(BuildContext context) {
    final double tweenValue = double.parse(currentIndex.toString());
    return CommonContainer(
      style: appContainerStyles.bottomShadowStyle,
      paddingBottom: 0.015,
      paddingTop: 0.07,
      paddingHorizontal: 0.0,
      paddingRight: 0.04,
      paddingLeft: 0.02,
      child: currentIndex == 0
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  onPressed: pressBack,
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color?>(
                          Colors.grey.shade300)),
                  icon: const Icon(Icons.arrow_back),
                ),
                SizedBox(
                  width: 0.02.flexWidth,
                ),
                SizedBox(
                  width: 0.7.flexWidth,
                  child: const CommonText(
                    'Is this customer an Individual or a company?',
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: pressBack,
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color?>(
                          Colors.grey.shade300)),
                  icon: const Icon(Icons.arrow_back),
                ),
                SizedBox(
                  width: 0.7.flexWidth,
                  child: CommonText(
                    currentIndex == 1 ? 'Customer Information' : 'Site Details',
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                  ),
                ),
                CreateCustomerTween(
                  end: tweenValue == 1 ? 0.5 : 1,
                  numbers: '$currentIndex/2',
                ),
              ],
            ),
    );
  }
}
