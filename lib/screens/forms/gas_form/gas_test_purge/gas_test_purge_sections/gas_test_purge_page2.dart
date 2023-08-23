import '../../../../../general_exports.dart';
import '../index.dart';

class GasTestPurgePage2 extends StatelessWidget {
  const GasTestPurgePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GasTestPurgeController>(
      init: GasTestPurgeController(),
      builder: (GasTestPurgeController controller) {
        return Column(
          children: <Widget>[
            CommonText(
              'Tightness Test Details',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            FormToggleButton(
              title: 'Gas type Natural gas 9NG) Liquefied Petroleum Gas (LPG))',
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
              title: 'Could weather or changes in temperature affect test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyMaintenance],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyMaintenance, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            const SmallInputField(
              title: 'Meter type (Diaphragm, Rotary etc)',
              suffix: Icon(Icons.keyboard_arrow_down),
              isInputSelection: true,
            ),
            const SmallInputField(
              title: 'Meter type (U16, U40,P7 etc)',
              suffix: Icon(Icons.keyboard_arrow_down),
              isInputSelection: true,
            ),
            FormToggleButton(
              title: 'Meter bypass installed',
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
            
            const SmallInputField(
              title: 'Gas Meter (m2)',
            ),
            const SmallInputField(
              title: 'Installation pipework & fittings(m2)',
            ),
            const SmallInputField(
              title: 'Total IV(m2)',
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            const SmallInputField(
              title: 'Test medium-fuel gas, air',
              suffix: Icon(Icons.keyboard_arrow_down),
              isInputSelection: true,
            ),
            const SmallInputField(
              title: 'Tightness test pressure(TTP),mbar/bar',
            ),
            const SmallInputField(
              title: 'Pressure gauge type (water,high SG,electronic etc)',
            ),
            const SmallInputField(
              title: 'MPLR m3/h (IGE/UP/1)or MAPD mbar (IGE/UP/1A)',
            ),
            const SmallInputField(
              title: 'Let by test period existing installation (minutes)',
            ),
            const SmallInputField(
              title: 'Stabilization period (Minutes)',
            ),
            const SmallInputField(
              title: 'Tightness test duration (TTD) (minutes)',
            ),
            FormToggleButton(
              title: 'Any inadequately ventilated areas to check?',
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
              title: 'Is barometric pressure correction necessary',
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
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Findings',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            const SmallInputField(
              title: 'Actual pressure drop (if any) mbar',
            ),
            const SmallInputField(
              title: 'Actual leak rate m3/hr**',
            ),
            FormToggleButton(
              title: 'Have inadequately ventilated areas been checked?',
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
            const SmallInputField(
              title: 'Tightness test Pass or Fail',
              suffix: Icon(Icons.keyboard_arrow_down),
              isInputSelection: true,
            ),
          ],
        );
      },
    );
  }
}
