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

class EICRMultiSelect extends StatefulWidget {
  const EICRMultiSelect({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final EicrController controller;

  @override
  State<EICRMultiSelect> createState() => _EICRMultiSelectState();
}

class _EICRMultiSelectState extends State<EICRMultiSelect> {
  List<String> listWords = <String>[];
  String myWord = '';
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      withButton: true,
      buttonData: ButtonSheetClass(
        text: 'Confirm',
        onPress: () {
          myWord = listWords.join(', \n');
          widget.controller.gazSafetyData[widget.keyOfValue] =
              myWord == '' ? 'N/A' : myWord;
          widget.controller.update();
          if (Get.isBottomSheetOpen!) {
            Get.back();
          }
        },
      ),
      child: RawScrollbar(
        thumbColor: Colors.grey[400],
        crossAxisMargin: 2.0,
        radius: const Radius.circular(20),
        thickness: 4,
        // thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.02.flexWidth),
            child: Column(
              children: <Widget>[
                0.015.boxHeight,
                ...widget.listTitles.map(
                  (String title) => CustomRadioSelection(
                    isSelected: listWords.contains(title),
                    onPress: () {
                      setState(
                        () {
                          if (listWords.contains(title)) {
                            listWords.remove(title);
                          } else {
                            listWords.add(title);
                          }
                        },
                      );
                    },
                    title: title,
                  ),
                ),
                0.07.boxHeight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
