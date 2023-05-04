import '../../../../../general_exports.dart';

class LandLordApplianceSection3 extends StatelessWidget {
  const LandLordApplianceSection3({super.key});

  @override
  Widget build(BuildContext context) {
    final LandLordListsForm list = LandLordListsForm();
    return GetBuilder<LandlordAppliancesController>(
      init: LandlordAppliancesController(),
      builder: (LandlordAppliancesController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SmallInputField(
              title: 'Approved Co Alarm Fitted?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value:
                  controller.applianceDetailsData[formKeyApplianceApprovedCo],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceApprovedCo,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Is CO alarm In Date',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[formKeyApplianceIsCoAlarm],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceIsCoAlarm,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'CO alarm test satisfactory?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value:
                  controller.applianceDetailsData[formKeyApplianceCOAlarmTest],
              onTap: () => Get.bottomSheet(
                LandlordSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceCOAlarmTest,
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
