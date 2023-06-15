import '../../../general_exports.dart';

class CreateCustomerHeader extends StatelessWidget {
  const CreateCustomerHeader({
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: appContainerStyles.bottomShadowStyle,
      paddingHorizontal: 0.04,
      child: currentIndex == 0
          ? const CommonText(
              'Is this customer an Individual or a company?',
              fontSize: fontH2,
              textAlign: TextAlign.start,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 0.8.flexWidth,
                  child: CommonText(
                    currentIndex == 1 ? 'Customer Information' : 'Site Details',
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                  ),
                ),
                CreateCustomerTween(
                  end: 0.5,
                  numbers: '$currentIndex/2',
                ),
              ],
            ),
    );
  }
}
