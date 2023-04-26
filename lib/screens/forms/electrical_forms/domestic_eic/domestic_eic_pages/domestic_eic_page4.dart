import '../../../../../general_exports.dart';

class DomesticEicPage4 extends StatelessWidget {
  const DomesticEicPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        final EICRListsForm formList = EICRListsForm();
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingBottom: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 7. ',
                    text: 'PARTICULARS OF INSTALLATION AT THE ORIGIN',
                    marginBottom: 0.02,
                    marginLeft: 0.03,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CommonText(
                          'Means of earthing',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                          marginBottom: 0.02,
                        ),
                        FormToggleButton(
                          title: "Distributor's facility",
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          value: controller.formData[formKeyPart7]
                              [formKeyDistributorFacility],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart7,
                                  formKeyDistributorFacility, value),
                        ),
                        FormToggleButton(
                          title: 'Installation earth electrode',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          value: controller.formData[formKeyPart7]
                              [formKeyInstallationEarth],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart7,
                                  formKeyInstallationEarth, value),
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'Details of installation Earth  \n Electrode (where applicable)',
                          fontWeight: FontWeight.bold,
                          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                          rowMainAxisSize: MainAxisSize.max,
                          rightChild: IconButton(
                            onPressed: () {
                              formsDialog(
                                title: 'Earth Electrode',
                                description:
                                    'values above 200 Q may not be stable, as soil conditions change due to factors such as soil drying and freezing',
                              );
                            },
                            icon: Icon(
                              Icons.info_outline,
                              color: Color(AppColors.primary),
                            ),
                          ),
                          containerStyle:
                              const CommonContainerModel(marginBottom: 0.02),
                        ),
                        CustomSelectContainer(
                          title: 'Type (e.g. rods, tape etc...)',
                          value: controller.formData[formKeyPart7]
                              [formKeyEarthElectrodeType],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart7,
                              keyOfValue: formKeyEarthElectrodeType,
                              listTitles: formList.listTypeI,
                            ),
                            elevation: 0.0,
                          ),
                          marginBottom: 0.0,
                        ),
                        CustomSelectContainer(
                          title: 'Location',
                          value: controller.formData[formKeyPart7]
                              [formKeyEarthElectrodeLocation],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart7,
                              keyOfValue: formKeyEarthElectrodeLocation,
                              listTitles: formList.locationEIC,
                            ),
                            elevation: 0.0,
                          ),
                          // marginBottom: 0.02,
                        ),
                        SmallInputField(
                          title: 'Electrode resistance, RA',
                          width: 0.5,
                          keyboardType: TextInputType.phone,
                          suffix: CommonText(
                            'Ω',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          value: controller.formData[formKeyPart7]
                              [formKeyEarthElectrodeResistance],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart7,
                                  formKeyEarthElectrodeResistance, value),
                          marginBottom: 0.01,
                        ),
                        CommonInput(
                          topLabelText: 'Method of measurement',
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart7]
                              [formKeyMethodMeasurement],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart7,
                                  formKeyMethodMeasurement, value),
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      children: <Widget>[
                        SmallInputField(
                          title: 'Measured Ze Ω',
                          hint: 'N/A',
                          keyboardType: TextInputType.phone,
                          width: 0.5,
                          value: controller.formData[formKeyPart7]
                              [formKeyMeasuredZe],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart7, formKeyMeasuredZe, value),
                        ),
                        SmallInputField(
                          title: 'Maximum Demand (Load)',
                          hint: 'N/A',
                          keyboardType: TextInputType.phone,
                          width: 0.5,
                          value: controller.formData[formKeyPart7]
                              [formKeyMaximumDemand],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart7, formKeyMaximumDemand, value),
                        ),
                        SmallInputField(
                          title: 'Number of smoke alarms',
                          hint: 'N/A',
                          width: 0.5,
                          isInputSelection: true,
                          value: controller.formData[formKeyPart7]
                              [formKeyNumberOfSmokeAlarms],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart7,
                              keyOfValue: formKeyNumberOfSmokeAlarms,
                              listTitles: formList.listNumOfPoles,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        CommonInput(
                          topLabelText:
                              'Protective measures for fault protection',
                          marginBottom: 0.02,
                          value: controller.formData[formKeyPart7]
                              [formKeyProtectiveMeasures],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart7,
                                  formKeyProtectiveMeasures, value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
