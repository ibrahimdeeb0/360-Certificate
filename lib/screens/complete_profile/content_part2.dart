import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class ContentPart2 extends StatelessWidget {
  const ContentPart2({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
          init: CompleteProfileController(),
          builder: (CompleteProfileController controller) {
            return Column(
              children: <Widget>[
                0.01.ph,
                const CommonInput(
                  topLabel: TopLabelText(
                    text: 'Registered Company Name',
                  ),
                  hint: 'Enter Your Registered Company Name',
                  marginBottom: 0.015,
                ),
                const CommonInput(
                  topLabel: TopLabelText(
                    text: 'Trading Name',
                  ),
                  hint: 'Enter Your Trading Name',
                  marginBottom: 0.015,
                ),
                const CommonInput(
                  topLabelText: 'Registration Number (No Required)',
                  hint: 'Enter Your Registration Number',
                  marginBottom: 0.015,
                ),
                CommonText(
                  'Is your business VAT Registered?',
                  fontColor: Colors.grey[700],
                  rowMainAxisSize: MainAxisSize.max,
                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  rightChild: CommonButton(
                    onPress: controller.toggleVat,
                    text: controller.isVatRegistered ? 'Yes' : 'No',
                    width: 0.15,
                    height: 0.045,
                    backgroundColor: controller.isVatRegistered
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                ),
                if (controller.isVatRegistered)
                  const CommonInput(
                    topLabel: TopLabelText(
                      text: 'What Is Your VAT Number',
                    ),
                    hint: 'Enter Your VAT Number',
                    marginBottom: 0.015,
                  ),
                if (controller.isVatRegistered) 0.01.ph else 0.13.ph,
                CommonText(
                  'Why do we need this information?',
                  textAlign: TextAlign.start,
                  inlineSpans: const <InlineSpan>[],
                  rowCrossAxisAlignment: CrossAxisAlignment.start,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  marginHorizontal: 0.02,
                  leftChild: Padding(
                    padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.015),
                    child: SvgPicture.asset(iconAlert),
                  ),
                  bottomChild: CommonText(
                    'This information will displayed on all your quotes and invoices and for the invoices to be valid all your company details should be displayed',
                    textAlign: TextAlign.start,
                    marginLeft: 0.06,
                    marginTop: 0.01,
                    fontColor: Colors.grey[700],
                    fontSize: fontH3,
                  ),
                  containerStyle: appContainerStyles.cardStyle,
                ),
              ],
            );
          });
    } else {
      return const SizedBox();
    }
  }
}
