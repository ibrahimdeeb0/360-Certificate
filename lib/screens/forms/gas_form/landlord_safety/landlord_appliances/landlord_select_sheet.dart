import '../../../../../general_exports.dart';

class LandlordSelectBT extends StatelessWidget {
  const LandlordSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final LandlordAppliancesController controller;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            0.015.boxHeight,
            ...listTitles
                .map(
                  (String title) => ListOfStrings(
                    onPress: title == 'Other'
                        ? () => Get.bottomSheet(
                              LandlordInputOtherBT(
                                controller: controller,
                                keyOfValue: keyOfValue,
                              ),
                              isScrollControlled: true,
                            )
                        : () {
                            if (controller.applianceDetailsData
                                .containsKey(keyOfValue)) {
                              controller.applianceDetailsData[keyOfValue] =
                                  title;
                              controller.update();
                              controller.updateApplianceData();
                            }
                            hideKeyboard();
                            Get.back();
                          },
                    name: title,
                  ),
                )
                .toList(),
            0.03.boxHeight,
          ],
        ),
      ),
    );
  }
}

class LandlordInputOtherBT extends StatelessWidget {
  const LandlordInputOtherBT({
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final String keyOfValue;
  final LandlordAppliancesController controller;

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
              onChanged: (dynamic value) =>
                  controller.onChangeApplianceValues(keyOfValue, value),
            ),
            CommonButton(
              onPress: () {
                controller.updateApplianceData();
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
