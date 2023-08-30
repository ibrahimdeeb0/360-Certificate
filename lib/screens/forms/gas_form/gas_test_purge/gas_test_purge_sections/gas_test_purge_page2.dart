import '../../../../../general_exports.dart';

class GasTestPurgePage2 extends StatelessWidget {
  const GasTestPurgePage2({super.key});

  @override
  Widget build(BuildContext context) {
    final ListGasTestPurge list = ListGasTestPurge();

    return GetBuilder<GasTestPurgeController>(
      init: GasTestPurgeController(),
      builder: (GasTestPurgeController controller) {
        return Column(
          children: <Widget>[
            CommonText(
              'Tightness Test Details',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            FormToggleButton(
              title: 'Gas type Natural gas 9NG) Liquefied Petroleum Gas (LPG))',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyGasType],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyGasType,
                value,
              ),
              toggleType: FormToggleType.gasTypeNatural,
            ),
            FormToggleButton(
              title: 'Installation-New-(N) New Extension-(NE) Existing-(E)',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyInstallationTightness],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart2, formKeyInstallationTightness, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Could weather or changes in temperature affect test',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyWeatherOrChanges],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyPart2, formKeyWeatherOrChanges, value),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                GasTestPurgeSelectSheet(
                  keyOfPart: formKeyPart2,
                  keyOfValue: formKeyMeterTypeDiaphragm,
                  listTitles: list.listMeterTypP1,
                  controller: controller,
                  keyOfGasTestPurgeType: formKeyMeterTypeDiaphragm,
                ),
                isScrollControlled: true,
              ),
              child: SmallInputField(
                title: 'Meter type (Diaphragm, Rotary etc)',
                suffix: const Icon(Icons.keyboard_arrow_down),
                isInputSelection: true,
                value: controller.formData[formKeyPart2]
                    [formKeyMeterTypeDiaphragm],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart2, formKeyMeterTypeDiaphragm, value),
              ),
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                GasTestPurgeSelectSheet(
                  keyOfPart: formKeyPart2,
                  keyOfValue: formKeyMeterType,
                  listTitles: list.listMeterTypeP2,
                  controller: controller,
                  keyOfGasTestPurgeType: formKeyMeterType,
                ),
                isScrollControlled: true,
              ),
              child: SmallInputField(
                title: 'Meter type (U16, U40,P7 etc)',
                suffix: const Icon(Icons.keyboard_arrow_down),
                isInputSelection: true,
                value: controller.formData[formKeyPart2][formKeyMeterType],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart2, formKeyMeterType, value),
              ),
            ),
            FormToggleButton(
              title: 'Meter bypass installed',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2][formKeyMeterBypass],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyMeterBypass,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            SmallInputField(
              title: 'Gas Meter (m2)',
              value: controller.formData[formKeyPart2][formKeyGasMeter],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyGasMeter, value),
            ),
            SmallInputField(
              title: 'Installation pipework & fittings(m2)',
              value: controller.formData[formKeyPart2]
                  [formKeyInstallationPipework],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyInstallationPipework, value),
            ),
            SmallInputField(
              title: 'Total IV(m2)',
              value: controller.formData[formKeyPart2][formKeyTotalIV],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyTotalIV, value),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                GasTestPurgeSelectSheet(
                  keyOfPart: formKeyPart2,
                  keyOfValue: formKeyTestMediumFuel,
                  listTitles: list.listTestMediumFuel,
                  controller: controller,
                  keyOfGasTestPurgeType: formKeyTestMediumFuel,
                ),
                isScrollControlled: true,
              ),
              child: SmallInputField(
                title: 'Test medium-fuel gas, air',
                suffix: const Icon(Icons.keyboard_arrow_down),
                isInputSelection: true,
                value: controller.formData[formKeyPart2][formKeyTestMediumFuel],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart2, formKeyTestMediumFuel, value),
              ),
            ),
            SmallInputField(
              title: 'Tightness test pressure(TTP),mbar/bar',
              value: controller.formData[formKeyPart2][formKeyTightnessTest],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyTightnessTest, value),
            ),
            SmallInputField(
              title: 'Pressure gauge type (water,high SG,electronic etc)',
              value: controller.formData[formKeyPart2][formKeyPressureGauge],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyPressureGauge, value),
            ),
            SmallInputField(
              title: 'MPLR m3/h (IGE/UP/1)or MAPD mbar (IGE/UP/1A)',
              value: controller.formData[formKeyPart2][formKeyMPLR],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyMPLR, value),
            ),
            SmallInputField(
              title: 'Let by test period existing installation (minutes)',
              value: controller.formData[formKeyPart2][formKeyTestPeriod],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyTestPeriod, value),
            ),
            SmallInputField(
              title: 'Stabilization period (Minutes)',
              value: controller.formData[formKeyPart2]
                  [formKeyStabilizationPeriodGas],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyStabilizationPeriodGas, value),
            ),
            SmallInputField(
              title: 'Tightness test duration (TTD) (minutes)',
              value: controller.formData[formKeyPart2]
                  [formKeyTightnessTestDuration],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyTightnessTestDuration, value),
            ),
            FormToggleButton(
              title: 'Any inadequately ventilated areas to check?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyInadequatelyVentilated],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyInadequatelyVentilated,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title: 'Is barometric pressure correction necessary',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyBarometricPressure],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyBarometricPressure,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Findings',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            SmallInputField(
              title: 'Actual pressure drop (if any) mbar',
              value: controller.formData[formKeyPart2]
                  [formKeyActualPressureDrop],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyActualPressureDrop, value),
            ),
            SmallInputField(
              title: 'Actual leak rate m3/hr**',
              value: controller.formData[formKeyPart2][formKeyActualLeakRate],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyActualLeakRate, value),
            ),
            FormToggleButton(
              title: 'Have inadequately ventilated areas been checked?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart2]
                  [formKeyInadequatelyVentilatedAreas],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart2,
                formKeyInadequatelyVentilatedAreas,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            GestureDetector(
              onTap: () => Get.bottomSheet(
                GasTestPurgeSelectSheet(
                  keyOfPart: formKeyPart2,
                  keyOfValue: formKeyTightnessTestPassOrFail,
                  listTitles: list.listTightnessTest,
                  controller: controller,
                  keyOfGasTestPurgeType: formKeyTightnessTestPassOrFail,
                ),
                isScrollControlled: true,
              ),
              child: SmallInputField(
                title: 'Tightness test Pass or Fail',
                suffix: const Icon(Icons.keyboard_arrow_down),
                isInputSelection: true,
                value: controller.formData[formKeyPart2]
                    [formKeyTightnessTestPassOrFail],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart2, formKeyTightnessTestPassOrFail, value),
              ),
            ),
          ],
        );
      },
    );
  }
}
