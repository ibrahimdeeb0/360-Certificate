import '../../../general_exports.dart';

class CreateCustomerIndividualStep2 extends StatelessWidget {
  const CreateCustomerIndividualStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCustomerV2Controller>(
      init: CreateCustomerV2Controller(),
      builder: (CreateCustomerV2Controller controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 0.03.boxHeight,
              const AttentionMessage(
                message:
                    'We need to know the information about the property you are inspecting, so we can add these details on to the certificate',
              ),
              CommonText(
                'What would you like to call this site?',
                fontSize: fontH3,
                fontColor: Colors.grey[700],
                // marginVertical: 0.02,
              ),
              CommonInput(
                topLabelText: 'Site Name',
                hint: 'Enter Your Site Name',
                marginBottom: 0.015,
                controller: controller.siteNameController,
                onChanged: controller.onWriteSiteName,
                keyboardType: TextInputType.name,
              ),
              ToggleYesNo(
                onChange: (bool value) {
                  consoleLog(value);
                  controller.isSiteAddSameInfo = value;
                  controller.update();
                  consoleLog(controller.isSiteAddSameInfo);
                },
                toggleValue: controller.isSiteAddSameInfo,
                text: 'Is the site address the same the customer details?',
              ),
              0.02.boxHeight,

              // if No
              if (!controller.isSiteAddSameInfo)
                CommonContainer(
                  style: appContainerStyles.cardStyle,
                  paddingBottom: 0,
                  child: SearchWithWooz(
                    searchWithWoozController: controller.customerSiteAddress,
                    isLess: controller.isShowLess,
                    pressSeeLess: controller.toggleShowLess,
                  ),
                ),
              CommonContainer(
                style: appContainerStyles.cardStyle,
                child: Column(
                  children: <Widget>[
                    SelectTypeSheet(
                      label: 'What Is The Property Type',
                      hint: 'Select Property Type',
                      value: controller.sitePropertyTypeValue,
                      onTap: controller.selectCustomerPropertyType,
                    ),
                    if (controller.sitePropertyType == SitePropertyType.other)
                      CommonInput(
                        hint: 'Typing...',
                        controller: controller.propertyTypeOtherController,
                        marginTop: 0.02,
                        keyboardType: TextInputType.name,
                      ),
                  ],
                ),
              ),
              //*  Site Contact Details  *//

              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                          'Would you like to add another contact for this property?',
                    ),
                    0.02.boxHeight,
                    CommonInput(
                      topLabel: TopLabelText(
                        text: controller.siteContactTypeValue == null
                            ? 'Full Name'
                            : '${controller.siteContactTypeValue} Name',
                      ),
                      hint: controller.siteContactTypeValue == null
                          ? 'Type Full Name'
                          : 'Type ${controller.siteContactTypeValue} Name',
                      controller: controller.siteDetailsNameController,
                      // onChanged: controller.onChangeIInputs,
                      keyboardType: TextInputType.name,
                      enabled: controller.isAnotherSiteInfo,
                    ),
                    CommonInput(
                      topLabel: const TopLabelText(
                        text: 'Phone Number',
                      ),
                      // topLabelText: 'Phone Number',
                      hint: 'Phone Number',
                      controller: controller.siteDetailsPhoneController,
                      keyboardType: TextInputType.phone,
                      enabled: controller.isAnotherSiteInfo,
                    ),
                    CommonInput(
                      topLabel: const TopLabelText(
                        text: 'Email Address',
                      ),
                      hint: 'Email Address',
                      controller: controller.siteDetailsEmailController,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: controller.email2FocusNode,
                      enabled: controller.isAnotherSiteInfo,
                    ),
                    SelectTypeSheet(
                      label: 'Contact Type',
                      hint: 'Select Contact Type',
                      value: controller.isAnotherSiteInfo
                          ? controller.siteContactTypeValue
                          : (controller.siteContactType as Enum)
                                  .name
                                  .contains(capitalLetterPattern)
                              ? addSpaceBeforeCapitalLetter(
                                      (controller.siteContactType as Enum).name)
                                  .capitalize
                              : (controller.siteContactType as Enum)
                                  .name
                                  .capitalize,
                      onTap: controller.isAnotherSiteInfo
                          ? controller.selectSiteContactType
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PreviousAddressSheet extends StatelessWidget {
  const PreviousAddressSheet({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      title: 'Previous Address',
      child: SingleChildScrollView(
        child: CommonContainer(
          style: appContainerStyles.cardStyle,
          marginVertical: 0.03,
          child: Column(
            children: <Widget>[child],
          ),
        ),
      ),
    );
  }
}
