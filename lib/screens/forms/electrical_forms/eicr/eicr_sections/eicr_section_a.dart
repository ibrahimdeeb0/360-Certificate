import 'package:intl/intl.dart';

import '../../../../../general_exports.dart';

class EICRSectionA extends StatelessWidget {
  const EICRSectionA({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    // final EICRListsForm formList = EICRListsForm();
    return CommonContainer(
      backgroundColor: AppColors.white,
      paddingHorizontal: 0.03,
      borderRadius: 0.02,
      paddingVertical: 0.016,
      child: Column(
        children: <Widget>[
          const CustomTextFormTitle(
            leftText: 'Part 1. ',
            text: 'Reason for producing this report',
          ),
          CommonInput(
            topLabelText: '',
            maxLines: 6,
            hint: 'Select or Typing',
            value: controller.gazSafetyData[formKeyReasonProducingA],
            onChanged: (dynamic value) => controller.onChangeFormDataValue(
                formKeyReasonProducingA, value),
            suffix: SuffixInputIcon(
              onPress: () {},
              iconWidget: const Icon(
                Icons.filter_list,
              ),
            ),
          ),
          CommonInput(
            topLabelText: 'Date(s) inspection and testing carried out :',
            value: controller.gazSafetyData[formKeyDateTestingA],
            hint: 'Select Date',
            onChanged: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyDateTestingA, value),
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
  }
}
