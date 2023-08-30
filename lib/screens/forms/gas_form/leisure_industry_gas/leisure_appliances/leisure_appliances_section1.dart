import '../../../../../general_exports.dart';

class LeisureApplianceSection1 extends StatelessWidget {
  const LeisureApplianceSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeisureAppliancesController>(
      init: LeisureAppliancesController(),
      builder: (LeisureAppliancesController controller) {
        final LeisureListsForm list = LeisureListsForm();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SmallInputField(
              title: 'Appliance number',
              value: controller.applianceDetailsData[formKeyApplianceNumber],
              // onTap: () => Get.bottomSheet(
              //   LeisureSelectBT(
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
                LeisureSelectBT(
                  listTitles: list.listApplianceDesignation,
                  keyOfValue: formKeyApplianceDesignation,
                  controller: controller,
                ),
                isScrollControlled: true,
              ),
            ),
            CustomSelectContainer(
              title: 'Type',
              marginBottom: 0,
              value: controller.applianceDetailsData[formKeyApplianceType],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listType,
                  keyOfValue: formKeyApplianceType,
                  controller: controller,
                ),
                isScrollControlled: true,
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
                LeisureSelectBT(
                  listTitles: list.listMake,
                  keyOfValue: formKeyApplianceMake,
                  controller: controller,
                ),
                isScrollControlled: true,
              ),
            ),
            SmallInputField(
              title: 'Owned by Leisure / homeowner',
              hint: '',
              isInputSelection: true,
              value: controller.applianceDetailsData[formKeyApplianceOwnedBy],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceOwnedBy,
                  controller: controller,
                ),
                isScrollControlled: true,
              ),
            ),
            SmallInputField(
              title: 'Inspected yes / no?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[formKeyApplianceInspected],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceInspected,
                  controller: controller,
                ),
                isScrollControlled: true,
              ),
            ),
            SmallInputField(
              title: 'Flue Type',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[formKeyApplianceFlueType],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listFlueType,
                  keyOfValue: formKeyApplianceFlueType,
                  controller: controller,
                ),
                isScrollControlled: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
