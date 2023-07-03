import '../../../general_exports.dart';

class CreateCustomerCompanyStep1 extends StatelessWidget {
  const CreateCustomerCompanyStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const AttentionMessage(
                  message:
                      'Please enter the details of the landlord/agent/director',
                ),
                // CommonInput(
                //   topLabelText: 'Full Name',
                //   hint: 'Enter full name',
                //   controller: controller.customerInfoNameController,
                //   keyboardType: TextInputType.name,
                // ),
                CommonInput(
                  topLabelText: 'Phone Number',
                  hint: 'Enter phone number',
                  controller: controller.customerInfoPhoneController,
                  keyboardType: TextInputType.phone,
                ),
                CommonInput(
                  topLabelText: 'Email Address',
                  hint: 'Enter your email address',
                  controller: controller.customerInfoEmailController,
                  keyboardType: TextInputType.emailAddress,
                  marginBottom: 0.02,
                ),
                SelectTypeSheet(
                  isRequired: false,
                  label: 'Contact Type',
                  hint: 'Select Contact Type',
                  value: controller.companyContactType != null
                      ? (controller.companyContactType as Enum)
                          .name
                          .capitalizeFirst
                      : '',
                  onTap: controller.selectCompanyContactType,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
