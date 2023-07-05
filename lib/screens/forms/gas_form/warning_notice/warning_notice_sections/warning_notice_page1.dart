import '../../../../../general_exports.dart';

class WarningNoticePage1 extends StatelessWidget {
  const WarningNoticePage1({super.key});

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
                    title: 'PART 3: RIDDOR* REPORTING',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          topLabel: const CommonText(
                            'Reported to HSE under RIDDOR 11(1) (Gas Incident)',
                            textAlign: TextAlign.start,
                            marginBottom: 0.01,
                          ),
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart3]
                              [formKeyRiddorReporting1],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyRiddorReporting1, value),
                        ),
                        CommonInput(
                          topLabel: const CommonText(
                            'Reported to HSE under RIDDOR 11(2) (Dangerous Gas Fitting)',
                            textAlign: TextAlign.start,
                            marginBottom: 0.01,
                          ),
                          marginBottom: 0.02,
                          value: controller.formData[formKeyPart3]
                              [formKeyRiddorReporting2],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyRiddorReporting2, value),
                        ),
                        FormToggleButton(
                          title:
                              'The appliance/installation has been classified as ‘Immediately Dangerous’, disconnected from the gas supply and labelled “Danger Do Not Use”.	',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          axisAlignment: CrossAxisAlignment.start,
                          value: controller.formData[formKeyPart3]
                              [formKeyRiddorReporting3],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyRiddorReporting3, value),
                        ),
                        FormToggleButton(
                          title:
                              'The appliance/installation has been classified as ‘At Risk’, turned off to made safe and labelled ‘Danger Do not Use’.	',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          axisAlignment: CrossAxisAlignment.start,
                          value: controller.formData[formKeyPart3]
                              [formKeyRiddorReporting4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyRiddorReporting4, value),
                        ),
                        FormToggleButton(
                          title:
                              'The appliance/installation has been classified as ‘At Risk’, but turning off will not remove or reduce the risk and hence must be referred to the appropriate organization as advised for further assessment.	',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          axisAlignment: CrossAxisAlignment.start,
                          value: controller.formData[formKeyPart3]
                              [formKeyRiddorReporting5],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyRiddorReporting5, value),
                        ),
                      ],
                    ),
                  ),
                  0.015.boxHeight,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
