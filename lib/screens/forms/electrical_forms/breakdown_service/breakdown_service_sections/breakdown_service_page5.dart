import '../../../../../general_exports.dart';

class BreakdownServicePage5 extends StatelessWidget {
  const BreakdownServicePage5({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomCheckBox(
              title: 'Heat Exchanger',
              isSelected: controller.formData[formKeyPart5]
                      [formKeyHeatExchanger] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart5, formKeyHeatExchanger);
              },
            ),
            CustomCheckBox(
              title: 'Ignition',
              isSelected:
                  controller.formData[formKeyPart5][formKeyIgnition] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart5, formKeyIgnition);
              },
            ),
            CustomCheckBox(
              title: 'Gas Valve',
              isSelected:
                  controller.formData[formKeyPart5][formKeyGasValve] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart5, formKeyGasValve);
              },
            ),
            CustomCheckBox(
              title: 'Fan',
              isSelected:
                  controller.formData[formKeyPart5][formKeyFan] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyPart5, formKeyFan);
              },
            ),
            CustomCheckBox(
              title: 'Safety Device',
              isSelected: controller.formData[formKeyPart5]
                      [formKeySafetyDevice] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart5, formKeySafetyDevice);
              },
            ),
            CustomCheckBox(
              title: 'Control Box',
              isSelected: controller.formData[formKeyPart5]
                      [formKeyControlBox] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart5, formKeyControlBox);
              },
            ),
            CustomCheckBox(
              title: 'Burners & Pilot',
              isSelected: controller.formData[formKeyPart5]
                      [formKeyBurnersPilot] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart5, formKeyBurnersPilot);
              },
            ),
            CustomCheckBox(
              title: 'Fuel Pressure & Type',
              isSelected:
                  controller.formData[formKeyPart5][formKeyFuel] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyPart5, formKeyFuel);
              },
            ),
          ],
        );
      },
    );
  }
}
