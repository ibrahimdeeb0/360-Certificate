import '../../../../../general_exports.dart';

class DBSelectSheet extends StatefulWidget {
  const DBSelectSheet({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final DBController controller;
  final bool isChilde;

  @override
  State<DBSelectSheet> createState() => _DBSelectSheetState();
}

class _DBSelectSheetState extends State<DBSelectSheet> {
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
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                                    DBInputOtherSheet(
                                      controller: widget.controller,
                                      keyOfValue: widget.keyOfValue,
                                      isChilde: widget.isChilde,
                                    ),
                                    isScrollControlled: true,
                                  )
                              : () {
                                  if (widget.isChilde) {
                                    if (widget.controller.childCircuitData
                                        .containsKey(widget.keyOfValue)) {
                                      widget.controller.childCircuitData[
                                          widget.keyOfValue] = title;
                                      widget.controller.update();
                                      consoleLog(widget.controller
                                          .childCircuitData[widget.keyOfValue]);
                                    }
                                  } else {
                                    if (widget.controller.parentDistrBoardData
                                        .containsKey(widget.keyOfValue)) {
                                      widget.controller.parentDistrBoardData[
                                          widget.keyOfValue] = title;
                                      widget.controller.update();
                                      consoleLog(widget
                                              .controller.parentDistrBoardData[
                                          widget.keyOfValue]);
                                    }
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
              0.03.boxHeight,
            ],
          ),
        ),
      ),
    );
  }
}

class DBInputOtherSheet extends StatelessWidget {
  const DBInputOtherSheet({
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    super.key,
  });

  final String keyOfValue;
  final DBController controller;
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
