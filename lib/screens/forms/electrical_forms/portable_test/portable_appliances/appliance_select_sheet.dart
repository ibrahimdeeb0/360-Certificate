import '../../../../../general_exports.dart';

class ApplianceSelectSheet extends StatelessWidget {
  const ApplianceSelectSheet({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final PortableAppliancesController controller;
  final bool isChilde;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      child: RawScrollbar(
        thumbColor: Colors.grey[400],
        // crossAxisMargin: 1.0,
        radius: const Radius.circular(20),
        thickness: 4,
        thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              ...listTitles
                  .map(
                    (String title) => ListOfStrings(
                      onPress: title == 'Other'
                          ? () => Get.bottomSheet(
                                ApplianceInputOtherSheet(
                                  controller: controller,
                                  keyOfValue: keyOfValue,
                                  isChilde: isChilde,
                                ),
                                isScrollControlled: true,
                              )
                          : () {
                              if (isChilde) {
                                if (controller.applianceDetails
                                    .containsKey(keyOfValue)) {
                                  controller.applianceDetails[keyOfValue] =
                                      title;
                                  controller.update();
                                  consoleLog(
                                      controller.applianceDetails[keyOfValue]);
                                }
                              } else {
                                if (controller.applianceSummary
                                    .containsKey(keyOfValue)) {
                                  controller.applianceSummary[keyOfValue] =
                                      title;
                                  controller.update();
                                  consoleLog(
                                      controller.applianceSummary[keyOfValue]);
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
      ),
    );
  }
}

class ApplianceInputOtherSheet extends StatelessWidget {
  const ApplianceInputOtherSheet({
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    super.key,
  });

  final String keyOfValue;
  final PortableAppliancesController controller;
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
                    ? controller.onChangeParentValues(keyOfValue, value)
                    : controller.onChangeChildeValues(keyOfValue, value);
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
