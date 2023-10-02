import '../../../../../general_exports.dart';

class DBSelectBT extends StatefulWidget {
  const DBSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    this.keyboardType,
    this.withSearch = true,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final DistributionBoardController controller;
  final bool isChilde;
  final TextInputType? keyboardType;
  final bool withSearch;

  @override
  State<DBSelectBT> createState() => _DBSelectBTState();
}

class _DBSelectBTState extends State<DBSelectBT> {
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
            if (widget.withSearch)
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
                                  DBInputOtherBT(
                                    controller: widget.controller,
                                    keyOfValue: widget.keyOfValue,
                                    isChilde: widget.isChilde,
                                    keyboardType: widget.keyboardType,
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
                                    consoleLog(
                                        widget.controller.parentDistrBoardData[
                                            widget.keyOfValue]);
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
    );
  }
}

class DBInputOtherBT extends StatelessWidget {
  const DBInputOtherBT({
    required this.keyOfValue,
    required this.controller,
    this.isChilde = false,
    this.keyboardType,
    super.key,
  });

  final String keyOfValue;
  final DistributionBoardController controller;
  final bool isChilde;
  final TextInputType? keyboardType;

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
              keyboardType: keyboardType,
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
