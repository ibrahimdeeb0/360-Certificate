import '../../../../../general_exports.dart';

class MaintenanceServicePage1 extends StatelessWidget {
  const MaintenanceServicePage1({super.key});

  @override
  Widget build(BuildContext context) {
    final ListMaintenanceService list = ListMaintenanceService();
    return GetBuilder<MaintenanceServiceController>(
      init: MaintenanceServiceController(),
      builder: (MaintenanceServiceController controller) {
        return Column(
          children: <Widget>[
            CommonText(
              'Type of Work',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            FormToggleButton(
              title: 'Service',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1]
                  [formKeyServiceMaintenance],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyServiceMaintenance,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Maintenance',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyMaintenance],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyMaintenance, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Appliance  Details',
              textAlign: TextAlign.center,
              marginTop: 0.01,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            FormToggleButton(
              title: 'Gas tightness test carried out?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyGasCarriedOut],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart1,
                formKeyGasCarriedOut,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Gas tightness test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart1][formKeyGasTightnessTest],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart1, formKeyGasTightnessTest, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              topLabelText: 'Appliance Location',
              hint: 'Appliance Location',
              value: controller.formData[formKeyPart1]
                  [formKeyMaintenanceApplianceLocation],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyMaintenanceApplianceLocation, value),
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                MaintenanceServiceSelectSheet(
                  keyOfPart: formKeyPart1,
                  keyOfValue: formKeyMaintenanceApplianceType,
                  listTitles: list.listBoilerMake,
                  controller: controller,
                  keyOfMaintenanceServiceType: formKeyMaintenanceApplianceType,
                ),
                isScrollControlled: true,
              ),
              child: CommonInput(
                topLabelText: 'Appliance Type',
                hint: 'Appliance Type',
                enabled: false,
                suffix: const Icon(Icons.keyboard_arrow_down),
                value: controller.formData[formKeyPart1]
                    [formKeyMaintenanceApplianceType],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart1, formKeyMaintenanceApplianceType, value),
              ),
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                MaintenanceServiceSelectSheet(
                  keyOfPart: formKeyPart1,
                  keyOfValue: formKeyMaintenanceApplianceMake,
                  listTitles: list.listBoilerMake,
                  controller: controller,
                  keyOfMaintenanceServiceType: formKeyMaintenanceApplianceMake,
                ),
                isScrollControlled: true,
              ),
              child: CommonInput(
                topLabelText: 'Appliance Make',
                hint: 'Appliance Make',
                enabled: false,
                suffix: const Icon(Icons.keyboard_arrow_down),
                value: controller.formData[formKeyPart1]
                    [formKeyMaintenanceApplianceMake],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart1, formKeyMaintenanceApplianceMake, value),
              ),
            ),
            CommonInput(
              topLabelText: 'Appliance Model',
              hint: 'Appliance Model',
              marginBottom: 0.05,
              value: controller.formData[formKeyPart1]
                  [formKeyMaintenanceApplianceModel],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart1, formKeyMaintenanceApplianceModel, value),
            ),
          ],
        );
      },
    );
  }
}
