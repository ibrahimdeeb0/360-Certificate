import 'package:flutter/cupertino.dart';

import '../../general_exports.dart';

class CustomYearsPicker extends StatelessWidget {
  const CustomYearsPicker({
    super.key,
    this.onSelectedItemChanged,
  });

  final ValueChanged<int>? onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    final List<int> years = <int>[];
    // Get current year
    final int currentYear = DateTime.now().year;

    // Add last 20 years to the list
    for (int i = currentYear - 20; i <= currentYear; i++) {
      years.add(i);
    }

    // Add next 20 years to the list
    for (int i = currentYear + 1; i <= currentYear + 20; i++) {
      years.add(i);
    }

    final int initialItem =
        years.indexWhere((int item) => item == DateTime.now().year);

    final FixedExtentScrollController pickerController =
        FixedExtentScrollController(initialItem: initialItem);

    int value = years[initialItem];

    return BottomSheetContainer(
      title: 'Select Year',
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
                value = years[index];
              },
              scrollController: pickerController,
              children: <Widget>[
                ...years.map(
                  (int item) => CommonText(
                    '$item',
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
