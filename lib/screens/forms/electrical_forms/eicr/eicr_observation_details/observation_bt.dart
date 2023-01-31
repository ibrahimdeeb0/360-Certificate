import '../../../../../general_exports.dart';

class ObservationSelectBT extends StatelessWidget {
  const ObservationSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final ObservationDetailsController controller;

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
                              ObservationOtherBT(
                                controller: controller,
                                keyOfValue: keyOfValue,
                              ),
                              isScrollControlled: true,
                            )
                        : () {
                            if (controller.observationData
                                .containsKey(keyOfValue)) {
                              controller.observationData[keyOfValue] = title;
                              controller.update();
                              consoleLog(
                                  controller.observationData[keyOfValue]);
                            }
                            FocusManager.instance.primaryFocus?.unfocus();
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

class ObservationOtherBT extends StatelessWidget {
  const ObservationOtherBT({
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final String keyOfValue;
  final ObservationDetailsController controller;

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
                controller.onChangeObservationsData(keyOfValue, value);
              },
            ),
            CommonButton(
              onPress: () {
                controller.otherInputController.clear();
                controller.update();
                FocusManager.instance.primaryFocus?.unfocus();
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
