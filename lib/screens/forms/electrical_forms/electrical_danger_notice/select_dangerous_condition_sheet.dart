import 'package:flutter/cupertino.dart';

import '../../../../general_exports.dart';

class CustomDangerousCondition extends StatelessWidget {
  const CustomDangerousCondition({
    required this.items,
    this.title,
    this.buttonLabel,
    this.initialValue,
    this.onSelectedItemChanged,
    super.key,
  });

  final String? title;
  final String? buttonLabel;
  final String? initialValue;
  final ValueChanged<String>? onSelectedItemChanged;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    String value = ((initialValue == null) || (initialValue == ''))
        ? items[0]
        : initialValue!;

    final int initialItem = items.indexWhere((String item) => item == value);

    final FixedExtentScrollController pickerController =
        FixedExtentScrollController(initialItem: initialItem);

    return BottomSheetContainer(
      title: title ?? 'Select',
      height: 0.6,
      child: Column(
        children: <Widget>[
          CommonContainer(
            width: 0.9,
            height: 0.45,
            child: CupertinoPicker(
              selectionOverlay: const SizedBox(),
              backgroundColor: Color(AppColors.white),
              itemExtent: 0.06.flexHeight, //height of each item
              magnification: 1.1,
              diameterRatio: 1.5,
              squeeze: 1.2,
              onSelectedItemChanged: (int index) {
                value = items[index];
              },
              scrollController: pickerController,
              children: <Widget>[
                ...items.map(
                  (String item) => CommonText(
                    item,
                    // fontSize: fontH2,
                    overflow: TextOverflow.ellipsis,
                    containerStyle: CommonContainerModel(
                      backgroundColor: Colors.grey[300],
                      alignment: Alignment.center,
                      borderRadius: 0.02,
                      paddingHorizontal: 0.02,
                      marginVertical: 0.006,
                    ),
                    bottomChild: const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          CommonButton(
            onPress: () {
              onSelectedItemChanged?.call(value);
            },
            text: buttonLabel ?? 'Select',
            marginTop: 0.025,
            marginBottom: 0.01,
          ),
        ],
      ),
    );
  }
}
