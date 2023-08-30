import '../../../../../general_exports.dart';

class LeisureApplianceSection3 extends StatelessWidget {
  const LeisureApplianceSection3({super.key});

  @override
  Widget build(BuildContext context) {
    final LeisureListsForm list = LeisureListsForm();
    return GetBuilder<LeisureAppliancesController>(
      init: LeisureAppliancesController(),
      builder: (LeisureAppliancesController controller) {
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
                LeisureSelectBT(
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
                LeisureSelectBT(
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
                LeisureSelectBT(
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
