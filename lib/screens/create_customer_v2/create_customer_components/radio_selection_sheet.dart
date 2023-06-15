import '../../../general_exports.dart';

class RadioSelectionSheet extends StatefulWidget {
  const RadioSelectionSheet({
    required this.items,
    required this.onSelectItem,
    this.title = '',
    this.initialValue,
    super.key,
  });

  final String title;

  /// List type can be enums class List<enumClass> ||
  /// or of List<Map<String,dynamic>> and should have a key named 'name' to read item from map
  final List<dynamic> items;

  final ValueChanged<dynamic> onSelectItem;

  /// it should be the same type of item inside list you pass it.
  final dynamic initialValue;

  @override
  State<RadioSelectionSheet> createState() => _RadioSelectionSheetState();
}

class _RadioSelectionSheetState extends State<RadioSelectionSheet> {
  dynamic itemSelected;

  @override
  void initState() {
    if (widget.initialValue != null) {
      setState(() {
        itemSelected = widget.initialValue;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      title: 'Select Contact Type',
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            0.02.boxHeight,
            ...widget.items.map(
              (dynamic item) => CustomRadioSelection(
                title: item.runtimeType
                        .toString()
                        .contains('_Map<String, dynamic>')
                    ? item[keyName]
                    : (item as Enum).name.capitalizeFirst,
                onPress: () {
                  setState(() {
                    itemSelected = item;
                  });
                  widget.onSelectItem.call(item);
                  hideKeyboard();
                  Get.back();
                },
                isSelected: itemSelected == item,
              ),
            ),
            0.02.boxHeight,
          ],
        ),
      ),
    );
  }
}
