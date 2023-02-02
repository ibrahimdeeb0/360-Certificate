import '../../general_exports.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({
    required this.controller,
    super.key,
  });

  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderTopWidth: 2,
      borderTopColor: AppColors.greyLightBorder,
      marginTop: 0.025,
      borderRadius: 0.5,
      child: Column(
        children: <Widget>[
          CommonText(
            'Billing Address',
            fontColor: AppColors.blue,
            marginTop: 0.02,
            marginBottom: 0.01,
            containerStyle: const CommonContainerModel(
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          CommonInput(
            topLabelText: 'Billing Address',
            hint: ' Type Billing Address Here',
            controller: controller.customerBillingAddressController,
            marginBottom: 0.012,
          ),
          CommonInput(
            topLabel: const TopLabelText(
              text: 'Street Number And Name',
            ),
            hint: 'Street Number And Name',
            controller: controller.customerBillingStreetController,
            marginBottom: 0.012,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'City',
                ),
                hint: 'City ',
                controller: controller.customerBillingCityController,
                width: 0.43,
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Postcode',
                ),
                hint: 'Postcode',
                controller: controller.customerBillingPostcodeController,
                width: 0.43,
                marginBottom: 0.012,
              ),
            ],
          ),
          CommonInput(
            topLabelText: 'Country',
            hint: 'Select Country',
            value: controller.billingSelectedCountry[keyName],
            suffix: const Icon(Icons.keyboard_arrow_down),
            onTap: () {
              controller.getCountries();
              Get.bottomSheet(
                const SelectCountry2(),
                isScrollControlled: true,
                elevation: 0.0,
              );
            },
            enabled: false,
            marginBottom: 0.012,
          ),
        ],
      ),
    );
  }
}
