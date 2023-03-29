import '../../../../../general_exports.dart';

class LandLordApplianceSection3 extends StatelessWidget {
  const LandLordApplianceSection3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        return Column(
          children: <Widget>[
            CustomTextFormTitle(
              leftText: '',
              text: 'Audible co alarm'.toUpperCase(),
              marginBottom: 0.03,
            ),
            const SmallInputField(
              title: 'Approved Co Alarm Fitted?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            const SmallInputField(
              title: 'Is CO alarm In Date',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            const SmallInputField(
              title: 'CO alarm test satisfactory?',
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
