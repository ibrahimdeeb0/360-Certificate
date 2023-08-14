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
            /*  Center(
              child: CommonText(
                'Service Operations',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ), */
            CustomCheckBox(
              title: 'Burn & Washer Cleaned',
              isSelected: controller.formData[formKeyPart6]
                      [formKeyBurnWasherCleaned] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyBurnWasherCleaned);
              },
            ),
            CustomCheckBox(
              title: 'Pilot Assembly Cleaned & Adjusted',
              isSelected: controller.formData[formKeyPart6]
                      [formKeyPilotAssembly] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyPilotAssembly);
              },
            ),
            CustomCheckBox(
              title: 'Ignition System Cleaned & Adjusted',
              isSelected: controller.formData[formKeyPart6]
                      [formKeyIgnitionSystem] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyIgnitionSystem);
              },
            ),
            CustomCheckBox(
              title: 'Burner Fas & Airways Cleaned',
              isSelected:
                  controller.formData[formKeyPart6][formKeyBurnerFas] == 'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyBurnerFas);
              },
            ),
            CustomCheckBox(
              title: 'Heat Exchanger/Flue Ways Clean & Clear',
              isSelected: controller.formData[formKeyPart6]
                      [formKeyServiceHeatExchanger] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyServiceHeatExchanger);
              },
            ),
            CustomCheckBox(
              title: 'Fuel & Electrical Supply Connected Correctly',
              isSelected: controller.formData[formKeyPart6]
                      [formKeyFuelElectrical] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyFuelElectrical);
              },
            ),
            CustomCheckBox(
              title: 'Interlocks Noted & in Place',
              isSelected: controller.formData[formKeyPart6]
                      [formKeyInterlocksNoted] ==
                  'true',
              onPress: () {
                controller.onToggleCheckBoxValues(
                    formKeyPart6, formKeyInterlocksNoted);
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
              value: controller.formData[formKeyPart6][formKeyTimeOfArrival],
              isInputSelection: true,
              onTap: () {
                CommonDatePicker.showTime12hPicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      part: formKeyPart6,
                      key: formKeyTimeOfArrival,
                      value: value,
                      type: DateType.time12Hr,
                    );
                  },
                );
              },
            ),
            SmallInputField(
              title: 'Time of Departure',
              value: controller.formData[formKeyPart6][formKeyTimeOfDeparture],
              isInputSelection: true,
              onTap: () {
                CommonDatePicker.showTime12hPicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      part: formKeyPart6,
                      key: formKeyTimeOfDeparture,
                      value: value,
                      type: DateType.time12Hr,
                    );
                  },
                );
              },
            ),
            Divider(
              thickness: 1,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Next Inspection',
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
              marginBottom: 0.01,
            ),
            CommonInput(
              hint: 'Select Date',
              topLabelText: 'Select Date',
              suffix: const Icon(Icons.calendar_today_outlined),
              marginBottom: 0.02,
              enabled: false,
              value: controller.formData[formKeyPart6]
                  [formKeyNextInspectionDate],
              onTap: () {
                CommonDatePicker.showDatePicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      part: formKeyPart6,
                      key: formKeyNextInspectionDate,
                      value: value,
                      type: DateType.date,
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
