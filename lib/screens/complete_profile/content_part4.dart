import '../../general_exports.dart';

class ContentPart4 extends StatelessWidget {
  const ContentPart4({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            children: <Widget>[
              CommonContainer(
                style: appContainerStyles.cardStyle,
                marginTop: 0.02,
                child: CommonText(
                  "We'll now need your company address. This address will be displayed on all the certificates you create, ensuring your clients can easily contact you.",
                  fontColor: Colors.grey[600],
                  fontSize: fontH3,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonContainer(
                style: appContainerStyles.cardStyle,
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 0.8.flexWidth,
                          child: CommonText(
                            "Please start by entering your company's postcode",
                            fontColor: Colors.grey[600],
                            fontSize: fontH3,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 0.01.flexAll,
                          color: Colors.red[700],
                        ),
                      ],
                    ),
                    0.02.boxHeight,
                    CommonInput(
                      hint: 'Enter Your Postcode',
                      marginBottom: 0.012,
                      controller: controller.isManualAddressEntry
                          ? null
                          : controller.addressController, //picture
                      prefix: SvgIconHelper(
                        iconPath: iconSearch,
                        color: Color(AppColors.primary),
                      ),
                      onTap: () => Get.bottomSheet(
                        const SearchAddress(),
                        isScrollControlled: true,
                        elevation: 0.0,
                      ),
                      enabled: false,
                    ),
                    if (controller.showAddressFiled ||
                        controller.isManualAddressEntry)
                      Column(
                        children: <Widget>[
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          if (controller.isManualAddressEntry)
                            CommonText(
                              'Manual Address Entry',
                              fontSize: fontH2,
                              rowMainAxisSize: MainAxisSize.max,
                              rowMainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              rightChild: Switch(
                                value: controller.isManualAddressEntry,
                                onChanged: (bool value) {
                                  controller.toggleManualAddressEntry(
                                      value: value);
                                },
                                activeColor: Colors.green,
                              ),
                            ),
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'Street Number And Name',
                            ),
                            hint: 'Street Number And Name',
                            marginBottom: 0.012,
                            controller: controller.isManualAddressEntry
                                ? controller.entryStreetController
                                : controller.streetController,
                            enabled: (controller.isManualAddressEntry),
                          ),
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'City',
                            ),
                            hint: 'City ',
                            controller: controller.isManualAddressEntry
                                ? controller.entryCityController
                                : controller.cityController,
                            marginBottom: 0.012,
                            enabled: (controller.isManualAddressEntry),
                          ),
                          //
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'State/Province',
                            ),
                            hint: 'State/Province ',
                            controller: controller.isManualAddressEntry
                                ? controller.entryStateController
                                : controller.stateController,
                            marginBottom: 0.012,
                            enabled: (controller.isManualAddressEntry),
                          ),
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'Postcode',
                            ),
                            hint: 'Postcode',
                            controller: controller.isManualAddressEntry
                                ? controller.entryPostcodeController
                                : controller.postcodeController,
                            marginBottom: 0.012,
                            enabled: (controller.isManualAddressEntry),
                          ),
                          CommonInput(
                            topLabelText: 'Country',
                            hint: 'Select Country',
                            controller: controller.isManualAddressEntry
                                ? controller.entryCountryController
                                : controller.countryController,
                            marginBottom: 0.012,
                            enabled: (controller.isManualAddressEntry),
                          ),
                        ],
                      ),
                    if (!(controller.isManualAddressEntry))
                      Column(
                        children: <Widget>[
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(0.3),
                          ),
                          CommonText(
                            'Manual Address Entry',
                            fontSize: fontH2,
                            rowMainAxisSize: MainAxisSize.max,
                            rowMainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            rightChild: Switch(
                              value: controller.isManualAddressEntry,
                              onChanged: (bool value) {
                                controller.toggleManualAddressEntry(
                                    value: value);
                              },
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
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
