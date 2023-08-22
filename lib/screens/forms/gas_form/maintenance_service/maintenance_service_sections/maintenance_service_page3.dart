import '../../../../../general_exports.dart';

class MaintenanceServicePage3 extends StatelessWidget {
  const MaintenanceServicePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaintenanceServiceController>(
      init: MaintenanceServiceController(),
      builder: (MaintenanceServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormToggleButton(
              title: 'Ventilation',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart3]
                  [formKeyMaintenanceVentilation],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart3,
                formKeyMaintenanceVentilation,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart3]
                  [formKeyMaintenanceVentilationInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyMaintenanceVentilationInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Flu termination',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart3][formKeyFluTermination],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart3,
                formKeyFluTermination,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart3]
                  [formKeyFluTerminationInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyFluTerminationInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Flu flow test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart3][formKeyFluFlowTest],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart3,
                formKeyFluFlowTest,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart3][formKeyFluFlowTestInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyFluFlowTestInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Spillage Test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart3][formKeySpillageTest],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart3,
                formKeySpillageTest,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart3]
                  [formKeySpillageTestInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeySpillageTestInput, value),
              minLines: 3,
              maxLines: 200,
              marginBottom: 0.02,
            ),
            SmallInputField(
              title: 'Operating Pressure(mbar) or Heat Input (k...',
              value: controller.formData[formKeyPart3]
                  [formKeyOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOperatingPressure, value),
            ),
            FormToggleButton(
              title: 'Safety devices',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart3][formKeySafetyDevices],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart3,
                formKeySafetyDevices,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart3]
                  [formKeySafetyDevicesInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeySafetyDevicesInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Other',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart3][formKeyMaintenanceOther],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart3,
                formKeyMaintenanceOther,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart3][formKeyOtherInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOtherInput, value),
              minLines: 3,
              maxLines: 200,
            ),
          ],
        );
      },
    );
  }
}
