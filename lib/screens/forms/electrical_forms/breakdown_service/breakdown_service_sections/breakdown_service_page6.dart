import '../../../../../general_exports.dart';

class BreakdownServicePage6 extends StatelessWidget {
  const BreakdownServicePage6({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CommonText(
                'Service Checks',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            CustomCheckBox(
              title: 'Heat Exchanger',
              isSelected: controller.formData[formKeyHeatExchanger] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyHeatExchanger);
              },
            ),
            CustomCheckBox(
              title: 'Ignition',
              isSelected: controller.formData[formKeyIgnition] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyIgnition);
              },
            ),
            CustomCheckBox(
              title: 'Gas Valve',
              isSelected: controller.formData[formKeyGasValve] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyGasValve);
              },
            ),
            CustomCheckBox(
              title: 'Fan',
              isSelected: controller.formData[formKeyFan] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyFan);
              },
            ),
            CustomCheckBox(
              title: 'Safety Device',
              isSelected: controller.formData[formKeySafetyDevice] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeySafetyDevice);
              },
            ),
            CustomCheckBox(
              title: 'Control Box',
              isSelected: controller.formData[formKeyControlBox] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyControlBox);
              },
            ),
            CustomCheckBox(
              title: 'Burners & Pilot',
              isSelected: controller.formData[formKeyBurnersPilot] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyBurnersPilot);
              },
            ),
            CustomCheckBox(
              title: 'Fuel Pressure & Type',
              isSelected: controller.formData[formKeyFuel] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyFuel);
              },
            ),
          ],
        );
      },
    );
  }
}
