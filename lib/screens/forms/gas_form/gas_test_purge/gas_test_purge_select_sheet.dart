import '../../../../../general_exports.dart';
import 'index.dart';

class GasTestPurgeSelectSheet extends StatefulWidget {
  const GasTestPurgeSelectSheet({
    required this.listTitles,
    required this.keyOfPart,
    required this.keyOfValue,
    required this.controller,
    this.keyOfGasTestPurgeType,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfPart;
  final String keyOfValue;
  final String? keyOfGasTestPurgeType;
  final GasTestPurgeController controller;

  @override
  State<GasTestPurgeSelectSheet> createState() =>
      _GasTestPurgeSelectSheetState();
}

class _GasTestPurgeSelectSheetState extends State<GasTestPurgeSelectSheet> {
  TextEditingController textEditingController = TextEditingController();
  List<String>? filterValues;

  @override
  // ignore: always_declare_return_types
  initState() {
    hideKeyboard();

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
    final ListBreakdownService lists = ListBreakdownService();
    return BottomSheetContainer(
      title: 'Select',
      responsiveContent: true,
      child: RawScrollbar(
        thumbColor: Colors.grey[400],
        crossAxisMargin: 2.0,
        radius: const Radius.circular(20),
        thickness: 4,
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
                                    GasTestPurgeSelectSheetOtherBT(
                                      controller: widget.controller,
                                      keyOfPart: widget.keyOfPart,
                                      keyOfValue: widget.keyOfValue,
                                    ),
                                    isScrollControlled: true,
                                  )
                              : () {
                                  bool areListsEqual(
                                      List<String> list1, List<String> list2) {
                                    return Set<dynamic>.from(list1)
                                            .containsAll(list2) &&
                                        Set<dynamic>.from(list2)
                                            .containsAll(list1);
                                  }

                                  if (areListsEqual(widget.listTitles,
                                      lists.listBoilerMake)) {
                                    final int index =
                                        widget.listTitles.indexOf(title);
                                    widget.controller.formData[widget.keyOfPart]
                                        [widget.keyOfValue] = title;
                                    widget.controller.formData[widget.keyOfPart]
                                            [widget.keyOfGasTestPurgeType!] =
                                        lists.listBoilerMake[index];
                                    widget.controller.update();
                                  } else if (widget
                                      .controller.formData[widget.keyOfPart]
                                      .containsKey(widget.keyOfValue)) {
                                    widget.controller.formData[widget.keyOfPart]
                                        [widget.keyOfValue] = title;
                                    widget.controller.update();
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
              0.03.boxHeight,
            ],
          ),
        ),
      ),
    );
  }
}

class GasTestPurgeSelectSheetOtherBT extends StatelessWidget {
  const GasTestPurgeSelectSheetOtherBT({
    required this.keyOfPart,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final String keyOfPart;
  final String keyOfValue;
  final GasTestPurgeController controller;

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
              onChanged: (dynamic value) => controller.onChangeFormDataValue(
                  keyOfPart, keyOfValue, value),
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
