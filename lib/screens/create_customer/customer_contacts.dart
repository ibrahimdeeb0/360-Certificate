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
          topLabel: const TopLabelText(
            text: 'First Name',
          ),
          hint: 'Enter First Name',
          controller: controller.clientContactFirstNameController,
          keyboardType: TextInputType.name,
          marginBottom: 0.012,
          marginTop: 0.01,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Last Name',
          ),
          hint: 'Enter Last Name',
          controller: controller.clientContactLastNameController,
          keyboardType: TextInputType.name,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Phone',
          ),
          hint: 'Enter Phone',
          controller: controller.clientContactPhoneController,
          keyboardType: TextInputType.phone,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Email',
          ),
          hint: 'Enter Email',
          controller: controller.clientContactEmailController,
          keyboardType: TextInputType.emailAddress,
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Type',
          ),
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
