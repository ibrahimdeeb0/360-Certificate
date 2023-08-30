import '../../../../../general_exports.dart';

class LeisureApplianceSection2 extends StatelessWidget {
  const LeisureApplianceSection2({super.key});

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
              title:
                  'Operating pressure in embar and/or heat input kW/h or Btu/h',
              hint: '',
              marginBottom: 0.02,
              value: controller
                  .applianceDetailsData[formKeyApplianceOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeApplianceValues(
                  formKeyApplianceOperatingPressure, value),
            ),
            SmallInputField(
              title: 'Operating of safety devices(s) Pass/Fail/NA',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller
                  .applianceDetailsData[formKeyApplianceOperatingOfSafety],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listPassFail,
                  keyOfValue: formKeyApplianceOperatingOfSafety,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Ventilation satisfactory Yes/No?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[
                  formKeyApplianceVentilationSatisfactory],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceVentilationSatisfactory,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Visual condition of flue and termination',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller
                  .applianceDetailsData[formKeyApplianceVisualCondition],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listPassFail,
                  keyOfValue: formKeyApplianceVisualCondition,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Flue operation checks',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller
                  .applianceDetailsData[formKeyApplianceFlueOperation],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listPassFail,
                  keyOfValue: formKeyApplianceFlueOperation,
                  controller: controller,
                ),
              ),
            ),
            SmallInputField(
              title: 'Combustion analyses reading (if applicable)',
              hint: '',
              marginBottom: 0.02,
              value: controller
                  .applianceDetailsData[formKeyApplianceCombustionAnalyses],
              onChanged: (dynamic value) => controller.onChangeApplianceValues(
                  formKeyApplianceCombustionAnalyses, value),
            ),
            SmallInputField(
              title: 'Serviced Yes/No?',
              hint: '',
              isInputSelection: true,
              marginBottom: 0.02,
              value: controller.applianceDetailsData[formKeyApplianceServiced],
              onTap: () => Get.bottomSheet(
                LeisureSelectBT(
                  listTitles: list.listYesNo,
                  keyOfValue: formKeyApplianceServiced,
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
