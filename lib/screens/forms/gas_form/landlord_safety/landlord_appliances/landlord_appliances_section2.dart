import '../../../../../general_exports.dart';

class LandLordApplianceSection2 extends StatelessWidget {
  const LandLordApplianceSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SmallInputField(
              title:
                  'Operating pressure in embar and/or heat input kW/h or Btu/h',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Operating of safety devices(s) Pass/Fail/NA',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Ventilation satisfactory Yes/No?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Visual condition of flue and termination',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Flue operation checks',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Combustion analyses reading (if applicable)',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Serviced Yes/No?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
          ],
        );
      },
    );
  }
}
