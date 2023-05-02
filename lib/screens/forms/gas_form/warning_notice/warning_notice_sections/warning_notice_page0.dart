import '../../../../../general_exports.dart';

class WarningNoticePage0 extends StatelessWidget {
  const WarningNoticePage0({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarningNoticeController>(
      init: WarningNoticeController(),
      builder: (WarningNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingTop: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplianceSectionTitle(
                    title: 'Part 1: Gas Installation Pipework/Gas Appliance',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          topLabelText: 'APPLIANCE TYPE',
                          value: controller.formData[formKeyPart1]
                              [formKeyImportantSafetyType],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart1,
                                  formKeyImportantSafetyType, value),
                        ),
                        CustomSelectContainer(
                          title: 'LOCATION',
                          value: controller.formData[formKeyPart1]
                              [formKeyImportantSafetyLocation],
                          onTap: () => Get.bottomSheet(
                            isScrollControlled: true,
                            FormSelectItemSheet(
                              controller: controller,
                              partOfValue: formKeyPart1,
                              keyOfValue: formKeyImportantSafetyLocation,
                              listTitles: controller.location,
                            ),
                            elevation: 0.0,
                          ),
                        ),
                        0.025.ph,
                      ],
                    ),
                  ),
                  ApplianceSectionTitle(
                    title: 'Part 2: DEFECTS IDENTIFIED ON GAS EQUIPMENT',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormToggleButton(
                          title: 'Gas Escape',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyGasEscape],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyGasEscape, value),
                        ),
                        FormToggleButton(
                          title: 'Meter Issue',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyMeterIssue],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyMeterIssue, value),
                        ),
                        FormToggleButton(
                          title: 'Pipework Issue',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyPipeworkIssue],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyPipeworkIssue, value),
                        ),
                        FormToggleButton(
                          title: 'Chimney/ Flue',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyChimneyFlue],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyChimneyFlue, value),
                        ),
                        FormToggleButton(
                          title: 'Ventilation',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyVentilation],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyVentilation, value),
                        ),
                        FormToggleButton(
                          title: 'Other (Specify Below)',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyOther],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyOther, value),
                        ),
                        0.025.ph,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
