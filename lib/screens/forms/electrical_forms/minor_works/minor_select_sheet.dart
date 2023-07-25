import '../../../../../general_exports.dart';

class MinorWorksSelectBT extends StatelessWidget {
  const MinorWorksSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    this.keyOfBSType,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final String? keyOfBSType;
  final MinorWorksController controller;

  @override
  Widget build(BuildContext context) {
    final ListMinorWorks lists = ListMinorWorks();
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
                              MinorWorksSelectBTOtherBT(
                                controller: controller,
                                keyOfValue: keyOfValue,
                              ),
                              isScrollControlled: true,
                            )
                        : () {
                            bool areListsEqual(
                                List<String> list1, List<String> list2) {
                              return Set<dynamic>.from(list1)
                                      .containsAll(list2) &&
                                  Set<dynamic>.from(list2).containsAll(list1);
                            }

                            if (areListsEqual(listTitles, lists.listBS)) {
                              final int index = listTitles.indexOf(title);
                              controller.formData[keyOfValue] = title;
                              controller.formData[keyOfBSType!] =
                                  lists.listBSType[index];
                              controller.update();
                            } else if (controller.formData
                                .containsKey(keyOfValue)) {
                              controller.formData[keyOfValue] = title;
                              controller.update();
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

class MinorWorksSelectBTOtherBT extends StatelessWidget {
  const MinorWorksSelectBTOtherBT({
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final String keyOfValue;
  final MinorWorksController controller;

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
                  controller.onChangeFormDataValue(keyOfValue, value),
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
