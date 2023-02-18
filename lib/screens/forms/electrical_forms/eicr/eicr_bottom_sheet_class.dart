import '../../../../general_exports.dart';

class EICRSelectBT extends StatelessWidget {
  const EICRSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: DEVICE_HEIGHT * 0.02),
            ...listTitles
                .map(
                  (String title) => ListOfStrings(
                    onPress: title == 'Other'
                        ? () => Get.bottomSheet(
                              EICRInputOtherBT(
                                controller: controller,
                                keyOfValue: keyOfValue,
                              ),
                              isScrollControlled: true,
                              elevation: 0.0,
                            )
                        : () {
                            if (controller.gazSafetyData
                                .containsKey(keyOfValue)) {
                              controller.gazSafetyData[keyOfValue] = title;
                              controller.update();
                              consoleLog(controller.gazSafetyData[keyOfValue]);
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

class EICRInputOtherBT extends StatelessWidget {
  const EICRInputOtherBT({
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final String keyOfValue;
  final EicrController controller;

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
              onChanged: (dynamic value) {
                controller.onChangeFormDataValue(keyOfValue, value);
              },
            ),
            CommonButton(
              onPress: () {
                controller.update();
                hideKeyboard();
                Get
                  ..back()
                  ..back();
              },
              text: 'Done',
              width: 1,
              height: 0.06,
              marginBottom: 0.02,
              marginTop: 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

// class FilterFormSectionsBT extends StatelessWidget {
//   const FilterFormSectionsBT({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final EICRListsForm myLists = EICRListsForm();
//     return GetBuilder<EicrController>(
//       init: EicrController(),
//       builder: (EicrController controller) {
//         return BottomSheetContainer(
//           responsiveContent: true,
//           title: 'Select',
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 ...myLists.listFilterSections.map(
//                   (dynamic item) => CustomCheckBox(
//                     title: item['title'],
//                     isSelected: controller.listFormSections
//                         .where(
//                           (dynamic element) => element['id'] == item['id'],
//                         )
//                         .isNotEmpty,
//                     selectedColor: Colors.black,
//                     onPress: () {
//                       // controller.searching();
//                       controller.removeSection(item['id'], item);
//                     },
//                   ),
//                 ),
//                 const CustomCheckBoxForForms2(
//                   title: 'title aa',
//                   isChecked: true,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }