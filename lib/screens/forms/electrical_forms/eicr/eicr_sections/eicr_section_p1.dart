import 'package:intl/intl.dart';

import '../../../../../general_exports.dart';

class EICRSectionA extends StatelessWidget {
  const EICRSectionA({super.key});

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return GetBuilder<EicrController>(
      // init: EicrController(),
      builder: (EicrController controller) {
        return CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: 'Part 1. ',
                text: 'Reason for producing this report',
              ),
              // CommonButton(
              //   onPress: () {
              //     consoleLog(controller.selectedId);
              //   },
              // ),
              CommonInput(
                topLabelText: '',
                maxLines: 6,
                // textInputAction: TextInputAction.newline,
                hint: 'Select or Typing',
                value: controller.gazSafetyData[formKeyReasonProducingA],
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyReasonProducingA, value),
                suffix: SuffixInputIcon(
                  onPress: () => Get.bottomSheet(
                    isScrollControlled: true,
                    EICRSelectBT(
                      controller: controller,
                      keyOfValue: formKeyReasonProducingA,
                      listTitles: formList.listReasonsSuggestions,
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
                topLabelText: 'Date(s) inspection and testing carried out :',
                value: controller.gazSafetyData[formKeyDateTestingA],
                hint: 'Select Date',
                onChanged: (dynamic value) => controller.onChangeFormDataValue(
                    formKeyDateTestingA, value),
                suffix: CommonText(
                  'Current Date',
                  onPress: () {
                    controller.onChangeFormDataValue(
                      formKeyDateTestingA,
                      DateFormat('dd/MM/yyyy')
                          .format(controller.currentTime)
                          .toString(),
                    );
                    controller.update();
                  },
                  fontSize: fontH3,
                  fontColor: AppColors.primary,
                  marginRight: 0.015,
                  containerStyle: CommonContainerModel(
                    touchEffect: TouchableEffect(type: TouchTypes.scaleAndUp),
                    // backgroundColor: Colors.amber,
                    paddingVertical: 0.01,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
