import '../../../general_exports.dart';

class AddNewSite extends StatelessWidget {
  const AddNewSite({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewSiteController>(
      init: AddNewSiteController(),
      builder: (AddNewSiteController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Add New Site',
            withShadow: true,
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonInput(
                    controller: controller.siteNameController,
                    topLabelText: 'Site Name',
                    hint: 'Type Site Name',
                    marginTop: 0.03,
                    marginBottom: 0.02,
                  ),
                  CommonContainer(
                    style: appContainerStyles.cardStyle,
                    paddingBottom: 0.0,
                    marginBottom: 0.03,
                    child: SearchWithWooz(
                      searchWithWoozController: controller.addressControllerMap,
                      showJustOneSite: true,
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.cardStyle,
                    child: Column(
                      children: <Widget>[
                        SelectTypeSheet(
                          label: 'What Is The Property Type',
                          hint: 'Select Property Type',
                          value: controller.sitePropertyType != null
                              ? (controller.sitePropertyType as Enum)
                                  .name
                                  .capitalizeFirst
                              : '',
                          onTap: controller.selectCustomerPropertyType,
                        ),
                        if (controller.sitePropertyType ==
                            SitePropertyType.other)
                          CommonInput(
                            hint: 'Typing...',
                            controller: controller.propertyTypeOtherController,
                            marginTop: 0.02,
                            keyboardType: TextInputType.name,
                          ),
                      ],
                    ),
                  ),
                  //*----//
                  CommonText(
                    'Site Contact Details',
                    fontColor: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    marginBottom: 0.02,
                  ),
                  ToggleYesNo(
                    onChange: (bool value) {
                      controller.toggleSameSiteDetails(value: value);
                    },
                    toggleValue: controller.isAnotherSiteInfo,
                    text:
                        'Do you want to add another contact for the site, such as the tenant?',
                  ),
                  0.02.boxHeight,

                  if (controller.isAnotherSiteInfo)
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'Full Name',
                            ),
                            hint: 'Type Full Name',
                            controller: controller.siteDetailsNameController,
                            // onChanged: controller.onChangeIInputs,
                            keyboardType: TextInputType.name,
                          ),
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'Phone Number',
                            ),
                            // topLabelText: 'Phone Number',
                            hint: 'Phone Number',
                            controller: controller.siteDetailsPhoneController,
                            keyboardType: TextInputType.phone,
                          ),
                          CommonInput(
                            topLabel: const TopLabelText(
                              text: 'Email Address',
                            ),
                            // topLabelText: 'Email Address',
                            hint: 'Email Address',
                            controller: controller.siteDetailsEmailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SelectTypeSheet(
                            label: 'Contact Type',
                            //  topLabel: const TopLabelText(
                            //   text: 'Email Address',
                            // ),
                            hint: 'Select Contact Type',
                            value: controller.siteContactType != null
                                ? (controller.siteContactType as Enum)
                                    .name
                                    .capitalizeFirst
                                : '',
                            onTap: controller.selectSiteContactType,
                          ),
                        ],
                      ),
                    ),
                  CommonButton(
                    text: 'Add The Site',
                    onPress: controller.onPressAdd,
                    marginTop: 0.02,
                    marginBottom: 0.02,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
