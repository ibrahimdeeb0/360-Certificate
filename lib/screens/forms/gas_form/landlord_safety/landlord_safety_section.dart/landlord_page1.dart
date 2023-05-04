import '../../../../../general_exports.dart';

class LandlordPage2 extends StatelessWidget {
  const LandlordPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    leftText: 'Part 1. ',
                    text: 'Details of work carried out'.capitalize,
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    hint: '',
                    maxLines: 4,
                    marginBottom: 0.012,
                    value: controller.formData[formKeyPart1]
                        [formKeyDetailsOfWorkP1],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart1, formKeyDetailsOfWorkP1, value),
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
                    leftText: 'Part 2. ',
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
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyPipeworkVisualP2],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart2, formKeyPipeworkVisualP2, value),
                        ),
                        FormToggleButton(
                          title:
                              'Outcome of gas supply pipework visual inspection',
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
                              controller.onChangeFormDataValue(formKeyPart2,
                                  formKeyPipeworkEmergencyP2, value),
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
                          title:
                              'Is protective equipotential bonding satisfactory?',
                          toggleType: FormToggleType.passFailedNA,
                          textWidth: 0.6,
                          value: controller.formData[formKeyPart2]
                              [formKeyPipeworkProtectiveP2],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart2,
                                  formKeyPipeworkProtectiveP2, value),
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
