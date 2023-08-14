import '../../../../../general_exports.dart';

class BreakdownServicePage4 extends StatelessWidget {
  const BreakdownServicePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomCheckBox(
              title: 'Ventilation Size/H-L',
              isSelected: controller.formData[formKeyPart4]
                      [formKeyVentilationSize] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart4, formKeyVentilationSize);
              },
            ),
            CustomCheckBox(
              title: 'Water/Fuel-Satisfactory',
              isSelected: controller.formData[formKeyPart4]
                      [formKeyWaterFuelSatisfactory] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart4, formKeyWaterFuelSatisfactory);
              },
            ),
            CustomCheckBox(
              title: 'Electrically Fused',
              isSelected: controller.formData[formKeyPart4]
                      [formKeyElectricallyFused] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart4, formKeyElectricallyFused);
              },
            ),
            CustomCheckBox(
              title: 'Correct Valving Arrangements',
              isSelected: controller.formData[formKeyPart4]
                      [formKeyCorrectValving] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart4, formKeyCorrectValving);
              },
            ),
            CustomCheckBox(
              title: 'Isolation Available - Electrical/Fuel',
              isSelected: controller.formData[formKeyPart4]
                      [formKeyIsolationAvailable] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart4, formKeyIsolationAvailable);
              },
            ),
            CustomCheckBox(
              title: 'Boiler/Plant Room Cleaner',
              isSelected: controller.formData[formKeyPart4]
                      [formKeyBoilerPlantRoom] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart4, formKeyBoilerPlantRoom);
              },
            ),
          ],
        );
      },
    );
  }
}
