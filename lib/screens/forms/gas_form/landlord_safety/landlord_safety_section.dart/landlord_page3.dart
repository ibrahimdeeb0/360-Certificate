import '../../../../../general_exports.dart';

class LandlordPage3 extends StatelessWidget {
  const LandlordPage3({
    super.key,
    // this.controller,
  });

  // final LandlordSafetyController? controller;

  @override
  Widget build(BuildContext context) {
    // final LandlordSafetyController controller =
    //     Get.put(LandlordSafetyController());
    return GetBuilder<LandlordSafetyController>(
        init: LandlordSafetyController(),
        builder: (LandlordSafetyController controller) {
          return Column(
            children: <Widget>[
              CommonContainer(
                style: appContainerStyles.formSectionsStyle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextFormTitle(
                      leftText: 'Part 5. ',
                      text: 'Any Defects Identified'.capitalize,
                      marginBottom: 0.02,
                    ),
                    CommonText(
                      'Defects Identified',
                      rowMainAxisSize: MainAxisSize.max,
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      fontWeight: FontWeight.w600,
                      fontColor: Colors.grey[700],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 0.01.flexWidth, top: 0.015.flexHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CommonInput(
                            prefix: const PrefixTextNum(
                              num: '1',
                            ),
                            marginBottom: 0.015,
                            value: controller.formData[formKeyPart5]
                                [formKeyDefectsIdentified1],
                            onChanged: (dynamic value) =>
                                controller.onChangeFormDataValue(formKeyPart5,
                                    formKeyDefectsIdentified1, value),
                          ),
                          CommonInput(
                            prefix: const PrefixTextNum(
                              num: '2',
                            ),
                            marginBottom: 0.015,
                            value: controller.formData[formKeyPart5]
                                [formKeyDefectsIdentified2],
                            onChanged: (dynamic value) =>
                                controller.onChangeFormDataValue(formKeyPart5,
                                    formKeyDefectsIdentified2, value),
                          ),
                          CommonInput(
                            prefix: const PrefixTextNum(
                              num: '3',
                            ),
                            marginBottom: 0.015,
                            value: controller.formData[formKeyPart5]
                                [formKeyDefectsIdentified3],
                            onChanged: (dynamic value) =>
                                controller.onChangeFormDataValue(formKeyPart5,
                                    formKeyDefectsIdentified3, value),
                          ),
                          CommonInput(
                            prefix: const PrefixTextNum(
                              num: '4',
                            ),
                            marginBottom: 0.015,
                            value: controller.formData[formKeyPart5]
                                [formKeyDefectsIdentified4],
                            onChanged: (dynamic value) =>
                                controller.onChangeFormDataValue(formKeyPart5,
                                    formKeyDefectsIdentified4, value),
                          ),
                          CommonInput(
                            prefix: const PrefixTextNum(
                              num: '5',
                            ),
                            marginBottom: 0.015,
                            value: controller.formData[formKeyPart5]
                                [formKeyDefectsIdentified5],
                            onChanged: (dynamic value) =>
                                controller.onChangeFormDataValue(formKeyPart5,
                                    formKeyDefectsIdentified5, value),
                          ),
                        ],
                      ),
                    ),
                    0.02.ph,
                    CommonText(
                      'Warning Notice Issue',
                      fontWeight: FontWeight.w600,
                      fontColor: Colors.grey[700],
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
                            toggleType: FormToggleType.yesNo,
                            textWidget: const SizedBox(),
                            value: controller.formData[formKeyPart5]
                                [formKeyWarningNotice1],
                            onChangeValue: (dynamic value) =>
                                controller.onChangeFormDataValue(
                                    formKeyPart5, formKeyWarningNotice1, value),
                          ),
                        ),
                        CommonText(
                          '2',
                          fontWeight: FontWeight.bold,
                          topChild: FormToggleButton(
                            isBtnBox: true,
                            toggleType: FormToggleType.yesNo,
                            textWidget: const SizedBox(),
                            value: controller.formData[formKeyPart5]
                                [formKeyWarningNotice2],
                            onChangeValue: (dynamic value) =>
                                controller.onChangeFormDataValue(
                                    formKeyPart5, formKeyWarningNotice2, value),
                          ),
                        ),
                        CommonText(
                          '3',
                          fontWeight: FontWeight.bold,
                          topChild: FormToggleButton(
                            isBtnBox: true,
                            toggleType: FormToggleType.yesNo,
                            textWidget: const SizedBox(),
                            value: controller.formData[formKeyPart5]
                                [formKeyWarningNotice3],
                            onChangeValue: (dynamic value) =>
                                controller.onChangeFormDataValue(
                                    formKeyPart5, formKeyWarningNotice3, value),
                          ),
                        ),
                        CommonText(
                          '4',
                          fontWeight: FontWeight.bold,
                          topChild: FormToggleButton(
                            isBtnBox: true,
                            toggleType: FormToggleType.yesNo,
                            textWidget: const SizedBox(),
                            value: controller.formData[formKeyPart5]
                                [formKeyWarningNotice4],
                            onChangeValue: (dynamic value) =>
                                controller.onChangeFormDataValue(
                                    formKeyPart5, formKeyWarningNotice4, value),
                          ),
                        ),
                        CommonText(
                          '5',
                          fontWeight: FontWeight.bold,
                          topChild: FormToggleButton(
                            isBtnBox: true,
                            toggleType: FormToggleType.yesNo,
                            textWidget: const SizedBox(),
                            value: controller.formData[formKeyPart5]
                                [formKeyWarningNotice5],
                            onChangeValue: (dynamic value) =>
                                controller.onChangeFormDataValue(
                                    formKeyPart5, formKeyWarningNotice5, value),
                          ),
                        ),
                      ],
                    ),
                    0.01.ph,
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.formSectionsStyle,
                paddingBottom: 0.025,
                marginTop: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextFormTitle(
                      leftText: 'Part 6. ',
                      text: 'Record Remedial Action Taken Or Notes'.capitalize,
                      marginBottom: 0.02,
                    ),
                    const CommonText(
                      'Numbering should correspond to defects identified in report',
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                      fontSize: fontH3,
                      marginBottom: 0.015,
                    ),
                    CommonInput(
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      value: controller.formData[formKeyPart6]
                          [formKeyRecordRemedialAction],
                      onChanged: (dynamic value) =>
                          controller.onChangeFormDataValue(
                              formKeyPart6, formKeyRecordRemedialAction, value),
                    ),
                  ],
                ),
              ),
              CommonContainer(
                style: appContainerStyles.formSectionsStyle,
                marginTop: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextFormTitle(
                      leftText: 'Part 7. ',
                      text: 'ATTENTION'.capitalize,
                      marginBottom: 0.01,
                    ),
                    CommonInput(
                      topLabelText: 'Next Safety Check Due By',
                      onTap: () {
                        CommonDatePicker.showDatePicker(
                          context,
                          currentTime:
                              controller.selectedDate ?? DateTime.now(),
                          onConfirm: (DateTime value) {
                            // controller.formData[formKeyPart7]
                            //     [formKeyNextSafetyCheckBy] = '$value'.split(' ')[0];
                            // Get.find<LandlordSafetyController>()
                            //         .formData[formKeyPart7]
                            //     [formKeyNextSafetyCheckBy] = '$value'.split(' ')[0];
                            // Get.find<LandlordSafetyController>().update();
                            controller.onSelectDate(
                              formKeyPart7,
                              formKeyNextSafetyCheckBy,
                              value,
                            );
                          },
                        );
                      },
                      enabled: false,
                      hint: 'select',
                      // value: ,
                      marginBottom: 0.02,
                      suffix: const Icon(Icons.keyboard_arrow_down),
                      value: controller.formData[formKeyPart7]
                          [formKeyNextSafetyCheckBy],
                      // onChanged: (dynamic value) => controller.onChangeFormDataValue(
                      //     formKeyPart7, formKeyNextSafetyCheckBy, value),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
