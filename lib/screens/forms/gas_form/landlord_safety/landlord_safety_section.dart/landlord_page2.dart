import '../../../../../general_exports.dart';

class LandlordPage2 extends StatelessWidget {
  const LandlordPage2({
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
                    leftText: 'Part 3. ',
                    text: 'Details of work carried out'.capitalize,
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    hint: '',
                    maxLines: 4,
                    marginBottom: 0.012,
                    value: controller.formData[formKeyPart3]
                        [formKeyDetailsOfWorkP3],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart3, formKeyDetailsOfWorkP3, value),
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
                    leftText: 'Part 4. ',
                    text: 'Pipework inspection details'.capitalize,
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'Select as appropriate and relevant',
                    marginBottom: 0.02,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.grey[700],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.03.flexWidth),
                    child: Column(
                      children: <Widget>[
                        FormToggleButton(
                          title: 'Gas pipework visual inspection',
                          toggleType: FormToggleType.passFailed,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart4]
                              [formKeyPipeworkVisualP4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart4, formKeyPipeworkVisualP4, value),
                        ),
                        FormToggleButton(
                          title:
                              'Outcome of gas supply pipework visual inspection',
                          toggleType: FormToggleType.passFailed,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart4]
                              [formKeyPipeworkOutcomeSupplyP4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart4,
                                  formKeyPipeworkOutcomeSupplyP4, value),
                        ),
                        FormToggleButton(
                          title:
                              'Is the Emergency Control Valve access satisfactory?',
                          toggleType: FormToggleType.passFailed,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart4]
                              [formKeyPipeworkEmergencyP4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart4,
                                  formKeyPipeworkEmergencyP4, value),
                        ),
                        FormToggleButton(
                          title: 'Outcome of gas tightness test?',
                          toggleType: FormToggleType.passFailed,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart4]
                              [formKeyPipeworkOutcomeTightnessP4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart4,
                                  formKeyPipeworkOutcomeTightnessP4, value),
                        ),
                        FormToggleButton(
                          title:
                              'Is protective equipotential bonding satisfactory?',
                          toggleType: FormToggleType.passFailed,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart4]
                              [formKeyPipeworkProtectiveP4],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart4,
                                  formKeyPipeworkProtectiveP4, value),
                        ),
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

class PrefixTextNum extends StatelessWidget {
  const PrefixTextNum({
    super.key,
    this.num,
  });
  final String? num;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      num ?? '',
      fontColor: Colors.grey[500],
      fontWeight: FontWeight.bold,
      fontSize: fontH2,
    );
  }
}
