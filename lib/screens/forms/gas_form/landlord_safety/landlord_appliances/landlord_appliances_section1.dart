import '../../../../../general_exports.dart';

class LandLordApplianceSection1 extends StatelessWidget {
  const LandLordApplianceSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        return Column(
          children: <Widget>[
            CustomTextFormTitle(
              leftText: '',
              text: 'Appliance Details'.toUpperCase(),
              marginBottom: 0.03,
            ),
            const SmallInputField(
              title: 'Appliance number',
              // value: controller.childCircuitData[formKeyTypeOfWiringA],
              hint: '',
              // onTap: () => Get.bottomSheet(
              //   DBSelectBT(
              //     listTitles: controller.listTypeOfWiring,
              //     keyOfValue: formKeyTypeOfWiringA,
              //     controller: controller,
              //     isChilde: true,
              //   ),
              // ),
              isInputSelection: true,
              marginBottom: 0.0,
            ),
            const CustomSelectContainer(
              title: 'Appliance designation',
              marginBottom: 0,
              marginTop: 0,
            ),
            const CustomSelectContainer(
              title: 'Type',
              marginBottom: 0,
            ),
            const CustomSelectContainer(
              title: 'Model',
              marginBottom: 0,
            ),
            const CustomSelectContainer(
              title: 'Make',
            ),
            const SmallInputField(
              title: 'Owned by landlord / homeowner',
              // value: controller.childCircuitData[formKeyTypeOfWiringA],
              hint: '',
              isInputSelection: true,
            ),
            const SmallInputField(
              title: 'Inspected yes / no?',
              // value: controller.childCircuitData[formKeyTypeOfWiringA],
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            const SmallInputField(
              title: 'Flue Type',
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
