import '../../../../../general_exports.dart';

class LandlordPage1 extends StatelessWidget {
  const LandlordPage1({
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
                    text: 'Details of Landlord/Homeowner'.capitalize,
                  ),
                  const CommonText(
                    'or agent where appropriate',
                    fontSize: fontH3,
                    marginLeft: 0.12,
                  ),
                  //
                  CommonInput(
                    topLabelText: 'Name',
                    hint: 'Type Name',
                    value: controller.formData[formKeyPart1][formKeyNameP1],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart1, formKeyNameP1, value),
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabelText: 'Address 1',
                    hint: 'Type Address 1',
                    value: controller.formData[formKeyPart1][formKeyAddress1P1],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart1, formKeyAddress1P1, value),
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabelText: 'Address 2',
                    hint: 'Type Address 2',
                    value: controller.formData[formKeyPart1][formKeyAddress2P1],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart1, formKeyAddress2P1, value),
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabelText: 'Postcode',
                    hint: 'Type Address 1',
                    value: controller.formData[formKeyPart1][formKeyPostcodeP1],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart1, formKeyPostcodeP1, value),
                    marginBottom: 0.012,
                  ),
                ],
              ),
            ),
            //
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 2. ',
                    text: 'Details of the installation'.capitalize,
                  ),
                  CommonInput(
                    topLabelText: 'Address 1',
                    hint: 'Type Address 1',
                    value: controller.formData[formKeyPart2][formKeyAddress1P2],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyAddress1P2, value),
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabelText: 'Address 2',
                    hint: 'Type Address 2',
                    value: controller.formData[formKeyPart2][formKeyAddress2P2],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyAddress2P2, value),
                    marginBottom: 0.012,
                  ),
                  CommonInput(
                    topLabelText: 'Postcode',
                    hint: 'Type Address 1',
                    value: controller.formData[formKeyPart2][formKeyPostcodeP2],
                    onChanged: (dynamic value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyPostcodeP1, value),
                    marginBottom: 0.012,
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
