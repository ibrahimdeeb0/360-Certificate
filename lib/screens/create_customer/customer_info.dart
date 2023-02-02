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
        const CommonInput(
          topLabel: TopLabelText(
            text: 'Customer/ Company Name',
          ),
          hint: 'Enter Customer/ Company Name',
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Customer Type',
          ),
          hint: 'Select Customer Type',
          enabled: false,
          marginBottom: 0.012,
          onTap: () => Get.bottomSheet(
            SelectValueBT(
              controller: controller,
              listTitles: controller.customerType,
            ),
            elevation: 0.0,
          ),
          suffix: const Icon(Icons.keyboard_arrow_down),
        ),
        const CommonInput(
          topLabelText: 'Type Address',
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
          hint: 'SelectCountry',
          marginBottom: 0.012,
          suffix: const Icon(Icons.keyboard_arrow_down),
          enabled: false,
          onTap: () {},
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
