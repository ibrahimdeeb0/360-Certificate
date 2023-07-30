import 'package:flutter_svg/svg.dart';

import '../../../general_exports.dart';

class UpdatePostcode extends StatelessWidget {
  const UpdatePostcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Header(
        title: 'My Address',
      ),
      body: GetBuilder<UpdatePostcodeController>(
          init: UpdatePostcodeController(),
          builder: (UpdatePostcodeController controller) {
            return CommonContainer(
              style: appContainerStyles.containerStyles,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    0.03.boxHeight,
                    CommonInput(
                      hint: 'Enter Your Postcode',
                      marginBottom: 0.012,
                      // controller: controller.addressController, //picture
                      suffix: SvgPicture.asset(iconSearch),
                      onTap: () => Get.bottomSheet(
                        const SearchAddressSetting(),
                        isScrollControlled: true,
                        elevation: 0.0,
                      ),
                      enabled: false,
                    ),
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
                      marginBottom: 0.012,
                    ),
                    CommonButton(
                      onPress: controller.onUpdateSite,
                      text: 'Save',
                      marginVertical: 0.025,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
