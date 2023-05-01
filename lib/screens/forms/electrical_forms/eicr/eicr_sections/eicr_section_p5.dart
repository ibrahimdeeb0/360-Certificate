import '../../../../../general_exports.dart';

class EICRSectionE extends StatelessWidget {
  const EICRSectionE({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      builder: (EicrController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginBottom: 0.0,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 5. ', //E
                    text: 'Recommendations',
                    marginBottom: 0.025,
                  ),
                  const CommonText(
                    "Where overall assessment of the suitability of the installation for continued use on page 1 is stated as UNSATISFACTORY, I/we recommend that any observations classified as 'Danger present' (Code C1) or 'Potentially dangerous' (Code C2) are acted upon as a matter of urgent investigation without delay. For observations identified as 'Requiring further investigation' or Observations classified as 'improvement recommended' (Code C3) should be given due consideration.",
                    textAlign: TextAlign.start,
                    fontSize: fontH3,
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabel: const CommonText(
                      'Subject to the necessary corrective action being taken, I/w recommend that the installation is further inspected and tested by',
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                      fontSize: fontH3,
                    ),
                    onTap: () {
                      Get.bottomSheet(const SelectDateSheet());
                      // CommonDatePicker.showPicker(context);
                      // CommonDatePicker.showDatePicker(
                      //   context,
                      //   onConfirm: (DateTime value) {
                      //     controller.onConfirmDate(
                      //       dateTime: value,
                      //       type: FormDateType.recommendation,
                      //     );
                      //   },
                      //   currentTime: controller.currentTime,
                      // );
                    },
                    enabled: false,
                    hint: 'select',
                    value: controller
                                .gazSafetyData[formKeyYearsRecommendationsE] !=
                            ''
                        ? controller.gazSafetyData[formKeyYearsRecommendationsE]
                            .toString()
                        : controller
                            .gazSafetyData[formKeyMonthRecommendationsE],
                    marginBottom: 0.02,
                    suffix: const Icon(Icons.keyboard_arrow_down),
                  ),
                  CommonInput(
                    topLabelText: 'Type reason for recommendation: ',
                    hint: 'type...',
                    marginBottom: 0.015,
                    maxLines: 3,
                    value:
                        controller.gazSafetyData[formKeyReasonRecommendationsE],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyReasonRecommendationsE, value),
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: '',
                    text: 'Schedule',
                    marginBottom: 0.02,
                  ),
                  const CommonText(
                    'The Attached Schedule(s) are part of this document and this report is valid only when they are attached to it.',
                    fontSize: fontH3,
                    textAlign: TextAlign.start,
                    marginBottom: 0.02,
                  ),
                  FormToggleButton(
                    title: 'Schedule(s) of Inspection, and',
                    toggleType: FormToggleType.trueFalse,
                    value: controller.gazSafetyData[formKeyScheduleInspectionE],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyScheduleInspectionE, value),
                  ),

                  FormToggleButton(
                    title: 'Schedule(s) of Test Result Attached',
                    toggleType: FormToggleType.trueFalse,
                    value: controller.gazSafetyData[formKeyScheduleTestE],
                    onChangeValue: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyScheduleTestE, value),
                  ),
                  // const FormPassTextQuestions(
                  //   title: 'Schedule(s) of Inspection, and',
                  //   value: 'N/A',
                  //   titleSize: fontBody,
                  //   marginTop: 0.02,
                  // ),
                  // const FormPassTextQuestions(
                  //   title: 'Schedule(s) of Test Result Attached',
                  //   value: 'N/A',
                  //   titleSize: fontBody,
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
