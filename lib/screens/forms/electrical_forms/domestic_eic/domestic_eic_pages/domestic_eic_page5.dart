import '../../../../../general_exports.dart';

class DomesticEicPage5 extends StatelessWidget {
  const DomesticEicPage5({super.key});

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
                  CustomTextFormTitle(
                    leftText: 'Part 8. ',
                    text: 'Main Switch/Switch-Fuse/Circuit Breaker/RCD'
                        .toUpperCase(),
                    marginBottom: 0.02,
                    marginLeft: 0.03,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomSelectContainer(
                          title: 'Type BS (EN)',
                          width: 0.9,
                          value: controller.formData[formKeyPart8]
                              [formKeyMainSwitchTypeBS],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeyMainSwitchTypeBS,
                              listTitles: formList.typeBSMainSwitch,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'No. of Poles',
                          isInputSelection: true,
                          marginBottom: 0.02,
                          width: 0.5,
                          value: controller.formData[formKeyPart8]
                              [formKeyMainSwitchNumberPoles],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeyMainSwitchNumberPoles,
                              listTitles: formList.listNumOfPoles,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'Voltage Rating',
                          isInputSelection: true,
                          suffix: CommonText(
                            'V',
                            style: appTextStyles.h3GreyStyle(),
                            fontWeight: FontWeight.bold,
                          ),
                          width: 0.5,
                          value: controller.formData[formKeyPart8]
                              [formKeyMainSwitchVoltageRating],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeyMainSwitchVoltageRating,
                              listTitles: formList.listNominalVoltage,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'Rated Current',
                          isInputSelection: true,
                          width: 0.5,
                          value: controller.formData[formKeyPart8]
                              [formKeyMainSwitchRatedCurrent],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeyMainSwitchRatedCurrent,
                              listTitles: formList.listRatedCurrentI,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        CommonText(
                          'If RCD Main Switch',
                          style: appTextStyles.h2StyleBlack().copyWith(
                                fontWeight: FontWeight.w500,
                                rowMainAxisSize: MainAxisSize.max,
                                textAlign: TextAlign.start,
                                rowMainAxisAlignment: MainAxisAlignment.center,
                              ),
                          containerStyle: CommonContainerModel(
                            backgroundColor:
                                Color(AppColors.grey).withOpacity(0.2),
                            borderRadius: 0.015,
                            paddingHorizontal: 0.02,
                            marginTop: 0.025,
                            marginBottom: 0.02,
                            paddingVertical: 0.006,
                          ),
                        ),
                        SmallInputField(
                          title: 'RCD Operation Current',
                          width: 0.5,
                          isInputSelection: true,
                          suffix: CommonText(
                            'mA',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          value: controller.formData[formKeyPart8]
                              [formKeyRCDMainSwitchOperationCurrent],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeyRCDMainSwitchOperationCurrent,
                              listTitles: formList.listRCDOperationCurrent,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'Rated Time Delay',
                          width: 0.5,
                          isInputSelection: true,
                          suffix: CommonText(
                            'mS',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          value: controller.formData[formKeyPart8]
                              [formKeyRCDMainSwitchRatedTime],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeyRCDMainSwitchRatedTime,
                              listTitles: formList.listRatedTimeDelay,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'RCD Operation Time',
                          width: 0.5,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.go,
                          suffix: CommonText(
                            'mS',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          value: controller.formData[formKeyPart8]
                              [formKeyRCDMainSwitchOperationTime],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart8,
                                  formKeyRCDMainSwitchOperationTime, value),
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      children: <Widget>[
                        CustomSelectContainer(
                          title: 'Supply conductor material',
                          value: controller.formData[formKeyPart8]
                              [formKeySupplyConductorMaterial],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeySupplyConductorMaterial,
                              listTitles: formList.listConductorMaterial,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'Supply conductor csa',
                          isInputSelection: true,
                          width: 0.5,
                          value: controller.formData[formKeyPart8]
                              [formKeySupplyConductorCSA],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart8,
                              keyOfValue: formKeySupplyConductorCSA,
                              listTitles: formList.listConductorCSA,
                            ),
                            elevation: 0.0,
                          ),
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
