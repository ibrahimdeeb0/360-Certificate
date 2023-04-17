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
                children: const <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 10. ',
                    text: 'TEST INSTRUMENTS USED',
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'Instrument Serial No(s)',
                    fontWeight: FontWeight.bold,
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    topLabelText: 'MFT',
                    hint: 'N/A',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Earth fault loop impedance',
                    hint: 'N/A',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Insulation resistance',
                    hint: 'N/A',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Continuity',
                    hint: 'N/A',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'RCD',
                    hint: 'N/A',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Other',
                    hint: 'N/A',
                    marginBottom: 0.015,
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
