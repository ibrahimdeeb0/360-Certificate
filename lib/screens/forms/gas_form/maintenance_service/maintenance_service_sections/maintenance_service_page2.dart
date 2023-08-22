import '../../../../../general_exports.dart';

class MaintenanceServicePage2 extends StatelessWidget {
  const MaintenanceServicePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaintenanceServiceController>(
      init: MaintenanceServiceController(),
      builder: (MaintenanceServiceController controller) {
        return Column(
          children: <Widget>[
            FormToggleButton(
              title: 'Burner/injectors',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyBurnerInjectors],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyBurnerInjectors,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyBurnerInjectorsInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyBurnerInjectorsInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Heat exchanger',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyMaintenanceHeatExchanger],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyMaintenanceHeatExchanger,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyHeatExchangerInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyHeatExchangerInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Ignition',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyMaintenanceIgnition],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyMaintenanceIgnition,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeyIgnitionInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyIgnitionInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Electrics',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyElectrics],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyElectrics,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeyElectricsInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyElectricsInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Controls',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyControls],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyControls,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeyControlsInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyControlsInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Gas Water Leaks',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyGasWaterLeaks],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyGasWaterLeaks,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyGasWaterLeaksInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyGasWaterLeaksInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Gas Pipework',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyGasPipework],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyGasPipework,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeyGasPipeworkInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyGasPipeworkInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Fan(s)',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyMaintenanceFan],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyMaintenanceFan,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeyFanInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyFanInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Seals',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeySeals],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeySeals,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeySealsInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeySealsInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Fireplace opening/void',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyFireplaceOpening],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyFireplaceOpening,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyFireplaceOpeningInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyFireplaceOpeningInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Closure plate',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyClosurePlate],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyClosurePlate,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyClosurePlateInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyClosurePlateInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Flame picture',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyFlamePicture],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyFlamePicture,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyFlamePictureInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyFlamePictureInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Location',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyMaintenanceLocation],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyMaintenanceLocation,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyMaintenanceLocationInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyMaintenanceLocationInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Stability',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyStability],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyStability,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2][formKeyStabilityInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyStabilityInput, value),
              minLines: 3,
              maxLines: 200,
            ),
            FormToggleButton(
              title: 'Return air/plenum',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyReturnAirPlenum],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyReturnAirPlenum,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            CommonInput(
              hint: 'Remedial Action/Nature of  Defect',
              // topLabelText: 'Remedial Action/Nature of  Defect',
              value: controller.formData[formKeyPart2]
                  [formKeyReturnAirPlenumInput],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyReturnAirPlenumInput, value),
              minLines: 3,
              maxLines: 200,
            ),
          ],
        );
      },
    );
  }
}
