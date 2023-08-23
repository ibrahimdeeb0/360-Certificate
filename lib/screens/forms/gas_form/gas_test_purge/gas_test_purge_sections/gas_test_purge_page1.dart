import '../../../../../general_exports.dart';
import '../index.dart';

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
              value: controller.formData[formKeyPart1]
                  [formKeyServiceMaintenance],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyServiceMaintenance,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Installation-New-(N) New Extension-(NE) Existing-(E)',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyMaintenance],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyMaintenance, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title:
                  'Have components not suitable for strength testing been removed or isolated from installation',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyMaintenance],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyMaintenance, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            const SmallInputField(
              title: 'Calculated strength test pressure (STP) (mbar/bar)',
            ),
            const SmallInputField(
              title: 'Test medium',
              suffix: Icon(Icons.keyboard_arrow_down),
              isInputSelection: true,
            ),
            const SmallInputField(
              title: 'Stabilization period (Minutes)',
            ),
            const SmallInputField(
              title: 'Strength test duration (STD) (Minutes)',
            ),
            const SmallInputField(
              title: 'Permitted presume drop (% STP)',
            ),
            const SmallInputField(
              title: 'Calculated presume drop (mbar/bar)',
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
            const SmallInputField(
              title: 'Calculated presume drop (mbar/bar)',
            ),
            FormToggleButton(
              title: 'Gas tightness test carried out?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyGasCarriedOut],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyGasCarriedOut,
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
