import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../general_exports.dart';

class EICRSectionD extends StatelessWidget {
  const EICRSectionD({super.key});

  @override
  Widget build(BuildContext context) {
    // final EICRListsForm formList = EICRListsForm();
    return GetBuilder<EicrController>(
      builder: (EicrController controller) {
        //        String selectedArea = 'j_area';
        // String selectedCarClass = 'P';
        final List<String> dropdownItems = <String>[
          'SATISFACTORY',
          'UNSATISFACTORY'
        ];
        return CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: 'Part 4. ', //C
                text: 'Summary of the installation of the installation',
                marginBottom: 0.025,
              ),
              CommonInput(
                topLabel: const CommonText(
                  'General condition of the installation (in terms of electrical safety)',
                  textAlign: TextAlign.start,
                  marginBottom: 0.01,
                ),
                value: controller.gazSafetyData[formKeyGeneralConditionD],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyGeneralConditionD, value),
                hint: controller.gazSafetyData[formKeyGeneralConditionD] == ''
                    ? 'Typing...'
                    : controller.gazSafetyData[formKeyGeneralConditionD],
                suffix: Padding(
                  padding: EdgeInsets.only(top: DEVICE_HEIGHT * 0.15),
                  child: SvgPicture.asset(
                    icon860,
                  ),
                ),
                maxLines: 6,
                // textInputAction: TextInputAction.newline,
                marginBottom: 0.025,
              ),
              const CommonText(
                'Overall assessment of the installation terms of its suitability for continued use',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 0.015.flexHeight),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.only(
                    left: 0.03.flexWidth, right: 0.01.flexWidth),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value:
                      controller.gazSafetyData[formKeyOverallAssessmentD] != ''
                          ? controller.gazSafetyData[formKeyOverallAssessmentD]
                          : null,
                  dropdownColor: Colors.white,
                  hint: const CommonText('Select'),
                  onChanged: (String? newValue) {
                    controller.onChangeFormDataValue(
                        formKeyOverallAssessmentD, newValue);
                    controller.update();
                  },
                  items: dropdownItems.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: CommonText(
                          value,
                          fontColor: Colors.grey[800],
                        ),
                      );
                    },
                  ).toList(),
                  underline: const SizedBox(),
                ),
              ),
              CommonText(
                'An unsatisfactory rating indicates that serious and/or potentially dangerous conditions have been identified',
                fontColor: AppColors.redBold,
                textAlign: TextAlign.start,
                bottomChild: const SizedBox(),
                containerStyle: appContainerStyles.cardContainer(
                  backgroundColor: Color(AppColors.redBold).withOpacity(0.12),
                  paddingHorizontal: 0.03,
                  marginBottom: 0.02,
                ),
              ),
              FormToggleButton(
                title: 'Alternative source of supply',
                toggleType: FormToggleType.trueFalse,
                value: controller.gazSafetyData[formKeyAlternativeSourceD],
                onChangeValue: (dynamic value) => controller
                    .onChangeFormDataValue(formKeyAlternativeSourceD, value),
              ),
              CommonText(
                '(as indicated in the attached table, if applicable)',
                style: appTextStyles.h4GreyMediumStyle().copyWith(
                      textAlign: TextAlign.start,
                      rowMainAxisSize: MainAxisSize.max,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
