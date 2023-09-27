import '../../../../general_exports.dart';

class EICRSelectBT extends StatefulWidget {
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
  State<EICRSelectBT> createState() => _EICRSelectBTState();
}

class _EICRSelectBTState extends State<EICRSelectBT> {
  TextEditingController textEditingController = TextEditingController();
  List<String>? filterValues;

  @override
  // ignore: always_declare_return_types
  initState() {
    setState(() {
      filterValues = widget.listTitles;
    });

    super.initState();
  }

  void onSearchForCustomer(String searchValue) {
    filterValues = widget.listTitles
        .where((String item) =>
            item.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    consoleLog(filterValues);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            0.015.boxHeight,
            CommonInput(
              hint: 'Type here to search',
              onChanged: onSearchForCustomer,
              controller: textEditingController,
            ),
            if (filterValues != null)
              if (filterValues!.isNotEmpty)
                ...filterValues!
                    .map(
                      (String title) => ListOfStrings(
                        onPress: title == 'Other'
                            ? () => Get.bottomSheet(
                                  EICRInputOtherBT(
                                    controller: widget.controller,
                                    keyOfValue: widget.keyOfValue,
                                  ),
                                  isScrollControlled: true,
                                  elevation: 0.0,
                                )
                            : () {
                                if (widget.controller.gazSafetyData
                                    .containsKey(widget.keyOfValue)) {
                                  widget.controller
                                      .gazSafetyData[widget.keyOfValue] = title;
                                  widget.controller.update();
                                  consoleLog(widget.controller
                                      .gazSafetyData[widget.keyOfValue]);
                                }
                                hideKeyboard();
                                Get.back();
                              },
                        name: title,
                      ),
                    )
                    .toList()
              else
                const CommonText(
                  'There are no results',
                  marginVertical: 0.06,
                ),
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

class EICRPart3Select extends StatefulWidget {
  const EICRPart3Select({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final EicrController controller;

  @override
  State<EICRPart3Select> createState() => _EICRPart3SelectState();
}

class _EICRPart3SelectState extends State<EICRPart3Select> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Type here',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...widget.listTitles
                .map(
                  (String title) => CustomRadioSelection(
                    isSelected:  
                        // widget.controller.gazSafetyData.containsKey(widget.keyOfValue) &&
                        (widget.controller.gazSafetyData[widget.keyOfValue] !=
                                '' ||
                            widget.controller
                                    .gazSafetyData[widget.keyOfValue] !=
                                'N/A'),
                    onPress: () {
                      if (widget.controller.gazSafetyData
                          .containsKey(widget.keyOfValue)) {
                        widget.controller.gazSafetyData[widget.keyOfValue] =
                            title;
                        widget.controller.update();
                        consoleLog(
                            widget.controller.gazSafetyData[widget.keyOfValue]);
                      }
                      hideKeyboard();
                      // Get.back();
                    },
                    title: title,
                  ),
                )
                .toList(),
            CommonButton(
              onPress: () {
                Get.back();
              },
              marginTop: 0.02,
              marginBottom: 0.015,
              text: 'Confirm',
            ),
          ],
        ),
      ),
    );
  }
}
