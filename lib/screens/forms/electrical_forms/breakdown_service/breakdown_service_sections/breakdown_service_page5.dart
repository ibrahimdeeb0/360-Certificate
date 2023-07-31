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
            Center(
              child: CommonText(
                'Installation Details',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            CustomCheckBox(
              title: 'Ventilation Size/H-L',
              isSelected: controller.formData[formKeyVentilationSize] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyVentilationSize);
              },
            ),
            CustomCheckBox(
              title: 'Water/Fuel-Satisfactory',
              isSelected:
                  controller.formData[formKeyWaterFuelSatisfactory] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyWaterFuelSatisfactory);
              },
            ),
            CustomCheckBox(
              title: 'Electrically Fused',
              isSelected:
                  controller.formData[formKeyElectricallyFused] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyElectricallyFused);
              },
            ),
            CustomCheckBox(
              title: 'Correct Valving Arrangements',
              isSelected: controller.formData[formKeyCorrectValving] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyCorrectValving);
              },
            ),
            CustomCheckBox(
              title: 'Isolation Available - Electrical/Fuel',
              isSelected:
                  controller.formData[formKeyIsolationAvailable] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyIsolationAvailable);
              },
            ),
            CustomCheckBox(
              title: 'Boiler/Plant Room Cleaner',
              isSelected: controller.formData[formKeyBoilerPlantRoom] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyBoilerPlantRoom);
              },
            ),
          ],
        );
      },
    );
  }
}
