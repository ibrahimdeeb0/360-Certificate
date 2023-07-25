import '../../../../../general_exports.dart';

class MinorWorksPage3 extends StatelessWidget {
  const MinorWorksPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 3: Test Results For The Circuit Altered or Extended',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Continuity',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              textAlign: TextAlign.start,
              marginTop: 0.01,
            ),
            CommonInput(
              topLabel: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CommonText(
                    'Protective conductor ',
                  ),
                  Row(
                    children: <Widget>[
                      CommonText(
                        '(R1 + R2)',
                        leftChild: IconButton(
                          onPressed: () =>
                              controller.selectedProtective(pressIsR1: true),
                          isSelected: controller.r1,
                          icon: Icon(
                            controller.r1
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: Color(AppColors.primary),
                          ),
                        ),
                      ),
                      CommonText(
                        '(R2)',
                        leftChild: IconButton(
                          onPressed: () => controller.selectedProtective(),
                          isSelected: controller.r2,
                          icon: Icon(
                            controller.r2
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            color: Color(AppColors.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              suffix: CommonText(
                'Ω',
                fontColor: Colors.grey[700],
              ),
              value: controller.formData[formKeyContinuityMinor],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyContinuityMinor, value),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Ring final circuit (loop values)',
                    fontColor: AppColors.primary,
                    fontSize: fontH2,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'L/L:',
                    marginBottom: 0.015,
                    suffix: CommonText(
                      'Ω',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyRingLL],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyRingLL, value),
                  ),
                  CommonInput(
                    topLabelText: 'N/N:',
                    marginBottom: 0.015,
                    suffix: CommonText(
                      'Ω',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyRingNN],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyRingNN, value),
                  ),
                  CommonInput(
                    topLabelText: 'cpc/cpc:',
                    marginBottom: 0.015,
                    suffix: CommonText(
                      'Ω',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyRingCPC],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyRingCPC, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                ],
              ),
            ),
            //
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Insulation Resistance',
                    fontColor: AppColors.primary,
                    fontSize: fontH2,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'L/L:',
                    marginBottom: 0.015,
                    suffix: CommonText(
                      'MΩ',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyInsulationLL],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyInsulationLL, value),
                  ),
                  CommonInput(
                    topLabelText: 'L/E:',
                    marginBottom: 0.015,
                    suffix: CommonText(
                      'MΩ',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyInsulationLE],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyInsulationLE, value),
                  ),
                  CommonInput(
                    topLabelText: 'Test voltage:',
                    marginBottom: 0.015,
                    suffix: CommonText(
                      'V',
                      fontColor: Colors.grey[700],
                    ),
                    value: controller.formData[formKeyTestVoltage],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyTestVoltage, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Polarity',
                    fontColor: AppColors.primary,
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                    marginTop: 0.02,
                  ),
                  // const FormToggleButton(
                  //   title: 'Satisfactory:',
                  //   titleSize: fontTitle,formKeyPolaritySatisfactory
                  //   marginBottom: 0.0,
                  // ),
                  CommonInput(
                    topLabelText: 'Earth fault loop impedance Zs',
                    marginBottom: 0.015,
                    value:
                        controller.formData[formKeyEarthFaultLoopImpedanceZs],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyEarthFaultLoopImpedanceZs, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                ],
              ),
            ),

            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Circuit protective devices functionality checks',
                    fontColor: AppColors.primary,
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                    marginBottom: 0.02,
                    marginTop: 0.02,
                  ),
                  FormToggleButton(
                    title: 'RCD test button operation satisfactory:',
                    titleSize: fontTitle,
                    value: controller.formData[formKeyRCDTest],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyRCDTest, value),
                  ),
                  CommonInput(
                    topLabelText: 'RCD disconnection time at I∆n:',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyRCDDisconnectionTime],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyRCDDisconnectionTime, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  0.02.boxHeight,
                  FormToggleButton(
                      title:
                          'AFDD test button operation satisfactory (where provided):',
                      titleSize: fontTitle,
                      value: controller.formData[formKeyAFDDTest],
                      onChangeValue: (dynamic value) => controller
                          .onChangeFormDataValue(formKeyAFDDTest, value)),
                  FormToggleButton(
                      title:
                          'SPD functionality confirmed (where indicator is provided):',
                      titleSize: fontTitle,
                      value: controller.formData[formKeySPDFunctionality],
                      onChangeValue: (dynamic value) =>
                          controller.onChangeFormDataValue(
                              formKeySPDFunctionality, value)),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Test Instrument (insert serial numbers)',
                    fontColor: AppColors.primary,
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                    marginBottom: 0.02,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'Multifunction:',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyMultifunction],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyMultifunction, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Other(s) (state):',
                    fontColor: AppColors.primary,
                    fontSize: fontH2,
                    textAlign: TextAlign.start,
                    marginBottom: 0.02,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    // topLabelText: '',
                    marginBottom: 0.02,
                    value: controller.formData[formKeyTestInstrumentOther],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyTestInstrumentOther, value),
                  ),
                  CommonInput(
                    // topLabelText: ':',
                    marginBottom: 0.02,
                    value: controller.formData[formKeyTestInstrumentOther],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyTestInstrumentOther, value),
                  ),
                  CommonInput(
                    // topLabelText: ':',
                    marginBottom: 0.02,
                    value: controller.formData[formKeyTestInstrumentOther],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyTestInstrumentOther, value),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 3,
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
