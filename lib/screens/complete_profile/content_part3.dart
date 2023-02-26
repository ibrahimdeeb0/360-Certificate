import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class ContentPart3 extends StatelessWidget {
  const ContentPart3({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            children: <Widget>[
              0.02.ph,
              CommonInput(
                hint: 'Enter Your Postcode',
                marginBottom: 0.012,
                controller: controller.addressController, //picture
                suffix: SvgPicture.asset(iconSearch),
                onTap: () => Get.bottomSheet(
                  const SearchAddress(),
                  isScrollControlled: true,
                  elevation: 0.0,
                ),
                enabled: false,
              ),
              if (controller.showAddressFiled)
                Column(
                  children: <Widget>[
                    CommonInput(
                      topLabel: const TopLabelText(
                        text: 'Street Number And Name',
                      ),
                      hint: 'Street Number And Name',
                      marginBottom: 0.012,
                      controller: controller.streetController,
                    ),
                    CommonInput(
                      topLabel: const TopLabelText(
                        text: 'City',
                      ),
                      hint: 'City ',
                      controller: controller.cityController,
                      marginBottom: 0.012,
                    ),
                    CommonInput(
                      topLabel: const TopLabelText(
                        text: 'Postcode',
                      ),
                      hint: 'Postcode',
                      controller: controller.postcodeController,
                      marginBottom: 0.012,
                    ),
                    CommonInput(
                      topLabelText: 'Country',
                      hint: 'Select Country',
                      controller: controller.countryController,
                      // value: controller.countryOnPage1 ??
                      //     controller.customerSelectedCountry[keyName],
                      marginBottom: 0.012,
                    ),
                  ],
                ),
              0.025.ph,
              CommonText(
                'This will be displayed on all quotes and invoices',
                textAlign: TextAlign.start,
                inlineSpans: const <InlineSpan>[],
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                marginHorizontal: 0.02,
                fontColor: Colors.grey[700],
                leftChild: Padding(
                  padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.015),
                  child: SvgPicture.asset(iconAlert),
                ),
                containerStyle: appContainerStyles.cardStyle,
              ),
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
