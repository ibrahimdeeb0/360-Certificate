import '../../../../../general_exports.dart';

class LandLordApplianceSection1 extends StatelessWidget {
  const LandLordApplianceSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        final LandLordListsForm list = LandLordListsForm();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SmallInputField(
              title: 'Appliance number',
              value: controller.applianceDetailsData[formKeyApplianceNumber],
              // onTap: () => Get.bottomSheet(
              //   LandlordSelectBT(
              //     listTitles: list.listNumbers,
              //     keyOfValue: formKeyApplianceNumber,
              //     controller: controller,
              //   ),
              // ),
              isInputSelection: true,
              suffix: const SizedBox(),
              marginBottom: 0.0,
            ),
            CustomSelectContainer(
              title: 'Appliance designation',
              marginBottom: 0,
              marginTop: 0,
              value:
                  controller.applianceDetailsData[formKeyApplianceDesignation],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listApplianceDesignation,
                  keyOfValue: formKeyApplianceDesignation,
                  controller: controller,
                ),
              ),
            ),
            CustomSelectContainer(
              title: 'Type',
              marginBottom: 0,
              value: controller.applianceDetailsData[formKeyApplianceType],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listType,
                  keyOfValue: formKeyApplianceType,
                  controller: controller,
                ),
              ),
            ),
            CommonInput(
              topLabelText: 'Model',
              marginBottom: 0,
              value: controller.applianceDetailsData[formKeyApplianceModel],
              onChanged: (dynamic value) => controller.onChangeApplianceValues(
                  formKeyApplianceModel, value),
            ),
            CustomSelectContainer(
              title: 'Make',
              value: controller.applianceDetailsData[formKeyApplianceMake],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listMake,
                  keyOfValue: formKeyApplianceMake,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Owned by landlord / homeowner',
              hint: '',
              isInputSelection: true,
              value: controller.applianceDetailsData[formKeyApplianceOwnedBy],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceOwnedBy,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Inspected yes / no?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[formKeyApplianceInspected],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceInspected,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Flue Type',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[formKeyApplianceFlueType],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listFlueType,
                  keyOfValue: formKeyApplianceFlueType,
                  controller: controller,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
