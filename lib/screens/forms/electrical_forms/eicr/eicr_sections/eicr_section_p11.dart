import '../../../../../general_exports.dart';

class EICRSectionJ extends StatelessWidget {
  const EICRSectionJ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EicrController>(
      builder: (EicrController controller) {
        return CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: 'Part 11. ', //J
                text: 'Test Instruments used',
                marginBottom: 0.01,
              ),
              CommonInput(
                topLabelText: 'Earth fault loop impedance',
                hint: 'Answer',
                value: controller.gazSafetyData[formKeyEarthFaultJ],
                onChanged: (dynamic value) =>
                    controller.onChangeFormDataValue(formKeyEarthFaultJ, value),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              CommonInput(
                topLabelText: 'Insulation resistance',
                hint: controller.gazSafetyData[formKeyEarthFaultJ] == ''
                    ? 'Answer'
                    : controller.gazSafetyData[formKeyEarthFaultJ],
                value: controller.gazSafetyData[formKeyInsulationResistanceJ],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyInsulationResistanceJ, value),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              CommonInput(
                topLabelText: 'Continuity',
                hint: controller.gazSafetyData[formKeyEarthFaultJ] == ''
                    ? 'Answer'
                    : controller.gazSafetyData[formKeyEarthFaultJ],
                value: controller.gazSafetyData[formKeyContinuityJ],
                onChanged: (dynamic value) =>
                    controller.onChangeFormDataValue(formKeyContinuityJ, value),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              CommonInput(
                topLabelText: 'RCD',
                hint: controller.gazSafetyData[formKeyEarthFaultJ] == ''
                    ? 'Answer'
                    : controller.gazSafetyData[formKeyEarthFaultJ],
                keyboardType: TextInputType.number,
                value: controller.gazSafetyData[formKeyRcdJ],
                onChanged: (dynamic value) =>
                    controller.onChangeFormDataValue(formKeyRcdJ, value),
                textInputAction: TextInputAction.next,
              ),
              CommonInput(
                topLabelText: 'MFT',
                hint: controller.gazSafetyData[formKeyEarthFaultJ] == ''
                    ? 'Answer'
                    : controller.gazSafetyData[formKeyEarthFaultJ],
                keyboardType: TextInputType.text,
                value: controller.gazSafetyData[formKeyMftJ],
                onChanged: (dynamic value) =>
                    controller.onChangeFormDataValue(formKeyMftJ, value),
                textInputAction: TextInputAction.next,
              ),
              CommonInput(
                topLabelText: 'Other',
                hint: controller.gazSafetyData[formKeyEarthFaultJ] == ''
                    ? 'Answer'
                    : controller.gazSafetyData[formKeyEarthFaultJ],
                keyboardType: TextInputType.number,
                value: controller.gazSafetyData[formKeyOtherJ],
                onChanged: (dynamic value) =>
                    controller.onChangeFormDataValue(formKeyOtherJ, value),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.01,
              ),
            ],
          ),
        );
      },
    );
  }
}
