import '../../../../../general_exports.dart';

class LandLordApplianceSection1 extends StatelessWidget {
  const LandLordApplianceSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            SmallInputField(
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
            CustomSelectContainer(
              title: 'Appliance designation',
              marginBottom: 0,
              marginTop: 0,
            ),
            CustomSelectContainer(
              title: 'Type',
              marginBottom: 0,
            ),
            CustomSelectContainer(
              title: 'Model',
              marginBottom: 0,
            ),
            CustomSelectContainer(
              title: 'Make',
            ),
            SmallInputField(
              title: 'Owned by landlord / homeowner',
              // value: controller.childCircuitData[formKeyTypeOfWiringA],
              hint: '',
              isInputSelection: true,
            ),
            SmallInputField(
              title: 'Inspected yes / no?',
              // value: controller.childCircuitData[formKeyTypeOfWiringA],
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
            ),
            SmallInputField(
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
