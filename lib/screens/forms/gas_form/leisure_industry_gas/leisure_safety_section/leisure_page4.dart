import '../../../../../general_exports.dart';

class LeisurePage5 extends StatelessWidget {
  const LeisurePage5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeisureIndustryController>(
      init: LeisureIndustryController(),
      builder: (LeisureIndustryController controller) {
        return CommonContainer(
          marginHorizontal: 0.04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CommonText(
                  'Audible CO Alarm',
                  fontSize: fontH1,
                  fontWeight: FontWeight.w500,
                  fontColor: Color(AppColors.primary),
                ),
              ),
              const CommonText(
                'Appliance 1',
                marginTop: 0.02,
                marginBottom: 0.01,
                textAlign: TextAlign.start,
                fontSize: fontH2,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black,
              ),
              FormToggleButton(
                title: 'Approved CO alarm fitted Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceApproved1],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceApproved1, value),
              ),
              FormToggleButton(
                title: 'Is CO alarm in date Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5][formKeyApplianceIsCo1],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceIsCo1, value),
              ),
              FormToggleButton(
                title: 'Testing of CO alarm satisfactoryYes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceTestCo1],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceTestCo1, value),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 3,
              ),
              const CommonText(
                'Appliance 2',
                marginTop: 0.02,
                marginBottom: 0.01,
                textAlign: TextAlign.start,
                fontSize: fontH2,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black,
              ),
              FormToggleButton(
                title: 'Approved CO alarm fitted Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceApproved2],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceApproved2, value),
              ),
              FormToggleButton(
                title: 'Is CO alarm in date Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5][formKeyApplianceIsCo2],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceIsCo2, value),
              ),
              FormToggleButton(
                title: 'Testing of CO alarm satisfactoryYes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceTestCo2],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceTestCo2, value),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 3,
              ),
              const CommonText(
                'Appliance 3',
                marginTop: 0.02,
                marginBottom: 0.01,
                textAlign: TextAlign.start,
                fontSize: fontH2,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black,
              ),
              FormToggleButton(
                title: 'Approved CO alarm fitted Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceApproved3],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceApproved3, value),
              ),
              FormToggleButton(
                title: 'Is CO alarm in date Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5][formKeyApplianceIsCo3],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceIsCo3, value),
              ),
              FormToggleButton(
                title: 'Testing of CO alarm satisfactoryYes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceTestCo3],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceTestCo3, value),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 3,
              ),
              const CommonText(
                'Appliance 4',
                marginTop: 0.02,
                marginBottom: 0.01,
                textAlign: TextAlign.start,
                fontSize: fontH2,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black,
              ),
              FormToggleButton(
                title: 'Approved CO alarm fitted Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceApproved4],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceApproved4, value),
              ),
              FormToggleButton(
                title: 'Is CO alarm in date Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5][formKeyApplianceIsCo4],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceIsCo4, value),
              ),
              FormToggleButton(
                title: 'Testing of CO alarm satisfactoryYes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceTestCo4],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceTestCo4, value),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 3,
              ),
              const CommonText(
                'Appliance 5',
                marginTop: 0.02,
                marginBottom: 0.01,
                textAlign: TextAlign.start,
                fontSize: fontH2,
                fontWeight: FontWeight.w500,
                fontColor: Colors.black,
              ),
              FormToggleButton(
                title: 'Approved CO alarm fitted Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceTestCo4],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceTestCo4, value),
              ),
              FormToggleButton(
                title: 'Is CO alarm in date Yes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5][formKeyApplianceIsCo5],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceIsCo5, value),
              ),
              FormToggleButton(
                title: 'Testing of CO alarm satisfactoryYes/No/NA',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyApplianceTestCo5],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyApplianceTestCo5, value),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 3,
              ),
              FormToggleButton(
                title:
                    'Cylinder/final connection hoses to LAV/boat satisfactory (Yes/No)',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5][formKeyCylinder],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyCylinder, value),
              ),
              FormToggleButton(
                title:
                    'Gas installation pipework (visual inspection) satisfactory (Yes/No)',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyGasInstallationPipework],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyGasInstallationPipework, value),
              ),
              FormToggleButton(
                title: 'Gas tightness test satisfactory(Yes/No/NA)',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyGasTightnessSatisfactory],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyGasTightnessSatisfactory, value),
              ),
              FormToggleButton(
                title:
                    'Emergency Control Value (ECV) accessible and operable (Yes/NO) ',
                toggleType: FormToggleType.yesNoNA,
                textWidth: 0.6,
                value: controller.formData[formKeyPart5]
                    [formKeyGasTightnessSatisfactory],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyPart5, formKeyGasTightnessSatisfactory, value),
              ),
              SmallInputField(
                title: 'LPG regulator operating pressure (mbar)',
                value: controller.formData[formKeyPart5][formKeyLPGOperating],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart5, formKeyLPGOperating, value),
              ),
              SmallInputField(
                title: 'LPG regulator operating pressure (mbar)',
                value: controller.formData[formKeyPart5][formKeyLPGLockup],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyPart5, formKeyLPGLockup, value),
              ),
            ],
          ),
        );
      },
    );
  }
}
