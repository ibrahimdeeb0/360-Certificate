import '../../../../../general_exports.dart';

class MinorWorksSelectBT extends StatefulWidget {
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
  State<MinorWorksSelectBT> createState() => _MinorWorksSelectBTState();
}

class _MinorWorksSelectBTState extends State<MinorWorksSelectBT> {
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
    final ListMinorWorks lists = ListMinorWorks();
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
                                    MinorWorksSelectBTOtherBT(
                                      controller: widget.controller,
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

                                  if (areListsEqual(
                                      widget.listTitles, lists.listBS)) {
                                    final int index =
                                        widget.listTitles.indexOf(title);
                                    widget.controller
                                        .formData[widget.keyOfValue] = title;
                                    widget.controller
                                            .formData[widget.keyOfBSType!] =
                                        lists.listBSType[index];
                                    widget.controller.update();
                                  } else if (widget.controller.formData
                                      .containsKey(widget.keyOfValue)) {
                                    widget.controller
                                        .formData[widget.keyOfValue] = title;
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
