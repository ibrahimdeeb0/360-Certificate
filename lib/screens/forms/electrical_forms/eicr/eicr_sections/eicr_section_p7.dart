import '../../../../../general_exports.dart';

class EICRSectionG extends StatelessWidget {
  const EICRSectionG({super.key});

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return GetBuilder<EicrController>(
      builder: (EicrController controller) {
        return CommonContainer(
          style: appContainerStyles.formSectionsStyle,
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
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyDistributorFacilityG, value),
                toggleType: FormToggleType.trueFalse,
              ),
              FormToggleButton(
                title: 'Installation earth electrode',
                value: controller
                    .gazSafetyData[formKeyInstallationEarthElectrodeG],
                onChangeValue: (dynamic value) =>
                    controller.onChangeFormDataValue(
                        formKeyInstallationEarthElectrodeG, value),
                toggleType: FormToggleType.trueFalse,
              ),
              CustomSelectContainer(
                onTap: () => Get.bottomSheet(
                  EICRSelectBT(
                    listTitles: formList.listTypeI,
                    keyOfValue: formKeyTypeG,
                    controller: controller,
                  ),
                  elevation: 0.0,
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
              ),
              CommonInput(
                topLabelText: 'Location of the earth electrode',
                hint: 'Typing...',
                value:
                    controller.gazSafetyData[formKeyLocationTheEarthElectrodeG],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyLocationTheEarthElectrodeG, value),
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        );
      },
    );
  }
}
