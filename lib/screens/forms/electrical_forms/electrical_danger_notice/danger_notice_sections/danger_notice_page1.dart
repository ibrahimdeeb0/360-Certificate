import '../../../../../general_exports.dart';

class DangerNoticePage1 extends StatelessWidget {
  const DangerNoticePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DangerNoticeController>(
      init: DangerNoticeController(),
      builder: (DangerNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 1. ',
                    text: 'Electrical Danger Notification'.toUpperCase(),
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'Date',
                    onTap: () {
                      CommonDatePicker.showDatePicker(
                        context,
                        currentTime: controller.selectedDate ?? DateTime.now(),
                        onConfirm: (DateTime value) {
                          controller.onSelectDate(
                            formKeyPart1,
                            formKeyDateElectricalDanger,
                            value,
                          );
                        },
                      );
                    },
                    enabled: false,
                    hint: 'select',
                    marginBottom: 0.02,
                    suffix: const Icon(Icons.keyboard_arrow_down),
                    value: controller.formData[formKeyPart1]
                        [formKeyDateElectricalDanger],
                  ),
                  SmallInputField(
                    title: 'Time of Electrical Danger Notification',
                    hint: '',
                    isInputSelection: true,
                    value: controller.formData[formKeyPart1]
                        [formKeyTimeElectricalDanger],
                    onTap: () {
                      CommonDatePicker.showTime12hPicker(
                        context,
                        currentTime: controller.selectedDate ?? DateTime.now(),
                        onConfirm: (DateTime value) {
                          final String temp = '$value'.formatTime;

                          controller.onChangeFormDataValue(
                            formKeyPart1,
                            formKeyTimeElectricalDanger,
                            temp,
                          );
                          controller.update();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 2. ',
                    text: 'Dangerous Condition'.toUpperCase(),
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'An electrical condition has been observed at the location on this certificate that, in the opinion of the competent person issuing this Notification, constitutes a real and immediate danger to persons, property or livestock. \nThe person(s) having responsibility for the safety of the electrical installation or equipment concerned have duty to ensure that appropriate action is taken without delay to remove the danger',
                    fontSize: fontH3,
                    style: appTextStyles.textStartStyle,
                  ),
                  CommonInput(
                    marginTop: 0.015,
                    maxLines: 10,
                    fillColor: Colors.grey[100],
                    onChanged: (String? value) =>
                        controller.onChangeFormDataValue(
                            formKeyPart2, formKeyDangerousCondition, value),
                    value: controller.formData[formKeyPart2]
                        [formKeyDangerousCondition],
                  ),
                  CommonText(
                    'The dangerous condition details could result in risk of injury or less from',
                    style: appTextStyles.textStartStyle,
                    marginTop: 0.02,
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    onTap: () {
                      final DangerNoticeListsForm list =
                          DangerNoticeListsForm();
                      Get.bottomSheet(
                        CustomDangerousCondition(
                          title: '',
                          buttonLabel: 'Select',
                          items: list.dangerousConditions,
                          initialValue: controller.formData[formKeyPart2]
                              [formKeyDangerousDetails],
                          onSelectedItemChanged: (String value) {
                            controller.onChangeFormDataValue(
                                formKeyPart2, formKeyDangerousDetails, value);
                            controller.update();
                            Get.back();
                          },
                        ),
                        isScrollControlled: true,
                      );
                    },
                    enabled: false,
                    hint: 'select',
                    marginBottom: 0.02,
                    suffix: const Icon(Icons.keyboard_arrow_down),
                    value: controller.formData[formKeyPart2]
                        [formKeyDangerousDetails],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
