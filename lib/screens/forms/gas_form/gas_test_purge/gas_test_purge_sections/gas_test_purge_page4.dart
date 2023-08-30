import '../../../../../general_exports.dart';

class GasTestPurgePage4 extends StatelessWidget {
  const GasTestPurgePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GasTestPurgeController>(
      init: GasTestPurgeController(),
      builder: (GasTestPurgeController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormToggleButton(
              title: 'Strength Test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart4]
                  [formKeyStrengthTestGas],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart4,
                formKeyStrengthTestGas,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Tightness Test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart4]
                  [formKeyTightnessTestGas],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart4,
                formKeyTightnessTestGas,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Purge',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart4]
                  [formKeyPurgeGas],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart4,
                formKeyPurgeGas,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        );
      },
    );
  }
}
