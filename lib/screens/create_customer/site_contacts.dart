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
          'Is The Site Contact The Same As The Client Contact ?',
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
            children: const <Widget>[
              CommonInput(
                topLabelText: 'First Name',
                hint: 'Enter First Name',
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabelText: 'Last Name',
                hint: 'Enter Last Name',
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabelText: 'Phone',
                hint: 'Enter Phone',
                marginBottom: 0.012,
              ),
              CommonInput(
                topLabelText: 'Email',
                hint: 'Enter Email',
                marginBottom: 0.012,
              ),
            ],
          ),
        CommonInput(
          topLabelText: 'Type',
          hint: 'Select Type',
          enabled: false,
          suffix: const Icon(Icons.keyboard_arrow_down),
          onTap: () => Get.bottomSheet(
            SelectValueBT(
              controller: controller,
              listTitles: controller.contactType,
            ),
            elevation: 0.0,
          ),
        ),
        //
        if (controller.radioSiteContact == true)
          SizedBox(height: DEVICE_HEIGHT * 0.498),

        if (controller.radioSiteContact == false)
          SizedBox(height: DEVICE_HEIGHT * 0.034),
      ],
    );
  }
}
