import '../../../../../general_exports.dart';

class EICRSectionC extends StatelessWidget {
  const EICRSectionC({super.key});

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
                leftText: 'Part 3. ', //C
                text: 'Extent and limitations of inspection and testing ',
                marginBottom: 0.025,
              ),
              CommonInput(
                topLabel: const CommonText(
                  'Extent of the electrical installation covered by this report : ',
                  textAlign: TextAlign.start,
                  marginBottom: 0.01,
                ),
                hint: 'Select or Typing',
                maxLines: 6,
                // textInputAction: TextInputAction.newline,
                value: controller.gazSafetyData[formKeyExtentElectricalC],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyExtentElectricalC, value),
                suffix: SuffixInputIcon(
                  onPress: () => Get.bottomSheet(
                    elevation: 0.0,
                    EICRSelectBT(
                      controller: controller,
                      keyOfValue: formKeyExtentElectricalC,
                      listTitles: formList.listExtentSuggestions,
                    ),
                  ),
                  iconWidget: const Icon(
                    Icons.filter_list,
                  ),
                ),
                marginBottom: 0.02,
              ),
              CommonInput(
                topLabel: const CommonText(
                  'Agreed limitations including the reasons, see regulations 653.2',
                  textAlign: TextAlign.start,
                  marginBottom: 0.01,
                ),
                hint: 'N/A',
                maxLines: 6,
                // textInputAction: TextInputAction.newline,
                value: controller.gazSafetyData[formKeyAgreedLimitationsC],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyAgreedLimitationsC, value),
                suffix: SuffixInputIcon(
                  onPress: () => Get.bottomSheet(
                    EICRSelectBT(
                      controller: controller,
                      keyOfValue: formKeyAgreedLimitationsC,
                      listTitles: formList.listAgreedSuggestions,
                    ),
                    elevation: 0.0,
                  ),
                  iconWidget: const Icon(
                    Icons.filter_list,
                  ),
                ),
                marginBottom: 0.02,
              ),
              CommonInput(
                topLabel: const CommonText(
                  'limitations agreed with :',
                  textAlign: TextAlign.start,
                  marginBottom: 0.01,
                ),
                value: controller.gazSafetyData[formKeyAgreedLimitationsWithC],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyAgreedLimitationsWithC, value),
                hint: 'Typing...',
                marginBottom: 0.02,
              ),
              CommonInput(
                topLabelText: 'Position (if applicable) :',
                value: controller.gazSafetyData[formKeyPositionC],
                onChanged: (dynamic value) =>
                    controller.onChangeFormDataValue(formKeyPositionC, value),
                hint: 'Typing...',
                marginBottom: 0.02,
              ),
              CommonInput(
                maxLines: 6,
                // textInputAction: TextInputAction.newline,
                topLabel: const CommonText(
                  'Operational limitations including the reason (page 1 of report)',
                  textAlign: TextAlign.start,
                  marginBottom: 0.01,
                ),
                value: controller.gazSafetyData[formKeyOperationalLimitationC],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyOperationalLimitationC, value),
                hint: 'N/A',
                marginBottom: 0.02,
              ),
              CommonText(
                'The inspection and testing detailed in this report and accompanying schedules have been carried out in accordance with BS 7671 as amended. It should be noted that cables concealed within trunking and conduits, under floors, in roof spaces, and generally within the fabric of the building or underground, have not been inspected unless specifically agreed between the client and inspector prior to the inspection',
                style: appTextStyles.h3StyleBlack(),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        );
      },
    );
  }
}
