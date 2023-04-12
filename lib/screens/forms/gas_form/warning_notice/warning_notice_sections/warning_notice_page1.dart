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
                    title: 'IMMEDIATELY DANGEROUS ACTION TAKEN',
                    color: Colors.grey[800],
                  ),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        FormToggleButton(
                          title:
                              'A. With your permission it has been disconnected from the GAS SUPPLY and a WARNING LABEL attached or',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                        ),
                        FormToggleButton(
                          title:
                              'B. As you have refused to allow it to be made a safe a WARNING LABEL has been attached',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                        ),
                        CommonText(
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
                    title: 'AT RISK (AR) because',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        CommonInput(
                          hint: 'At risk because',
                          marginBottom: 0.015,
                          maxLines: 2,
                        ),
                        FormToggleButton(
                          title: 'Warning label attached?',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          titleSize: fontTitle,
                        ),
                        CommonText(
                          'OR IN THE EVENT OF A',
                          rowMainAxisSize: MainAxisSize.max,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  0.01.ph,
                  ApplianceSectionTitle(
                    title: 'GAS ESCAPE',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        FormToggleButton(
                          title: 'Gas escape',
                          toggleType: FormToggleType.yesNo,
                          textWidth: 0.6,
                          titleSize: fontTitle,
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
