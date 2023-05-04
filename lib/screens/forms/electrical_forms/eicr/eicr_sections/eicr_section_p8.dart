import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class EICRSectionH extends StatelessWidget {
  const EICRSectionH({super.key});

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return GetBuilder<EicrController>(
      builder: (EicrController controller) {
        return CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: 'Part 8. ', //H
                text: 'Main protective conductors',
              ),
              const CommonText(
                'Earthing conductor',
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
                marginTop: 0.02,
              ),

              CustomSelectContainer(
                title: 'Conductor Material',
                value: controller.gazSafetyData[formKeyConductorMaterialH1],
                hint: 'Answer',
                onTap: () => Get.bottomSheet(
                  EICRSelectBT(
                    listTitles: formList.listConductorMaterial,
                    keyOfValue: formKeyConductorMaterialH1,
                    controller: controller,
                  ),
                  elevation: 0.0,
                ),
              ),
              SmallInputField(
                title: 'Conductor csa',
                value: controller.gazSafetyData[formKeyConductorCsaH1],
                onTap: () => Get.bottomSheet(
                  EICRSelectBT(
                    listTitles: formList.listConductorCSA,
                    keyOfValue: formKeyConductorCsaH1,
                    controller: controller,
                  ),
                  elevation: 0.0,
                ),
                isInputSelection: true,
                suffix: SvgPicture.asset(
                  iconMM,
                  width: DEVICE_WIDTH * 0.016,
                  height: DEVICE_HEIGHT * 0.016,
                ),
              ),
              FormToggleButton(
                title: 'Continuity check (✓)',
                value: controller.gazSafetyData[formKeyContinuityCheckH1],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyContinuityCheckH1, value),
                toggleType: FormToggleType.trueFalse,
              ),
              const CommonText(
                'Main protective bonding conductor',
                fontSize: fontH3,
                textAlign: TextAlign.start,
                rowMainAxisSize: MainAxisSize.max,
                marginBottom: 0.01,
                containerStyle: CommonContainerModel(width: 1),
              ),
              CustomSelectContainer(
                title: 'Conductor Material',
                value: controller.gazSafetyData[formKeyConductorMaterialH2],
                hint: 'Answer',
                onTap: () => Get.bottomSheet(
                  EICRSelectBT(
                    listTitles: formList.listConductorMaterial,
                    keyOfValue: formKeyConductorMaterialH2,
                    controller: controller,
                  ),
                  elevation: 0.0,
                ),
              ),
              SmallInputField(
                title: 'Conductor csa',
                value: controller.gazSafetyData[formKeyConductorCsaH2],
                onTap: () => Get.bottomSheet(
                  EICRSelectBT(
                    listTitles: formList.listConductorCSA,
                    keyOfValue: formKeyConductorCsaH2,
                    controller: controller,
                  ),
                  elevation: 0.0,
                ),
                isInputSelection: true,
                suffix: SvgPicture.asset(
                  iconMM,
                  width: DEVICE_WIDTH * 0.016,
                  height: DEVICE_HEIGHT * 0.016,
                ),
              ),
              FormToggleButton(
                title: 'Continuity check',
                value: controller.gazSafetyData[formKeyContinuityCheckH2],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyContinuityCheckH2, value),
                toggleType: FormToggleType.trueFalse,
              ),
              const CommonText(
                'Main protective bonding conductors to extraneous conductive parts',
                fontSize: fontH3,
                textAlign: TextAlign.start,
                marginBottom: 0.025,
              ),
              //*----
              FormToggleButton(
                title: 'Water installation pipes',
                value: controller.gazSafetyData[formKeyWaterInstallationPipesH],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyWaterInstallationPipesH, value),
                toggleType: FormToggleType.trueFalse,
              ),
              FormToggleButton(
                title: 'Gas installation',
                value: controller.gazSafetyData[formKeyGasInstallationH],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyGasInstallationH, value),
                toggleType: FormToggleType.trueFalse,
              ),
              FormToggleButton(
                title: 'Oil installation pipes',
                value: controller.gazSafetyData[formKeyOilInstallationPipesH],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyOilInstallationPipesH, value),
                toggleType: FormToggleType.trueFalse,
              ),
              FormToggleButton(
                title: 'Structural steel',
                value: controller.gazSafetyData[formKeyStructuralSteelH],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyStructuralSteelH, value),
                toggleType: FormToggleType.trueFalse,
              ),
              FormToggleButton(
                title: 'Other services',
                value: controller.gazSafetyData[formKeyOtherServicesH],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyOtherServicesH, value),
                toggleType: FormToggleType.trueFalse,
              ),
            ],
          ),
        );
      },
    );
  }
}
