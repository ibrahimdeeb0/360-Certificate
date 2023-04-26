import '../../../../../general_exports.dart';

class DomesticEicPage7 extends StatelessWidget {
  const DomesticEicPage7({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 10. ',
                    text: 'TEST INSTRUMENTS USED',
                    marginBottom: 0.02,
                  ),
                  const CommonText(
                    'Instrument Serial No(s)',
                    fontWeight: FontWeight.bold,
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    topLabelText: 'MFT',
                    hint: 'N/A',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyPart10][formKeyMFT],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart10, formKeyMFT, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    topLabelText: 'Earth fault loop impedance',
                    hint: 'N/A',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyPart10]
                        [formKeyEarthFaultLoop],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart10, formKeyEarthFaultLoop, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    topLabelText: 'Insulation resistance',
                    hint: 'N/A',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyPart10]
                        [formKeyInsulationResistance],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart10, formKeyInsulationResistance, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    topLabelText: 'Continuity',
                    hint: 'N/A',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyPart10]
                        [formKeyContinuity],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart10, formKeyContinuity, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    topLabelText: 'RCD',
                    hint: 'N/A',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyPart10][formKeyRCD],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart10, formKeyRCD, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonInput(
                    topLabelText: 'Other',
                    hint: 'N/A',
                    marginBottom: 0.015,
                    value: controller.formData[formKeyPart10][formKeyOther],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart10, formKeyOther, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
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
