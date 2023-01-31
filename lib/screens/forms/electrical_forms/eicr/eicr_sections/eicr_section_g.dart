import '../../../../../general_exports.dart';

class EICRSectionG extends StatelessWidget {
  const EICRSectionG({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return CommonContainer(
      style: CommonContainerModel(
        backgroundColor: AppColors.white,
        paddingHorizontal: 0.03,
        borderRadius: 0.02,
        paddingVertical: 0.016,
      ),
      child: Column(
        children: <Widget>[
          const CustomTextFormTitle(
            leftText: 'Part 7. ', //G
            text: 'Particulars of installation referred to in this report',
          ),
          const CommonText(
            'Means of earthing',
            fontWeight: FontWeight.bold,
            containerStyle: CommonContainerModel(
              width: 1,
              marginBottom: 0.02,
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          FormToggleButton(
            title: "Distributor's facility",
            value: controller.gazSafetyData[formKeyDistributorFacilityG],
            onChangeValue: (dynamic value) => controller.onChangeFormDataValue(
                formKeyDistributorFacilityG, value),
          ),
          FormToggleButton(
            title: 'Installation earth electrode',
            value: controller.gazSafetyData[formKeyInstallationEarthElectrodeG],
            onChangeValue: (dynamic value) => controller.onChangeFormDataValue(
                formKeyInstallationEarthElectrodeG, value),
          ),
          CustomSelectContainer(
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listTypeI,
                keyOfValue: formKeyTypeG,
                controller: controller,
              ),
            ),
            title: 'Type',
            value: controller.gazSafetyData[formKeyTypeG],
            hint: 'Answer',
          ),
          SmallInputField(
            title: 'Electrode resistance Ra',
            value: controller.gazSafetyData[formKeyElectrodeResistanceG],
            onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyElectrodeResistanceG, value),
            suffix: CommonText(
              'Ω',
              style: appTextStyles.h3GreyStyle(),
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            paddingHorizontal: 0.0,
          ),
          CommonInput(
            topLabelText: 'Location of the earth electrode',
            hint: 'Typing...',
            value: controller.gazSafetyData[formKeyLocationTheEarthElectrodeG],
            onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyLocationTheEarthElectrodeG, value),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
