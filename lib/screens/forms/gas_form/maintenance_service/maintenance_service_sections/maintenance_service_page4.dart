import '../../../../../general_exports.dart';

class MaintenanceServicePage4 extends StatelessWidget {
  const MaintenanceServicePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaintenanceServiceController>(
      init: MaintenanceServiceController(),
      builder: (MaintenanceServiceController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormToggleButton(
              title: 'Is appliance/installation safe to use?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart4][formKeySafeToUse],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart4,
                formKeySafeToUse,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title:
                  'if NO, has warning notice been issued and warning lable attached?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart4][formKeyHasWarningNotice],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart4,
                formKeyHasWarningNotice,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            FormToggleButton(
              title:
                  'Does installation conform to requirements of manufacturers instructions/installation standards?',
              titleSize: fontTitle,
              value: controller.formData[formKeyPart4][formKeyInstallationConform],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                formKeyPart4,
                formKeyInstallationConform,
                value,
              ),
              toggleType: FormToggleType.trueFalseOnly,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            Center(
              child: CommonText(
                'The Following Remidial \n Work is Required ',
                textAlign: TextAlign.center,
                marginBottom: 0.02,
                fontColor: Color(AppColors.primary),
                fontSize: fontH2,
              ),
            ),
            CommonInput(
              value: controller.formData[formKeyPart2][formKeyFollowingRemedial],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyPart2, formKeyFollowingRemedial, value),
              minLines: 8,
              maxLines: 200,
              marginBottom: 0.02,
            ),
          ],
        );
      },
    );
  }
}
