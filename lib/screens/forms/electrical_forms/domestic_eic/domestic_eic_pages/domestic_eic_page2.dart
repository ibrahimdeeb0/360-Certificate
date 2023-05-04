import '../../../../../general_exports.dart';

class DomesticEicPage2 extends StatelessWidget {
  const DomesticEicPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              // marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 3. ',
                    text: 'NEXT INSPECTION',
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    topLabel: const CommonText(
                      'I RECOMMEND that this installation is further inspected and tested after an interval of not more than',
                      fontSize: fontH3,
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                    ),
                    hint: 'N/A',
                    value: controller.formData[formKeyPart3]
                        [formKeyNextInspection],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart3, formKeyNextInspection, value),
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 4. ',
                    text: 'COMMENTS ON EXISTING INSTALLATION',
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    hint: 'N/A',
                    topLabelText: 'Additional information and report notes',
                    textInputAction: TextInputAction.newline,
                    maxLines: 6,
                    value: controller.formData[formKeyPart4]
                        [formKeyCommentsOnInstallation],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart4, formKeyCommentsOnInstallation, value),
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 5. ',
                    text: 'SCHEDULE OF ADDITIONAL RECORDS',
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    hint: 'N/A',
                    maxLines: 6,
                    marginBottom: 0.02,
                    textInputAction: TextInputAction.newline,
                    value: controller.formData[formKeyPart5]
                        [formKeyScheduleOfAdditionalRecords],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyPart5,
                            formKeyScheduleOfAdditionalRecords, value),
                  ),
                  FormToggleButton(
                    title: 'Risk assessment attached?',
                    titleSize: fontTitle,
                    toggleType: FormToggleType.trueFalse,
                    value: controller.formData[formKeyPart5]
                        [formKeyRiskAssessmentAttached],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart5, formKeyRiskAssessmentAttached, value),
                  ),
                  CommonText(
                    'Risk Assessment',
                    leftChild: Icon(
                      Icons.fmd_bad,
                      color: Colors.yellow[900],
                    ),
                    containerStyle: CommonContainerModel(
                      width: 1,
                      backgroundColor: Colors.yellow[700],
                      paddingVertical: 0.007,
                      alignment: AlignmentDirectional.center,
                      borderRadius: 0.01,
                    ),
                  ),
                  CommonInput(
                    hint: 'N/A',
                    maxLines: 8,
                    marginBottom: 0.015,
                    textInputAction: TextInputAction.newline,
                    value: controller.formData[formKeyPart5]
                        [formKeyRiskAssessment],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart5, formKeyRiskAssessment, value),
                    // scroll
                  ),
                  CommonButton(
                    onPress: controller.setRiskText,
                    text: 'Editable Sample RCD Omission Risk Assessment',
                    fontSize: fontBody,
                    height: 0.04,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
