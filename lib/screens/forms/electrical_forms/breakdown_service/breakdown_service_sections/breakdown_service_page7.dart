import '../../../../../general_exports.dart';

class BreakdownServicePage7 extends StatelessWidget {
  const BreakdownServicePage7({super.key});

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
                'Service Operations',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            CustomCheckBox(
              title: 'Burn & Washer Cleaned',
              isSelected:
                  controller.formData[formKeyBurnWasherCleaned] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyBurnWasherCleaned);
              },
            ),
            CustomCheckBox(
              title: 'Pilot Assembly Cleaned & Adjusted',
              isSelected: controller.formData[formKeyPilotAssembly] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyPilotAssembly);
              },
            ),
            CustomCheckBox(
              title: 'Ignition System Cleaned & Adjusted',
              isSelected: controller.formData[formKeyIgnitionSystem] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyIgnitionSystem);
              },
            ),
            CustomCheckBox(
              title: 'Burner Fas & Airways Cleaned',
              isSelected: controller.formData[formKeyBurnerFas] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyBurnerFas);
              },
            ),
            CustomCheckBox(
              title: 'Heat Exchanger/Flue Ways Clean & Clear',
              isSelected:
                  controller.formData[formKeyServiceHeatExchanger] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyServiceHeatExchanger);
              },
            ),
            CustomCheckBox(
              title: 'Fuel & Electrical Supply Connected Correctly',
              isSelected: controller.formData[formKeyFuelElectrical] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyFuelElectrical);
              },
            ),
            CustomCheckBox(
              title: 'Interlocks Noted & in Place',
              isSelected: controller.formData[formKeyInterlocksNoted] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(formKeyInterlocksNoted);
              },
            ),
            Divider(
              thickness: 1,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Time',
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            SmallInputField(
              title: 'Time of Arrival',
              value: controller.formData[formKeyTimeOfArrival],
              onChanged: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyTimeOfArrival, value),
            ),
            SmallInputField(
              title: 'Time of Departure',
              value: controller.formData[formKeyTimeOfDeparture],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyTimeOfDeparture, value),
            ),
            Divider(
              thickness: 1,
              height: 0.05.flexHeight,
            ),
            CommonInput(
              hint: 'Select Date',
              topLabel: CommonText(
                'Next Inspection',
                fontColor: Color(AppColors.primary),
                fontSize: fontH2,
                marginBottom: 0.01,
              ),
              suffix: const Icon(Icons.calendar_today_outlined),
              marginBottom: 0.02,
              enabled: false,
              value: controller.formData[formKeyDeclaration]
                  [formKeyNextInspectionDate],
              onTap: () {
                CommonDatePicker.showDatePicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      formKeyDeclaration,
                      formKeyNextInspectionDate,
                      value,
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
