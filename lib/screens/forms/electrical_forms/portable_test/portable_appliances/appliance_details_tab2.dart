import '../../../../../general_exports.dart';

class ApplianceDetailsPage2 extends StatelessWidget {
  const ApplianceDetailsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplianceListValues list = ApplianceListValues();
    return GetBuilder<PortableAppliancesController>(
      builder: (PortableAppliancesController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingBottom: 0.0,
              backgroundColor: Colors.grey[200],
              child: Column(
                children: <Widget>[
                  CommonText(
                    'MEASURED RESULTS \n(if applicable)',
                    rowMainAxisSize: MainAxisSize.max,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rightChild: CommonText(
                      'N/A',
                      rightChild: Switch(
                        activeTrackColor: Colors.green[700],
                        value: true,
                        onChanged: (bool value) {},
                      ),
                    ),
                  ),
                  0.02.ph,
                  SmallInputField(
                    title: 'Earth continuity test',
                    hint: 'N/A',
                    keyboardType: TextInputType.phone,
                    suffix: const CommonText(
                      'Ω',
                      fontSize: fontH4,
                      fontWeight: FontWeight.bold,
                    ),
                    width: 0.5,
                    value: controller.applianceDetails[formKeyEarthContinuity],
                    onChanged: (dynamic value) => controller
                        .onChangeChildeValues(formKeyEarthContinuity, value),
                  ),
                  SmallInputField(
                    title: 'Insulation test',
                    hint: 'N/A',
                    keyboardType: TextInputType.phone,
                    suffix: const CommonText(
                      'MΩ',
                      fontSize: fontH4,
                      fontWeight: FontWeight.bold,
                    ),
                    width: 0.5,
                    value: controller.applianceDetails[formKeyInsulationTest],
                    onChanged: (dynamic value) => controller
                        .onChangeChildeValues(formKeyInsulationTest, value),
                  ),
                  SmallInputField(
                    title: 'Load test',
                    hint: 'N/A',
                    keyboardType: TextInputType.phone,
                    suffix: const CommonText(
                      'kvA',
                      fontSize: fontH4,
                      fontWeight: FontWeight.bold,
                    ),
                    width: 0.5,
                    value: controller.applianceDetails[formKeyLoadTest],
                    onChanged: (dynamic value) =>
                        controller.onChangeChildeValues(formKeyLoadTest, value),
                  ),
                  SmallInputField(
                    title: 'Earth leakage test',
                    hint: 'N/A',
                    keyboardType: TextInputType.phone,
                    suffix: const CommonText(
                      'mA',
                      fontSize: fontH4,
                      fontWeight: FontWeight.bold,
                    ),
                    width: 0.5,
                    value: controller.applianceDetails[formKeyEarthLeakageTest],
                    onChanged: (dynamic value) => controller
                        .onChangeChildeValues(formKeyEarthLeakageTest, value),
                  ),
                ],
              ),
            ),
            CommonContainer(
              borderColor: Colors.black87,
              borderRadius: 0.02,
              borderWidth: 1,
              marginVertical: 0.01,
              marginHorizontal: 0.04,
              paddingHorizontal: 0.03,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    controller.applianceDetails[formKeyTestResult],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontColor: controller.applianceDetails[formKeyTestResult] ==
                            'PASSED'
                        ? Colors.green
                        : Colors.red,
                  ),
                  const CommonText(
                    'Electrical Safety Test',
                    fontSize: fontH2,
                    fontWeight: FontWeight.bold,
                  ),
                  SmallInputField(
                    title: 'Appliance ID',
                    keyboardType: TextInputType.number,
                    value: controller.applianceDetails[formKeyApplianceNumber],
                    marginBottom: 0.015,
                    width: 0.4,
                    isInputSelection: true,
                    suffix: const SizedBox(),
                  ),
                  SmallInputField(
                    title: 'Visual Check',
                    value: controller.applianceDetails[formKeyVisualCheck],
                    onTap: () => Get.bottomSheet(
                      ApplianceSelectSheet(
                        listTitles: list.listTestVisualCheck,
                        keyOfValue: formKeyVisualCheck,
                        controller: controller,
                        isChilde: true,
                      ),
                    ),
                    isInputSelection: true,
                    marginBottom: 0.015,
                    width: 0.4,
                  ),
                  SmallInputField(
                    title: 'Fuse Rating (Amps)',
                    keyboardType: TextInputType.phone,
                    marginBottom: 0.015,
                    width: 0.4,
                    value: controller.applianceDetails[formKeyFuseRatingAmps],
                    onChanged: (dynamic value) => controller
                        .onChangeChildeValues(formKeyFuseRatingAmps, value),
                  ),
                  FormToggleButton(
                    textWidth: 0.0,
                    textWidget: const CommonText(
                      'Result',
                      fontWeight: FontWeight.bold,
                    ),
                    toggleType: FormToggleType.passFailed,
                    value: controller.applianceDetails[formKeyTestResult],
                    onChangeValue: (dynamic value) => controller
                        .onChangeResultValues(formKeyTestResult, value),
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingBottom: 0.0,
              backgroundColor: Colors.grey[200],
              child: CommonInput(
                onTap: () {
                  Get.bottomSheet(
                    CustomDangerousCondition(
                      buttonLabel: 'Select',
                      items: list.listTestRepairCode,
                      initialValue:
                          controller.applianceDetails[formKeyRepairCode],
                      onSelectedItemChanged: (String value) {
                        controller.onChangeChildeValues(
                            formKeyRepairCode, value);
                        controller.update();
                        Get.back();
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
                enabled: false,
                topLabelText: 'Repair Code (if applicable)',
                hint: 'select',
                marginBottom: 0.02,
                suffix: const Icon(Icons.keyboard_arrow_down),
                value: controller.applianceDetails[formKeyRepairCode],
              ),
            ),
            0.02.ph,
          ],
        );
      },
    );
  }
}
