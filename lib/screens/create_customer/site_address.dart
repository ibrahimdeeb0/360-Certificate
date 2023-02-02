import '../../general_exports.dart';

class SiteAddress extends StatelessWidget {
  const SiteAddress({
    required this.controller,
    super.key,
  });

  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonText(
          'Copy Address From Customer Info ?',
          marginBottom: 0.015,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          containerStyle: const CommonContainerModel(
            width: 1,
            marginTop: 0.02,
            marginBottom: 0.015,
          ),
          bottomChild: RadioButtonYesNo(
            isSelect: controller.radioSiteAddress,
            onTapYes: () {
              controller.radioSiteAddress = true;
              controller.update();
            },
            onTapNo: () {
              controller.radioSiteAddress = false;
              controller.update();
            },
          ),
        ),
        const CommonInput(
          topLabelText: 'Site Name',
          hint: 'Site Name',
          marginBottom: 0.012,
        ),
        if (controller.radioSiteAddress == false)
          Column(
            children: <Widget>[
              const CommonInput(
                topLabelText: 'Address Here',
                hint: ' Type Address Here',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabel: TopLabelText(
                  text: 'Street Number And Name',
                ),
                hint: 'Street Number And Name',
                marginBottom: 0.012,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  CommonInput(
                    topLabel: TopLabelText(
                      text: 'City',
                    ),
                    hint: 'City ',
                    width: 0.43,
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabel: TopLabelText(
                      text: 'Postcode',
                    ),
                    hint: 'Postcode',
                    width: 0.43,
                    marginBottom: 0.012,
                  ),
                ],
              ),
              CommonInput(
                topLabelText: 'Country',
                hint: 'Select Country',
                value: controller.siteAddressSelectedCountry[keyName],
                suffix: const Icon(Icons.keyboard_arrow_down),
                onTap: () {
                  controller.getCountries();
                  Get.bottomSheet(
                    const SelectCountry3(),
                    isScrollControlled: true,
                    elevation: 0.0,
                  );
                },
                enabled: false,
                marginBottom: 0.012,
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.048),
            ],
          ),
        if (controller.radioSiteAddress == true)
          SizedBox(height: DEVICE_HEIGHT * 0.512),
      ],
    );
  }
}
