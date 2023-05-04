import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../general_exports.dart';

class CustomMonthPicker extends StatelessWidget {
  const CustomMonthPicker({
    super.key,
    this.onSelectedItemChanged,
  });

  final ValueChanged<String>? onSelectedItemChanged;
  @override
  Widget build(BuildContext context) {
    final String currentMonthName = DateFormat('MMMM').format(DateTime.now());
    final List<String> month = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final int initialItem =
        month.indexWhere((String item) => item == currentMonthName);

    final FixedExtentScrollController pickerController =
        FixedExtentScrollController(initialItem: initialItem);

    String value = month[initialItem];

    return BottomSheetContainer(
      title: 'Select Month',
      height: 0.44,
      child: Column(
        children: <Widget>[
          CommonContainer(
            width: 0.8,
            height: 0.3,
            child: CupertinoPicker(
              selectionOverlay: const SizedBox(),
              backgroundColor: Color(AppColors.white),
              itemExtent: 0.045.flexHeight, //height of each item
              onSelectedItemChanged: (int index) {
                value = month[index];
              },
              scrollController: pickerController,
              children: <Widget>[
                ...month.map(
                  (String item) => CommonText(
                    item,
                    fontSize: fontH2,
                    containerStyle: CommonContainerModel(
                      backgroundColor: Colors.grey[300],
                      marginBottom: 0.007,
                      width: 0.4,
                      alignment: Alignment.center,
                      borderRadius: 0.02,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonButton(
            onPress: () {
              onSelectedItemChanged?.call(value);
            },
            text: 'Select',
            marginTop: 0.01,
            marginBottom: 0.01,
          ),
        ],
      ),
    );
  }
}
