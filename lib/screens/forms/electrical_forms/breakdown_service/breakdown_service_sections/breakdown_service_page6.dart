import '../../../../../general_exports.dart';

class BreakdownServicePage7 extends StatelessWidget {
  const BreakdownServicePage7({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceController>(
      init: BreakdownServiceController(),
      builder: (BreakdownServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CommonText(
                'Service Checks',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
            ),
            const CheckBoxComponent(text: 'Heat Exchanger'),
            const CheckBoxComponent(text: 'Ignition'),
            const CheckBoxComponent(
              text: 'Gas Valve',
            ),
            const CheckBoxComponent(
              text: 'Fan',
            ),
            const CheckBoxComponent(
              text: 'Safety Device',
            ),
            const CheckBoxComponent(
              text: 'Control Box',
            ),
            const CheckBoxComponent(
              text: 'Burners & Pilot',
            ),
            const CheckBoxComponent(
              text: 'Fuel Pressure & Type',
            ),
          ],
        );
      },
    );
  }
}
