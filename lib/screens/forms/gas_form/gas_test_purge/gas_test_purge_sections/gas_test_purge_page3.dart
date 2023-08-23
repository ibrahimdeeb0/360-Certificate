import '../../../../../general_exports.dart';
import '../index.dart';

class GasTestPurgePage3 extends StatelessWidget {
  const GasTestPurgePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GasTestPurgeController>(
      init: GasTestPurgeController(),
      builder: (GasTestPurgeController controller) {
        return Column(
          children: <Widget>[
            CommonText(
              'Purging Procedure Details',
              textAlign: TextAlign.center,
              marginBottom: 0.02,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            FormToggleButton(
              title: 'Has a risk assessment been carried out?',
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
            FormToggleButton(
              title: 'Has a written procedure for theurgy been prepared? ',
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
            FormToggleButton(
              title: 'Have"NO SMOKING" signs etc been displayed as necessary?',
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
            FormToggleButton(
              title:
                  'Have persons in the vicinity of the purge been advised accordingly?',
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
            FormToggleButton(
              title:
                  'Have all appropriate valves to and from the section of pipe been labelled?',
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
            FormToggleButton(
              title:
                  'Where nitrogen gas is being used for an indirect purge have the gas cylinders been checked/] verified for their correct content?',
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
            FormToggleButton(
              title:
                  'Are suitable fire extinguishers available in case of an incident?',
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
            FormToggleButton(
              title: 'Are two way radios (intrinsically safe) available?',
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
            FormToggleButton(
              title: 'Are all electrical bonds fitted as necessary?',
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
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Calculate purge volume',
              textAlign: TextAlign.center,
              marginBottom: 0.03,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            SmallInputField(
              title: 'Gas Meter (m2)',
              value: controller.formData[formKeyPart3]
                  [formKeyOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOperatingPressure, value),
            ),
            SmallInputField(
              title: 'Installation pipework & fittings(m2)',
              value: controller.formData[formKeyPart3]
                  [formKeyOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOperatingPressure, value),
            ),
            SmallInputField(
              title: 'Total purge volume (m3)',
              value: controller.formData[formKeyPart3]
                  [formKeyOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOperatingPressure, value),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            FormToggleButton(
              title:
                  'Is Gas detector/oxygen measuring device as appropriate, intrinsically safe',
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
            Divider(
              color: Colors.grey[200],
              thickness: 3,
              height: 0.05.flexHeight,
            ),
            CommonText(
              'Findings',
              textAlign: TextAlign.center,
              marginBottom: 0.03,
              fontColor: Color(AppColors.primary),
              fontSize: fontH2,
            ),
            SmallInputField(
              title:
                  'Carry out purge noting final test criteria readings (02% or LFL%)',
              value: controller.formData[formKeyPart3]
                  [formKeyOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOperatingPressure, value),
            ),
            SmallInputField(
              title: 'Purge Pass or Fail',
              isInputSelection: true,
              suffix: const Icon(Icons.keyboard_arrow_down_rounded),
              value: controller.formData[formKeyPart3]
                  [formKeyOperatingPressure],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart3, formKeyOperatingPressure, value),
            ),
          ],
        );
      },
    );
  }
}
