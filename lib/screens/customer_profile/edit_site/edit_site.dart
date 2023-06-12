import '../../../general_exports.dart';

class EditSite extends StatelessWidget {
  const EditSite({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditSiteController>(
      init: EditSiteController(),
      builder: (EditSiteController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Edit Site',
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: controller.onUpdateSite,
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  0.02.boxHeight,
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Site Name',
                      isRequired: false,
                    ),
                    controller: controller.siteName,
                    value: Get.arguments['site_data'][0]['name'],
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Street No & Name',
                      isRequired: false,
                      enabled: false,
                    ),
                    hint: Get.arguments['site_data'][0]['street_num'],
                    marginBottom: 0.015,
                    enabled: false,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'City',
                      isRequired: false,
                      enabled: false,
                    ),
                    hint: Get.arguments['site_data'][0]['city'],
                    marginBottom: 0.015,
                    enabled: false,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Postal Code',
                      isRequired: false,
                      enabled: false,
                    ),
                    hint: Get.arguments['site_data'][0]['postal_code'],
                    marginBottom: 0.015,
                    enabled: false,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'First Name',
                      isRequired: false,
                    ),
                    controller: controller.fName,
                    value: Get.arguments['site_data'][0]['site_contact']
                        ['f_name'],
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Last Name',
                      isRequired: false,
                    ),
                    hint: Get.arguments['site_data'][0]['site_contact']
                        ['l_name'],
                    controller: controller.lName,
                    value: Get.arguments['site_data'][0]['site_contact']
                        ['l_name'],
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Phone',
                      isRequired: false,
                    ),
                    hint: Get.arguments['site_data'][0]['site_contact']
                        ['phone'],
                    controller: controller.phone,
                    value: Get.arguments['site_data'][0]['site_contact']
                        ['phone'],
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Email',
                      isRequired: false,
                    ),
                    hint: Get.arguments['site_data'][0]['site_contact']
                        ['email'],
                    controller: controller.email,
                    value: Get.arguments['site_data'][0]['site_contact']
                        ['email'],
                    marginBottom: 0.015,
                  ),
                  0.02.boxHeight,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
