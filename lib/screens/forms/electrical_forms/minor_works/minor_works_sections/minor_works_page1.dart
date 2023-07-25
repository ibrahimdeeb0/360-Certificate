import '../../../../../general_exports.dart';

class MinorWorksPage1 extends StatelessWidget {
  const MinorWorksPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 1 Derails of The Minor Works, Supply Characteristics & Earthing Arrangements',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
              // marginHorizontal: 0.04,
              // marginTop: 0.08,
            ),
            CommonInput(
              topLabelText: 'Description of Minor Works:',
              maxLines: 4,
              value: controller.formData[formKeyDescriptionMinorWorks],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyDescriptionMinorWorks, value),
            ),
            CommonInput(
              topLabelText: 'Date completed:',
              hint: 'Select Date',
              suffix: const Icon(Icons.calendar_today_outlined),
              marginBottom: 0.02,
              enabled: false,
              value: controller.formData[formKeyDeclaration]
                  [formKeyDateCompleted],
              onTap: () {
                CommonDatePicker.showDatePicker(
                  context,
                  currentTime: controller.selectedDate ?? DateTime.now(),
                  onConfirm: (DateTime value) {
                    controller.onSelectDate(
                      formKeyDeclaration,
                      formKeyDateCompleted,
                      value,
                    );
                  },
                );
              },
            ),
            FormToggleButton(
              title: 'System type and earthing arrangements:',
              titleSize: fontTitle,
              value: controller.formData[formKeySystemType],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeySystemType, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            CommonInput(
              topLabel: const CommonText(
                'Zs at Distribution Board / Consumer Unit supplying the final circuit:',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              value: controller.formData[formKeyZsDistributionBoard],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyZsDistributionBoard, value),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Presence of adequate main protective conductors:',
              fontColor: AppColors.primary,
              textAlign: TextAlign.start,
              marginBottom: 0.01,
              marginTop: 0.015,
            ),
            FormToggleButton(
              title: 'Earthing conductor',
              titleSize: fontTitle,
              value: controller.formData[formKeyEarthingConductor],
              onChangeValue: (dynamic value) => controller
                  .onChangeFormDataValue(formKeyEarthingConductor, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Protective bonding conductor(s) to:',
              fontColor: AppColors.primary,
              marginBottom: 0.01,
              marginTop: 0.02,
            ),
            SizedBox(
              child: Column(
                children: <Widget>[
                  FormToggleButton(
                    title: 'Water',
                    titleSize: fontTitle,
                    value: controller.formData[formKeyWater],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyWater, value),
                    toggleType: FormToggleType.passFailedNA,
                  ),
                  FormToggleButton(
                    title: 'Gas',
                    titleSize: fontTitle,
                    value: controller.formData[formKeyGas],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyGas, value),
                    toggleType: FormToggleType.passFailedNA,
                  ),
                  FormToggleButton(
                    title: 'Oil',
                    titleSize: fontTitle,
                    value: controller.formData[formKeyOil],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyOil, value),
                    toggleType: FormToggleType.passFailedNA,
                  ),
                  SmallInputField(
                    title: 'Other (state)',
                    hint: 'N/A',
                    value: controller.formData[formKeyProtectiveOther],
                    onChanged: (dynamic value) => controller
                        .onChangeFormDataValue(formKeyProtectiveOther, value),
                  ),
                ],
              ),
            ),
            CommonInput(
              topLabel: const CommonText(
                'Comments on existing installation (see Reg. 644.1.2):',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              marginBottom: 0.02,
              value: controller.formData[formKeyCommentsExistingInstallation],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyCommentsExistingInstallation, value),
            ),
            SmallInputField(
              title: 'Page No:',
              hint: 'N/A',
              marginBottom: 0.01,
              value: controller.formData[formKeyPageNo],
              onChanged: (dynamic value) =>
                  controller.onChangeFormDataValue(formKeyPageNo, value),
            ),
            FormToggleButton(
              title:
                  'Details of any departures from BS 7671: 2018, as amended to',
              titleSize: fontTitle,
              value: controller.formData[formKeyDetailsDepartures],
              onChangeValue: (dynamic value) => controller
                  .onChangeFormDataValue(formKeyDetailsDepartures, value),
              toggleType: FormToggleType.passFailedNA,
            ),
            CommonInput(
              topLabel: const CommonText(
                '(date) for the circuit altered or extended (Regulation 120.3, 133.1.3 & 133.5):',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              marginBottom: 0.02,
              value: controller.formData[formKeyDateCircuitAlteredExtended],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyDateCircuitAlteredExtended, value),
            ),
            CommonInput(
              topLabel: const CommonText(
                'Details of permitted exceptions (Regulation 411.3.3):',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              marginBottom: 0.02,
              value: controller.formData[formKeyDateDetailsPermittedExceptions],
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  formKeyDateDetailsPermittedExceptions, value),
            ),
            FormToggleButton(
              title: 'Risk assessment attached:',
              titleSize: fontTitle,
              value: controller.formData[formKeyRiskAssessmentAttachedMinor],
              onChangeValue: (dynamic value) =>
                  controller.onChangeFormDataValue(
                      formKeyRiskAssessmentAttachedMinor, value),
              toggleType: FormToggleType.passFailedNA,
            ),
          ],
        );
      },
    );
  }
}
