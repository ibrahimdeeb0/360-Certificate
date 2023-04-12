import '../../../../../general_exports.dart';

class WarningNoticePage2 extends StatelessWidget {
  const WarningNoticePage2({super.key});

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
                children: <Widget>[
                  ApplianceSectionTitle(
                    title:
                        "AT RISK' \"IMMEDIATELY DANGEROUS\" & GAS APPLIANCES/INSTALLATIONS SHOULD NOT BE USED",
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        CommonInput(
                          topLabelText: 'Make/Model',
                          marginBottom: 0.015,
                        ),
                        CommonInput(
                          topLabelText: 'Type',
                          marginBottom: 0.015,
                        ),
                        CommonInput(
                          topLabelText: 'Serial Number',
                          marginBottom: 0.015,
                        ),
                        CommonInput(
                          topLabelText: 'Location',
                          marginBottom: 0.015,
                        ),
                        CommonInput(
                          topLabelText: 'Reason',
                          marginBottom: 0.03,
                        ),
                        FormToggleButton(
                          title: 'Is not to current standards',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          titleSize: fontTitle,
                        ),
                      ],
                    ),
                  ),
                  ApplianceSectionTitle(
                    title: 'CUSTOMERS ACKNOWLEDGEMENT',
                    color: Colors.grey[800],
                  ),
                  const FormToggleButton(
                    title:
                        'The gas user was not present at the time of visit, and where appropriate, (an IMMEDIATELY DANGEROUS (ID) or AT RISK (AR) situation) at the installation has been made safe and this notice left on the premises',
                    toggleType: FormToggleType.yesNo,
                    textWidth: 0.6,
                    paddingHorizontal: 0.04,
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
