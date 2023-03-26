import '../../../../../general_exports.dart';

class LandlordPage2 extends StatelessWidget {
  const LandlordPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
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
                  children: const <Widget>[
                    FormToggleButton(
                      title: 'Gas pipework visual inspection',
                      toggleType: FormToggleType.passFailed,
                      textWidth: 0.6,
                      // value: controller.gazSafetyData[formKeyDomesticB],
                      // onChangeValue: (dynamic value) =>
                      //     controller.onChangeFormDataValue(formKeyDomesticB, value),
                    ),
                    FormToggleButton(
                      title: 'Outcome of gas supply pipework visual inspection',
                      toggleType: FormToggleType.passFailed, textWidth: 0.6,
                      // value: controller.gazSafetyData[formKeyDomesticB],
                      // onChangeValue: (dynamic value) =>
                      //     controller.onChangeFormDataValue(formKeyDomesticB, value),
                    ),
                    FormToggleButton(
                      title:
                          'Is the Emergency Control Valve access satisfactory?',
                      toggleType: FormToggleType.passFailed, textWidth: 0.6,
                      // value: controller.gazSafetyData[formKeyDomesticB],
                      // onChangeValue: (dynamic value) =>
                      //     controller.onChangeFormDataValue(formKeyDomesticB, value),
                    ),
                    FormToggleButton(
                      title: 'Outcome of gas tightness test?',
                      toggleType: FormToggleType.passFailed, textWidth: 0.6,
                      // value: controller.gazSafetyData[formKeyDomesticB],
                      // onChangeValue: (dynamic value) =>
                      //     controller.onChangeFormDataValue(formKeyDomesticB, value),
                    ),
                    FormToggleButton(
                      title:
                          'Is protective equipotential bonding satisfactory?',
                      toggleType: FormToggleType.passFailed, textWidth: 0.6,
                      // value: controller.gazSafetyData[formKeyDomesticB],
                      // onChangeValue: (dynamic value) =>
                      //     controller.onChangeFormDataValue(formKeyDomesticB, value),
                    ),
                  ],
                ),
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
                text: 'Any Defects Identified'.capitalize,
                marginBottom: 0.02,
              ),
              CommonText(
                'Defects Identified',
                rowMainAxisSize: MainAxisSize.max,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                fontWeight: FontWeight.w600,
                fontColor: Colors.grey[700],
                rightChild: CommonText(
                  'Warning Notice Issue',
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.grey[700],
                ),
                containerStyle: const CommonContainerModel(
                  marginBottom: 0.02,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.01.flexWidth, top: 0.015.flexHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CommonText(
                          '1',
                          fontColor: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: fontH2,
                          marginRight: 0.01,
                          marginBottom: 0.04,
                        ),
                        const CommonInput(
                          width: 0.6,
                          maxLines: 2,
                        ),
                        const FormToggleButton(
                          textWidth: 0.0,
                          title: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
