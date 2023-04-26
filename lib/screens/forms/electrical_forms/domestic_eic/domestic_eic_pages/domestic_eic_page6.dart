import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class DomesticEicPage6 extends StatelessWidget {
  const DomesticEicPage6({super.key});

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
                    leftText: 'Part 9. ',
                    text: '',
                    marginBottom: 0.02,
                    marginLeft: 0.03,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CommonText(
                          'Earthing conductor',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                        ),
                        CustomSelectContainer(
                          title: 'Conductor material',
                          value: controller.formData[formKeyPart9]
                              [formKeyEarthingConductorConductorMaterial],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart9,
                              keyOfValue:
                                  formKeyEarthingConductorConductorMaterial,
                              listTitles: formList.listConductorMaterial,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'Conductor csa',
                          isInputSelection: true,
                          width: 0.5,
                          suffix: SvgPicture.asset(
                            iconMM,
                            width: DEVICE_WIDTH * 0.016,
                            height: DEVICE_HEIGHT * 0.016,
                          ),
                          value: controller.formData[formKeyPart9]
                              [formKeyEarthingConductorConductorCSA],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart9,
                              keyOfValue: formKeyEarthingConductorConductorCSA,
                              listTitles: formList.listConductorCSA,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        FormToggleButton(
                          title: 'Continuity check',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          value: controller.formData[formKeyPart9]
                              [formKeyEarthingConductorConductorCheck],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart9,
                                  formKeyEarthingConductorConductorCheck,
                                  value),
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CommonText(
                          'Main protective bonding conductors to extraneous conductive parts',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                          textAlign: TextAlign.start,
                        ),
                        CustomSelectContainer(
                          title: 'Conductor material',
                          value: controller.formData[formKeyPart9]
                              [formKeyMainProtectiveConductorMaterial],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart9,
                              keyOfValue:
                                  formKeyMainProtectiveConductorMaterial,
                              listTitles: formList.listConductorMaterial,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        SmallInputField(
                          title: 'Conductor csa',
                          width: 0.5,
                          isInputSelection: true,
                          suffix: SvgPicture.asset(
                            iconMM,
                            width: DEVICE_WIDTH * 0.016,
                            height: DEVICE_HEIGHT * 0.016,
                          ),
                          value: controller.formData[formKeyPart9]
                              [formKeyMainProtectiveConductorCSA],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart9,
                              keyOfValue: formKeyMainProtectiveConductorCSA,
                              listTitles: formList.listConductorCSA,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        CustomSelectContainer(
                          title: 'Location (where not obvious)',
                          value: controller.formData[formKeyPart9]
                              [formKeyMainProtectiveLocation],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart9,
                              keyOfValue: formKeyMainProtectiveLocation,
                              listTitles: formList.locationEIC,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormToggleButton(
                          title: 'Water installation pipes',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart9]
                              [formKeyWaterInstallation],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart9,
                                  formKeyWaterInstallation, value),
                        ),
                        FormToggleButton(
                          title: 'Gas installation pipes',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart9]
                              [formKeyGasInstallation],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart9, formKeyGasInstallation, value),
                        ),
                        FormToggleButton(
                          title: 'Oil installation pipes',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart9]
                              [formKeyOilInstallation],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart9, formKeyOilInstallation, value),
                        ),
                        FormToggleButton(
                          title: 'Structural steel',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart9]
                              [formKeyStructuralSteel],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart9, formKeyStructuralSteel, value),
                        ),
                        FormToggleButton(
                          title: 'Other services',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart9]
                              [formKeyOtherServices],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart9, formKeyOtherServices, value),
                        ),
                        const CommonText(
                          '*List in remarks section',
                          fontSize: fontBody,
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
