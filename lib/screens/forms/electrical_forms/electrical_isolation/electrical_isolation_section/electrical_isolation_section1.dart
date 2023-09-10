import '../../../../../general_exports.dart';

class ElectricalIsolationPage1 extends StatelessWidget {
  const ElectricalIsolationPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectricalIsolationController>(
      init: ElectricalIsolationController(),
      builder: (ElectricalIsolationController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CommonText(
                'EQIUPMENT DETAILS',
                fontSize: fontH2,
                fontColor: Color(AppColors.primary),
              ),
            ),
            CommonInput(
              topLabelText: 'Location',
              marginTop: 0.01,
              value: controller.formData[formKeyPart1]
                  [formKeyIsolationLocation],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyIsolationLocation,
                value,
              ),
            ),
            CommonInput(
              topLabelText: 'Equipment/Circuit to be isolated',
              value: controller.formData[formKeyPart1][formKeyEquipment],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyEquipment,
                value,
              ),
            ),
            CommonInput(
              topLabelText: 'SAFETY LOCKS have been fitted at',
              value: controller.formData[formKeyPart1][formKeySafty],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyPart1,
                formKeySafty,
                value,
              ),
            ),
            CommonInput(
              topLabelText: 'CAUTION NOTICES posted at:',
              value: controller.formData[formKeyPart1][formKeyCaution],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyCaution,
                value,
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            Center(
              child: CommonText(
                'DETAILS OF ISOLATION',
                marginTop: 0.01,
                marginBottom: 0.03,
                fontSize: fontH2,
                fontColor: Color(AppColors.primary),
              ),
            ),
            FormToggleButton(
              title: 'Fuses removed',
              titleSize: fontH2,
              value: controller.formData[formKeyPart1][formKeyFuses],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyFuses,
                value,
              ),
            ),
            FormToggleButton(
              title: 'Isolated in OFF position',
              titleSize: fontH2,
              value: controller.formData[formKeyPart1][formKeyIsolationOff],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyIsolationOff,
                value,
              ),
            ),
            FormToggleButton(
              title: 'MCB in OFF position',
              titleSize: fontH2,
              value: controller.formData[formKeyPart1][formKeyMcbOff],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyMcbOff,
                value,
              ),
            ),
            FormToggleButton(
              title: 'Safety Locks fitted',
              titleSize: fontH2,
              value: controller.formData[formKeyPart1][formKeyFitted],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyFitted,
                value,
              ),
            ),
            FormToggleButton(
              title: 'Tags fitted',
              titleSize: fontH2,
              value: controller.formData[formKeyPart1][formKeyTagsFitted],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyTagsFitted,
                value,
              ),
            ),
            SmallInputField(
              title: 'Time of isolation',
              value: controller.formData[formKeyPart1][formKeyTimeIsolation],
              isInputSelection: true,
              onTap: () {
                CommonDatePicker.showTime12hPicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      part: formKeyPart1,
                      key: formKeyTimeIsolation,
                      value: value,
                      type: DateType.time12Hr,
                    );
                  },
                );
              },
            ),
            CommonInput(
              topLabelText: 'Note',
              maxLines: 6,
              value: controller.formData[formKeyPart1][formKeyIsolationNote],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyIsolationNote, value),
            ),
          ],
        );
      },
    );
  }
}
