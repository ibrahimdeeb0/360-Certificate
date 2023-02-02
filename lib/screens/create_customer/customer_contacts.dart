import '../../general_exports.dart';

class CustomerContacts extends StatelessWidget {
  const CustomerContacts({
    required this.controller,
    super.key,
  });

  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonInput(
          topLabelText: 'First Name',
          hint: 'Enter First Name',
          controller: controller.clientContactFirstNameController,
          marginBottom: 0.012,
          marginTop: 0.01,
        ),
        CommonInput(
          topLabelText: 'Last Name',
          hint: 'Enter Last Name',
          controller: controller.clientContactLastNameController,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabelText: 'Phone',
          hint: 'Enter Phone',
          controller: controller.clientContactPhoneController,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabelText: 'Email',
          hint: 'Enter Email',
          controller: controller.clientContactEmailController,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabelText: 'Type',
          hint: 'Select Type',
          value: controller.selectedClientContactType ?? '',
          enabled: false,
          suffix: const Icon(Icons.keyboard_arrow_down),
          onTap: () => Get.bottomSheet(
            SelectTypeBT(
              controller: controller,
              listTitles: controller.clientType,
            ),
            elevation: 0.0,
          ),
        ),
        SizedBox(height: DEVICE_HEIGHT * 0.158),
      ],
    );
  }
}
