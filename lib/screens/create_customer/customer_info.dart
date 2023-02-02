import '../../general_exports.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({
    required this.controller,
    super.key,
  });

  final CreateCustomerController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonText(
          'Customer Info',
          fontColor: AppColors.blue,
          marginVertical: 0.02,
          containerStyle: const CommonContainerModel(
            alignment: AlignmentDirectional.centerStart,
          ),
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Customer/ Company Name',
          ),
          hint: 'Enter Customer/ Company Name',
          controller: controller.customerNameController,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Customer Type',
          ),
          hint: 'Select Customer Type',
          value: controller.selectedCustomerType,
          enabled: false,
          marginBottom: 0.012,
          onTap: () => Get.bottomSheet(
            SelectTypeBT(
              controller: controller,
              listTitles: controller.customerType,
            ),
            elevation: 0.0,
          ),
          suffix: const Icon(Icons.keyboard_arrow_down),
        ),
        CommonInput(
          topLabelText: 'Type Address',
          hint: ' Type Address Here',
          marginBottom: 0.012,
          controller: controller.customerAddressController,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Street Number And Name',
          ),
          hint: 'Street Number And Name',
          marginBottom: 0.012,
          controller: controller.customerStreetController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonInput(
              topLabel: const TopLabelText(
                text: 'City',
              ),
              hint: 'City ',
              controller: controller.customerCityController,
              width: 0.43,
              marginBottom: 0.012,
            ),
            CommonInput(
              topLabel: const TopLabelText(
                text: 'Postcode',
              ),
              hint: 'Postcode',
              controller: controller.customerPostcodeController,
              width: 0.43,
              marginBottom: 0.012,
            ),
          ],
        ),
        CommonInput(
          topLabelText: 'Country',
          hint: 'Select Country',
          value: controller.customerSelectedCountry[keyName],
          marginBottom: 0.012,
          suffix: const Icon(Icons.keyboard_arrow_down),
          enabled: false,
          onTap: () {
            controller.getCountries();
            Get.bottomSheet(
              const SelectCountry1(),
              isScrollControlled: true,
              elevation: 0.0,
            );
          },
        ),
        CommonText(
          'Customer Details Are The Same As The Billing Details ?',
          fontSize: fontH3,
          textAlign: TextAlign.start,
          marginBottom: 0.01,
          containerStyle: const CommonContainerModel(
            width: 1,
            marginTop: 0.02,
            alignment: AlignmentDirectional.centerStart,
          ),
          bottomChild: RadioButtonYesNo(
            isSelect: controller.isSelectBilling,
            onTapYes: () {
              consoleLog('Yes');
              controller.isSelectBilling = true;
              controller.update();
            },
            onTapNo: () {
              consoleLog('No');
              controller.isSelectBilling = false;
              controller.update();
            },
          ),
        ),
      ],
    );
  }
}
