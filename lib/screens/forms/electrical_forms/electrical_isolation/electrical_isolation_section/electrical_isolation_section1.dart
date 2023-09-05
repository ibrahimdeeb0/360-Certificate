import '../../../../../general_exports.dart';

class ElectricalIsolationPage1 extends StatelessWidget {
  const ElectricalIsolationPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectricalIsolationController>(
      init: ElectricalIsolationController(),
      builder: (ElectricalIsolationController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CommonText(
                'EQIUPMENT DETAILS',
                fontSize: fontH2,
                fontColor: Color(AppColors.primary),
              ),
            ),
            const CommonInput(
              topLabelText: 'Location',
              marginTop: 0.01,
            ),
            const CommonInput(
              topLabelText: 'Equipment/Circuit to be isolated',
            ),
            const CommonInput(
              topLabelText: 'SAFETY LOCKS have been fitted at',
            ),
            const CommonInput(
              topLabelText: 'CAUTION NOTICES posted at:',
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            Center(
              child: CommonText(
                'DETAILS OF ISOLATION',
                marginTop: 0.01,
                marginBottom: 0.03,
                fontSize: fontH2,
                fontColor: Color(AppColors.primary),
              ),
            ),
            const FormToggleButton(
              title: 'Fuses removed',
              titleSize: fontH2,
            ),
            const FormToggleButton(
              title: 'Isolated in OFF position',
              titleSize: fontH2,
            ),
            const FormToggleButton(
              title: 'MCB in OFF position',
              titleSize: fontH2,
            ),
            const FormToggleButton(
              title: 'Safety Locks fitted',
              titleSize: fontH2,
            ),
            const FormToggleButton(
              title: 'Tags fitted',
              titleSize: fontH2,
            ),
            const SmallInputField(
              title: 'Time of isolation',
            ),
          ],
        );
      },
    );
  }
}
