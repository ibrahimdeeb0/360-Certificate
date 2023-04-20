import '../../../../../general_exports.dart';

class WarningNoticePage2 extends StatelessWidget {
  const WarningNoticePage2({super.key});

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
                children: <Widget>[
                  ApplianceSectionTitle(
                    title:
                        "PART 6: AT RISK' \"IMMEDIATELY DANGEROUS\" & GAS APPLIANCES/INSTALLATIONS SHOULD NOT BE USED",
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          topLabelText: 'Make/Model',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart6]
                              [formKeyAtRiskMakeModel],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart6, formKeyAtRiskMakeModel, value),
                        ),
                        CommonInput(
                          topLabelText: 'Type',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart6]
                              [formKeyAtRiskType],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart6, formKeyAtRiskType, value),
                        ),
                        CommonInput(
                          topLabelText: 'Serial Number',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart6]
                              [formKeyAtRiskSerialNumber],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart6,
                                  formKeyAtRiskSerialNumber, value),
                        ),
                        CommonInput(
                          topLabelText: 'Location',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart6]
                              [formKeyAtRiskLocation],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart6, formKeyAtRiskLocation, value),
                        ),
                        CommonInput(
                          topLabelText: 'Reason',
                          marginBottom: 0.03,
                          value: controller.formData[formKeyPart6]
                              [formKeyAtRiskReason],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart6, formKeyAtRiskReason, value),
                        ),
                        FormToggleButton(
                          title: 'Is not to current standards',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart6]
                              [formKeyAtRiskNotCurrentStandards],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart6,
                                  formKeyAtRiskNotCurrentStandards, value),
                        ),
                      ],
                    ),
                  ),
                  ApplianceSectionTitle(
                    title: 'PART 7: CUSTOMERS ACKNOWLEDGEMENT',
                    color: Colors.grey[800],
                  ),
                  FormToggleButton(
                    title:
                        'The gas user was not present at the time of visit, and where appropriate, (an IMMEDIATELY DANGEROUS (ID) or AT RISK (AR) situation) at the installation has been made safe and this notice left on the premises',
                    toggleType: FormToggleType.yesNo,
                    textWidth: 0.6,
                    paddingHorizontal: 0.04,
                    value: controller.formData[formKeyPart7]
                        [formKeyCustomersAcknowledgment],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyPart7,
                            formKeyCustomersAcknowledgment, value),
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
