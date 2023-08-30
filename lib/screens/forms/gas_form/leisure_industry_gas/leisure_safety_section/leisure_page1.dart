import '../../../../../general_exports.dart';

class LeisurePage2 extends StatelessWidget {
  const LeisurePage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeisureIndustryController>(
      init: LeisureIndustryController(),
      builder: (LeisureIndustryController controller) {
        return CommonContainer(
          // style: appContainerStyles.containerStyles,
          marginHorizontal: 0.04,
          marginTop: 0.02,
          child: Column(
            children: <Widget>[
              CommonText(
                'Pipework Inspection Details',
                marginBottom: 0.02,
                fontWeight: FontWeight.w600,
                fontColor: Color(AppColors.primary),
              ),
              Column(
                children: <Widget>[
                  FormToggleButton(
                    title: 'Gas pipework visual inspection',
                    toggleType: FormToggleType.passFailedNA,
                    textWidth: 0.6,
                    value: controller.formData[formKeyPart2]
                        [formKeyPipeworkVisualP2],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyPipeworkVisualP2, value),
                  ),
                  FormToggleButton(
                    title: 'Outcome of gas supply pipework visual inspection',
                    toggleType: FormToggleType.passFailedNA,
                    textWidth: 0.6,
                    value: controller.formData[formKeyPart2]
                        [formKeyPipeworkOutcomeSupplyP2],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyPart2,
                            formKeyPipeworkOutcomeSupplyP2, value),
                  ),
                  FormToggleButton(
                    title:
                        'Is the Emergency Control Valve access satisfactory?',
                    toggleType: FormToggleType.passFailedNA,
                    textWidth: 0.6,
                    value: controller.formData[formKeyPart2]
                        [formKeyPipeworkEmergencyP2],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyPipeworkEmergencyP2, value),
                  ),
                  FormToggleButton(
                    title: 'Outcome of gas tightness test?',
                    toggleType: FormToggleType.passFailedNA,
                    textWidth: 0.6,
                    value: controller.formData[formKeyPart2]
                        [formKeyPipeworkOutcomeTightnessP2],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyPart2,
                            formKeyPipeworkOutcomeTightnessP2, value),
                  ),
                  FormToggleButton(
                    title: 'Is protective equipotential bonding satisfactory?',
                    toggleType: FormToggleType.passFailedNA,
                    textWidth: 0.6,
                    value: controller.formData[formKeyPart2]
                        [formKeyPipeworkProtectiveP2],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyPipeworkProtectiveP2, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                  CommonText(
                    'Defects Identified',
                    rowMainAxisSize: MainAxisSize.max,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    fontWeight: FontWeight.w600,
                    marginTop: 0.01,
                    fontColor: Color(AppColors.primary),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.015.flexHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '1',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart3]
                              [formKeyDefectsIdentified1],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart3,
                                  formKeyDefectsIdentified1, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '2',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart3]
                              [formKeyDefectsIdentified2],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart3,
                                  formKeyDefectsIdentified2, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '3',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart3]
                              [formKeyDefectsIdentified3],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart3,
                                  formKeyDefectsIdentified3, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '4',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart3]
                              [formKeyDefectsIdentified4],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart3,
                                  formKeyDefectsIdentified4, value),
                        ),
                        CommonInput(
                          prefix: const PrefixTextNum(
                            num: '5',
                          ),
                          marginBottom: 0.015,
                          value: controller.formData[formKeyPart3]
                              [formKeyDefectsIdentified5],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart3,
                                  formKeyDefectsIdentified5, value),
                        ),
                      ],
                    ),
                  ),
                  0.02.boxHeight,
                  CommonText(
                    'Warning Notice Issue',
                    fontWeight: FontWeight.w600,
                    fontColor: Color(AppColors.primary),
                    containerStyle: const CommonContainerModel(
                      marginBottom: 0.02,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CommonText(
                        '1',
                        fontWeight: FontWeight.bold,
                        topChild: FormToggleButton(
                          isBtnBox: true,
                          toggleType: FormToggleType.yesNoNA,
                          textWidget: const SizedBox(),
                          value: controller.formData[formKeyPart3]
                              [formKeyWarningNotice1],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyWarningNotice1, value),
                        ),
                      ),
                      CommonText(
                        '2',
                        fontWeight: FontWeight.bold,
                        topChild: FormToggleButton(
                          isBtnBox: true,
                          toggleType: FormToggleType.yesNoNA,
                          textWidget: const SizedBox(),
                          value: controller.formData[formKeyPart3]
                              [formKeyWarningNotice2],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyWarningNotice2, value),
                        ),
                      ),
                      CommonText(
                        '3',
                        fontWeight: FontWeight.bold,
                        topChild: FormToggleButton(
                          isBtnBox: true,
                          toggleType: FormToggleType.yesNoNA,
                          textWidget: const SizedBox(),
                          value: controller.formData[formKeyPart3]
                              [formKeyWarningNotice3],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyWarningNotice3, value),
                        ),
                      ),
                      CommonText(
                        '4',
                        fontWeight: FontWeight.bold,
                        topChild: FormToggleButton(
                          isBtnBox: true,
                          toggleType: FormToggleType.yesNoNA,
                          textWidget: const SizedBox(),
                          value: controller.formData[formKeyPart3]
                              [formKeyWarningNotice4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyWarningNotice4, value),
                        ),
                      ),
                      CommonText(
                        '5',
                        fontWeight: FontWeight.bold,
                        topChild: FormToggleButton(
                          isBtnBox: true,
                          toggleType: FormToggleType.yesNoNA,
                          textWidget: const SizedBox(),
                          value: controller.formData[formKeyPart3]
                              [formKeyWarningNotice5],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyWarningNotice5, value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
