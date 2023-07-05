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
                     
                    ),
                    controller: controller.siteName,
                    value: Get.arguments['site_data'][0]['name'],
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Street No & Name',
                      
                      enabled: false,
                    ),
                    hint: Get.arguments['site_data'][0]['street_num'],
                    marginBottom: 0.015,
                    enabled: false,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'City',
                      
                      enabled: false,
                    ),
                    hint: Get.arguments['site_data'][0]['city'],
                    marginBottom: 0.015,
                    enabled: false,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Postal Code',
                     
                      enabled: false,
                    ),
                    hint: Get.arguments['site_data'][0]['postal_code'],
                    marginBottom: 0.015,
                    enabled: false,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'First Name',
                     ),
                    controller: controller.fName,
                    value: Get.arguments['site_data'][0]['site_contact']
                        ['f_name'],
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Last Name',
                      
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
