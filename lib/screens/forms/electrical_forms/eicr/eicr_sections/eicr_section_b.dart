import '../../../../../general_exports.dart';

class EICRSectionB extends StatelessWidget {
  const EICRSectionB({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: CommonContainerModel(
        backgroundColor: AppColors.white,
        paddingHorizontal: 0.03,
        borderRadius: 0.02,
        paddingVertical: 0.016,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomTextFormTitle(
            leftText: 'Part2. ',
            text:
                'Details of the installation which is the subject of this report',
            marginBottom: 0.01,
          ),
          CommonInput(
            topLabelText: 'Occupier :',
            value: controller.gazSafetyData[formKeyOccupierB],
            onChanged: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyOccupierB, value),
            hint: controller.gazSafetyData[formKeyOccupierB] == ''
                ? 'Typing...'
                : controller.gazSafetyData[formKeyOccupierB],
          ),
          const CustomTextFormTitle(
            text: 'Description of premises',
            marginTop: 0.03,
            marginBottom: 0.02,
          ),
          FormToggleButton(
            title: 'Domestic',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyDomesticB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyDomesticB, value),
          ),
          FormToggleButton(
            title: 'Commercial',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyDomesticB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyDomesticB, value),
          ),
          FormToggleButton(
            title: 'Industrial',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyDomesticB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyDomesticB, value),
          ),
          FormToggleButton(
            title: 'Other',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyDomesticB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyDomesticB, value),
          ),
          CommonInput(
            topLabelText: 'If other, please specify :',
            value: controller.gazSafetyData[formKeyIfOtherB],
            onChanged: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyIfOtherB, value),
            hint: controller.gazSafetyData[formKeyIfOtherB] == ''
                ? 'Typing...'
                : controller.gazSafetyData[formKeyIfOtherB],
            marginBottom: 0.03,
          ),
          CommonInput(
            topLabelText: 'Estimated age of the wiring system :',
            keyboardType: TextInputType.datetime,
            value: controller.gazSafetyData[formKeyEstimatedAgeB],
            onChanged: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyEstimatedAgeB, value),
            hint: controller.gazSafetyData[formKeyEstimatedAgeB] == ''
                ? 'Typing...'
                : controller.gazSafetyData[formKeyEstimatedAgeB],
            suffix: CommonText(
              'Years',
              style: appTextStyles.h3StyleBlack(),
              containerStyle: const CommonContainerModel(
                marginRight: 0.03,
              ),
            ),
            marginBottom: 0.04,
          ),
          const CustomTextFormTitle(
            text: 'Evidence of additions or alterations',
            marginBottom: 0.02,
          ),
          FormToggleButton(
            title: 'Yes',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyEvidenceYesB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyEvidenceYesB, value),
          ),
          FormToggleButton(
            title: 'No',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyEvidenceNoB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyEvidenceNoB, value),
          ),
          FormToggleButton(
            title: 'If yes, estimated age :',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyEvidenceNoB],
            onChangeValue: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyEvidenceNoB, value),
          ),
          CommonInput(
            topLabelText: 'If yes, estimated age :',
            keyboardType: TextInputType.datetime,
            value: controller.gazSafetyData[formKeyIfYesB],
            onChanged: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyIfYesB, value),
            hint: controller.gazSafetyData[formKeyIfYesB] == ''
                ? 'Typing...'
                : controller.gazSafetyData[formKeyIfYesB],
            suffix: CommonText(
              'Years',
              style: appTextStyles.h3StyleBlack(),
              containerStyle: const CommonContainerModel(
                marginRight: 0.03,
              ),
            ),
            marginBottom: 0.04,
          ),
          const CustomTextFormTitle(
            text: 'Installation records available?',
            marginBottom: 0.02,
          ),
          FormToggleButton(
            title: 'Yes',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyInstallationAvailableYesB],
            onChangeValue: (dynamic value) => controller.onChangeFormDataValue(
                formKeyInstallationAvailableYesB, value),
          ),
          FormToggleButton(
            title: 'No',
            toggleType: FormToggleType.trueFalse,
            value: controller.gazSafetyData[formKeyInstallationAvailableNoB],
            onChangeValue: (dynamic value) => controller.onChangeFormDataValue(
                formKeyInstallationAvailableNoB, value),
          ),
          CommonInput(
            topLabelText: 'Date of last inspection',
            keyboardType: TextInputType.datetime,
            value: controller.gazSafetyData[formKeyDateLastInspectionB],
            onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyDateLastInspectionB, value),
            hint: controller.gazSafetyData[formKeyDateLastInspectionB] == ''
                ? 'if available'
                : controller.gazSafetyData[formKeyDateLastInspectionB],
            suffix: CommonText(
              'Years',
              style: appTextStyles.h3StyleBlack(),
              containerStyle: const CommonContainerModel(
                marginRight: 0.03,
              ),
            ),
          ),
          SizedBox(height: DEVICE_HEIGHT * 0.01),
        ],
      ),
    );
  }
}

class FormNAComponents extends StatelessWidget {
  const FormNAComponents({
    Key? key,
    this.text,
    this.value,
  }) : super(key: key);

  final String? text;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: DEVICE_HEIGHT * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText(
            text ?? 'Text',
            rowMainAxisSize: MainAxisSize.max,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            textAlign: TextAlign.start,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            bottomChild: const SizedBox(),
            containerStyle: const CommonContainerModel(
              // backgroundColor: Colors.green,
              width: 0.66,
              marginRight: 0.02,
            ),
          ),
          CommonText(
            value ?? 'Value',
            containerStyle: appContainerStyles.formToggleStyle,
          ),
        ],
      ),
    );
  }
}
