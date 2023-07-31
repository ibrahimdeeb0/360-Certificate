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
                'Service Operations',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            const CheckBoxComponent(text: 'Burn & Washer Cleaned'),
            const CheckBoxComponent(text: 'Pilot Assembly Cleaned & Adjusted'),
            const CheckBoxComponent(
              text: 'Ignition System Cleaned & Adjusted',
            ),
            const CheckBoxComponent(
              text: 'Burner Fas & Airways Cleaned',
            ),
            const CheckBoxComponent(
              text: 'Heat Exchanger/Flueways Clean & Clear',
            ),
            const CheckBoxComponent(
              text: 'Fuel & Electrical Supply Connected Correctly',
            ),
            const CheckBoxComponent(
              text: 'Interlocks Noted & in Place',
            ),
            Divider(
              thickness: 1,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Hours',
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            const SmallInputField(
              title: 'Time of Arrival',
            ),
            const SmallInputField(
              title: 'Time of Departure',
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
                  [formKeyEngineerDate],
              onTap: () {
                CommonDatePicker.showDatePicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      formKeyDeclaration,
                      formKeyEngineerDate,
                      value,
                    );
                  },
                );
              },
            ),
            const CommonButton(
              text: 'Add Reminder',
            )
          ],
        );
      },
    );
  }
}
