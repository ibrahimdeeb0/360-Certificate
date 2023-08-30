import '../../../../../general_exports.dart';

class LeisureSelectBT extends StatefulWidget {
  const LeisureSelectBT({
    required this.listTitles,
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final List<String> listTitles;
  final String keyOfValue;
  final LeisureAppliancesController controller;

  @override
  State<LeisureSelectBT> createState() => _LeisureSelectBTState();
}

class _LeisureSelectBTState extends State<LeisureSelectBT> {
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
                                  LeisureInputOtherBT(
                                    controller: widget.controller,
                                    keyOfValue: widget.keyOfValue,
                                  ),
                                  isScrollControlled: true,
                                )
                            : () {
                                if (widget.controller.applianceDetailsData
                                    .containsKey(widget.keyOfValue)) {
                                  widget.controller.applianceDetailsData[
                                      widget.keyOfValue] = title;
                                  widget.controller.update();
                                  widget.controller.updateApplianceData();
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

class LeisureInputOtherBT extends StatelessWidget {
  const LeisureInputOtherBT({
    required this.keyOfValue,
    required this.controller,
    super.key,
  });

  final String keyOfValue;
  final LeisureAppliancesController controller;

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
