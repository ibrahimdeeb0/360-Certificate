import '../../../../../general_exports.dart';

class DBSelectBT extends StatelessWidget {
  const DBSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final DistributionBoardController controller;
  final bool isChilde;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...listTitles
                .map(
                  (String title) => ListOfStrings(
                    onPress: title == 'Other'
                        ? () => Get.bottomSheet(
                              DBInputOtherBT(
                                controller: controller,
                                keyOfValue: keyOfValue,
                                isChilde: isChilde,
                              ),
                              isScrollControlled: true,
                            )
                        : () {
                            if (isChilde) {
                              if (controller.childCircuitData
                                  .containsKey(keyOfValue)) {
                                controller.childCircuitData[keyOfValue] = title;
                                controller.update();
                                consoleLog(
                                    controller.childCircuitData[keyOfValue]);
                              }
                            } else {
                              if (controller.parentDistrBoardData
                                  .containsKey(keyOfValue)) {
                                controller.parentDistrBoardData[keyOfValue] =
                                    title;
                                controller.update();
                                consoleLog(controller
                                    .parentDistrBoardData[keyOfValue]);
                              }
                            }

                            hideKeyboard();
                            Get.back();
                          },
                    name: title,
                  ),
                )
                .toList(),
            SizedBox(height: DEVICE_HEIGHT * 0.02),
          ],
        ),
      ),
    );
  }
}

class DBInputOtherBT extends StatelessWidget {
  const DBInputOtherBT({
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    super.key,
  });

  final String keyOfValue;
  final DistributionBoardController controller;
  final bool isChilde;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Type here',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CommonInput(
              marginTop: 0.01,
              topLabelText: 'Type the other value',
              hint: 'typing...',
              textInputAction: TextInputAction.go,
              controller: controller.otherInputController,
              onChanged: (dynamic value) {
                isChilde == false
                    ? controller.onChangeParentDbValues(keyOfValue, value)
                    : controller.onChangeChildeDbValues(keyOfValue, value);
              },
            ),
            CommonButton(
              onPress: () {
                controller.otherInputController.clear();
                controller.update();
                hideKeyboard();
                Get
                  ..back()
                  ..back();
              },
              text: 'Done',
              marginBottom: 0.02,
              marginTop: 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
