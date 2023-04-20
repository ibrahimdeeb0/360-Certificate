import '../../../../../general_exports.dart';

class WarningNoticePage1 extends StatelessWidget {
  const WarningNoticePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarningNoticeController>(
      init: WarningNoticeController(),
      builder: (WarningNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingTop: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplianceSectionTitle(
                    title: 'PART 3: IMMEDIATELY DANGEROUS ACTION TAKEN',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormToggleButton(
                          title:
                              'A. With your permission it has been disconnected from the GAS SUPPLY and a WARNING LABEL attached or',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          axisAlignment: CrossAxisAlignment.start,
                          value: controller.formData[formKeyPart3]
                              [formKeyImmediatelyA],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyImmediatelyA, value),
                        ),
                        FormToggleButton(
                          title:
                              'B. As you have refused to allow it to be made a safe a WARNING LABEL has been attached',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          axisAlignment: CrossAxisAlignment.start,
                          value: controller.formData[formKeyPart3]
                              [formKeyImmediatelyB],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart3, formKeyImmediatelyB, value),
                        ),
                        const CommonText(
                          'Gas Safe Registered are required to report cases where they are refused permission to disconnect an IMMEDIATELY DANGEROUS gas installation to the Gas Emergency Service call Centre for natural gas or for LPG, the GAS Supplier. All Gas Transporters provide a gas emergency service and are empowered under the GAS Safety (Rights of Entry) Regulations to visit properties and disconnect unsafe gas...',
                          fontSize: fontH3,
                          rowMainAxisSize: MainAxisSize.max,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  0.03.ph,
                  ApplianceSectionTitle(
                    title: 'PART 4: AT RISK (AR) because',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          hint: 'At risk because',
                          marginBottom: 0.015,
                          maxLines: 2,
                          value: controller.formData[formKeyPart4]
                              [formKeyRiskBecause],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart4, formKeyRiskBecause, value),
                        ),
                        FormToggleButton(
                          title: 'Warning label attached?',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart4]
                              [formKeyWarningLabelAttached],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart4,
                                  formKeyWarningLabelAttached, value),
                        ),
                        const CommonText(
                          'OR IN THE EVENT OF A',
                          rowMainAxisSize: MainAxisSize.max,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  0.01.ph,
                  ApplianceSectionTitle(
                    title: 'PART 5: GAS ESCAPE',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FormToggleButton(
                          title: 'Gas escape',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          titleSize: fontTitle,
                          value: controller.formData[formKeyPart5]
                              [formKeyGasEscape],
                          onChangeValue: (dynamic value) =>
                              controller.onChangeFormDataValue(
                                  formKeyPart5, formKeyGasEscape, value),
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
