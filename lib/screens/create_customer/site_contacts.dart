import '../../general_exports.dart';

class SiteContacts extends StatelessWidget {
  const SiteContacts({
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
          'Is The Site Contact The Same As The Client Contact?',
          textAlign: TextAlign.start,
          marginBottom: 0.015,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          containerStyle: const CommonContainerModel(
            width: 1,
            marginTop: 0.02,
            marginBottom: 0.015,
          ),
          bottomChild: RadioButtonYesNo(
            isSelect: controller.radioSiteContact,
            onTapYes: () {
              controller.radioSiteContact = true;
              controller.update();
            },
            onTapNo: () {
              controller.radioSiteContact = false;
              controller.update();
            },
          ),
        ),
        if (controller.radioSiteContact == false)
          Column(
            children: <Widget>[
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'First Name',
                ),
                hint: 'Enter First Name',
                controller: controller.siteContactFirstNameController,
                keyboardType: TextInputType.name,
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Last Name',
                ),
                hint: 'Enter Last Name',
                controller: controller.siteContactLastNameController,
                keyboardType: TextInputType.name,
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Phone',
                ),
                hint: 'Enter Phone',
                controller: controller.siteContactPhoneController,
                keyboardType: TextInputType.phone,
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabel: const TopLabelText(
                  text: 'Email',
                ),
                hint: 'Enter Email',
                controller: controller.siteContactEmailController,
                keyboardType: TextInputType.emailAddress,
                marginBottom: 0.012,
              ),
            ],
          ),
        CommonInput(
          topLabel: const TopLabelText(
            text: 'Type',
          ),
          hint: 'Select Type',
          enabled: false,
          value: controller.selectedClientTypeOnSiteContact,
          suffix: const Icon(Icons.keyboard_arrow_down),
          onTap: () => Get.bottomSheet(
            SelectTypeBT(
              controller: controller,
              listTitles: controller.contactType,
            ),
            elevation: 0.0,
          ),
        ),
        //
        if (controller.radioSiteContact == true)
          SizedBox(height: DEVICE_HEIGHT * 0.497),

        if (controller.radioSiteContact == false)
          SizedBox(height: DEVICE_HEIGHT * 0.033),
      ],
    );
  }
}
