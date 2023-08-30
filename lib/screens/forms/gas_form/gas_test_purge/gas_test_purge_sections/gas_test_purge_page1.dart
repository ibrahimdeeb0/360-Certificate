import '../../../../../general_exports.dart';

class GasTestPurgePage1 extends StatelessWidget {
  const GasTestPurgePage1({super.key});

  @override
  Widget build(BuildContext context) {
    final ListGasTestPurge list = ListGasTestPurge();
    return GetBuilder<GasTestPurgeController>(
      init: GasTestPurgeController(),
      builder: (GasTestPurgeController controller) {
        return Column(
          children: <Widget>[
            CommonText(
              'Strength Test Details',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            FormToggleButton(
              title: 'State test method pneumatic (P) or hydrostatic (H)',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyStateTest],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyStateTest,
                value,
              ),
              toggleType: FormToggleType.statTest,
            ),
            FormToggleButton(
              title: 'Installation-New-(N) New Extension-(NE) Existing-(E)',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyInstallation],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyInstallation, value),
              toggleType: FormToggleType.installation,
            ),
            FormToggleButton(
              title:
                  'Have components not suitable for strength testing been removed or isolated from installation',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyHaveComponents],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyHaveComponents, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            SmallInputField(
              title: 'Calculated strength test pressure (STP) (mbar/bar)',
              value: controller.formData[formKeyPart1]
                  [formKeyCalculatedStrength],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyCalculatedStrength, value),
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                GasTestPurgeSelectSheet(
                  keyOfPart: formKeyPart1,
                  keyOfValue: formKeyTestMedium,
                  listTitles: list.listTestMedium,
                  controller: controller,
                  keyOfGasTestPurgeType: formKeyTestMedium,
                ),
                isScrollControlled: true,
              ),
              child: SmallInputField(
                title: 'Test medium',
                value: controller.formData[formKeyPart1][formKeyTestMedium],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart1, formKeyTestMedium, value),
                suffix: const Icon(Icons.keyboard_arrow_down),
                isInputSelection: true,
              ),
            ),
            SmallInputField(
              title: 'Stabilization period (Minutes)',
              value: controller.formData[formKeyPart1]
                  [formKeyStabilizationPeriod],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyStabilizationPeriod, value),
            ),
            SmallInputField(
              title: 'Strength test duration (STD) (Minutes)',
              value: controller.formData[formKeyPart1][formKeyStrengthDuration],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyStrengthDuration, value),
            ),
            SmallInputField(
              title: 'Permitted presume drop (% STP)',
              value: controller.formData[formKeyPart1][formKeyPermittedPresume],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyPermittedPresume, value),
            ),
            SmallInputField(
              title: 'Calculated presume drop (mbar/bar)',
              value: controller.formData[formKeyPart1]
                  [formKeyCalculatedPresume],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyCalculatedPresume, value),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Findings',
              textAlign: TextAlign.center,
              marginTop: 0.01,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            SmallInputField(
              title: 'Actual presume drop (mbar/bar)',
              value: controller.formData[formKeyPart1][formKeyActualPresume],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyActualPresume, value),
            ),
            FormToggleButton(
              title: 'Strength test Pass or Fail',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyStrengthTest],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyStrengthTest,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
          ],
        );
      },
    );
  }
}
