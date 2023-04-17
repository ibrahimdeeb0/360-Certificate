import '../../../../../general_exports.dart';

class DomesticEicPage8 extends StatelessWidget {
  const DomesticEicPage8({super.key});

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
                    leftText: 'Part 11. ',
                    text: 'SCHEDULE OF INSPECTIONS',
                    marginBottom: 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const CommonText(
                        'AN ENTRY MUST BE MADE IN EVERY BOX',
                        textAlign: TextAlign.start,
                        fontSize: fontH3,
                        containerStyle: CommonContainerModel(width: 0.5),
                        bottomChild: SizedBox(),
                      ),
                      CommonButton(
                        onPress: () {},
                        width: 0.26,
                        height: 0.04,
                        text: 'Select All',
                      ),
                    ],
                  ),
                  0.02.ph,
                  const CommonText(
                    'OBSERVATION',
                    fontSize: fontH3,
                    fontWeight: FontWeight.bold,
                    rowMainAxisSize: MainAxisSize.max,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rightChild: CommonText(
                      'OUTCOME',
                      fontSize: fontH3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  0.02.ph,
                  const FormToggleButton(
                    title:
                        "1.0 Condition of consumer's intake equipment (Visual inspection only)",
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title:
                        '2.0 Parallel or switched alternative sources of supply',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title:
                        '3.0 Protective measure: Automatic Disconnection of Supply (ADS)',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '4.0 Basic protection',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '5.0 Protective measures other than ADS',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '6.0 Additional protection',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '7.0 Distribution equipment',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '8.0 Circuits (Distribution and Final)',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '9.0 Isolation and switching',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title:
                        '10.0 Current-using equipment (permanently connected)',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '11.0 Identification and notices',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '12.0 Location(s) containing a bath or shower',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title: '13.0 Other special installations or locations',
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
                  ),
                  const FormToggleButton(
                    title:
                        "14.0 Prosumer's low voltage electrical installation(s)",
                    toggleType: FormToggleType.yesNo,
                    marginBottom: 0.03,
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
