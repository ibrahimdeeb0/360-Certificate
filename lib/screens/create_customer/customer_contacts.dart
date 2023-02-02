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
        const CommonInput(
          topLabelText: 'First Name',
          hint: 'Enter First Name',
          marginBottom: 0.012,
          marginTop: 0.01,
        ),
        const CommonInput(
          topLabelText: 'Last Name',
          hint: 'Enter Last Name',
          marginBottom: 0.012,
        ),
        const CommonInput(
          topLabelText: 'Phone',
          hint: 'Enter Phone',
          marginBottom: 0.012,
        ),
        const CommonInput(
          topLabelText: 'Email',
          hint: 'Enter Email',
          marginBottom: 0.012,
        ),
        CommonInput(
          topLabelText: 'Type',
          hint: 'Select Type',
          enabled: false,
          suffix: const Icon(Icons.keyboard_arrow_down),
          onTap: () => Get.bottomSheet(
            SelectValueBT(
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
