import '../../../general_exports.dart';

class MyValidateItem extends StatelessWidget {
  const MyValidateItem({
    this.title,
    this.titleColor,
    this.leftIcon,
    this.text,
    Key? key,
  }) : super(key: key);

  final String? title;
  final dynamic titleColor;
  final Widget? leftIcon;
  final List<Widget>? text;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreController>(
      init: MoreController(),
      builder: (MoreController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: CommonText(
                title ?? 'Title',
                fontColor: titleColor ?? Colors.black,
                fontWeight: FontWeight.bold,
                rowMainAxisSize: MainAxisSize.max,
                textAlign: TextAlign.start,
                marginHorizontal: 0.04,
                marginVertical: 0.02,
                containerStyle: const CommonContainerModel(
                  paddingBottom: 0.01,
                ),
              ),
            ),
            if (text != null) ...?text,
          ],
        );
      },
    );
  }
}

class ChildeItemsValidate extends StatelessWidget {
  const ChildeItemsValidate({
    Key? key,
    this.text,
    this.onPress,
  }) : super(key: key);
  final String? text;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress?.call,
      alignment: AlignmentDirectional.topStart,
      marginVertical: 0.01,
      borderBottomWidth: 1,
      paddingHorizontal: 0.02,
      paddingBottom: 0.015,
      borderBottomColor: AppColors.greyLightBorder,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
        duration: 10,
      ),
      child: CommonText(
        text ?? '',
        rowMainAxisSize: MainAxisSize.max,
        textAlign: TextAlign.start,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        containerStyle: const CommonContainerModel(
          width: 0.68,
          alignment: AlignmentDirectional.topStart,
          marginLeft: 0.04,
          marginHorizontal: 0.02,
        ),
        bottomChild: const SizedBox(),
      ),
    );
  }
}

class CretificatesValidateBTSheet extends StatefulWidget {
  const CretificatesValidateBTSheet(
      {required this.listTitles,
      required this.keyOfValue,
      required this.controller,
      super.key,
      this.keyOfBSType});
  final List<String> listTitles;
  final String keyOfValue;
  final String? keyOfBSType;
  final MinorWorksController controller;

  @override
  State<CretificatesValidateBTSheet> createState() =>
      _CretificatesValidateBTSheetState();
}

class _CretificatesValidateBTSheetState
    extends State<CretificatesValidateBTSheet> {
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
      // title: 'Select',
      responsiveContent: true,
      child: RawScrollbar(
        thumbColor: Colors.grey[400],
        crossAxisMargin: 2.0,
        radius: const Radius.circular(20),
        thickness: 4,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              0.015.boxHeight,
              const CommonText(
                'Select the expiry period of the certificate',
                textAlign: TextAlign.start,
                fontSize: fontH2,
              ),
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
              const CommonButton(
                text: 'Select',
              ),
              0.03.boxHeight,
            ],
          ),
        ),
      ),
    );
  }
}
