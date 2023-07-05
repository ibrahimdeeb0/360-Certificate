import '../../general_exports.dart';

class CompleteRegisterStep1 extends StatelessWidget {
  const CompleteRegisterStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteRegisterController>(
      init: CompleteRegisterController(),
      builder: (CompleteRegisterController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...controller.activationSelectionS1.map(
                (Map<String, dynamic> item) => CompleteRegisterSelectionSheet(
                  title: item[keyTitle],
                  children: item['children'],
                  isSelected: controller.selectedItems
                      .where((Map<String, dynamic> element) =>
                          element[keyId] == item[keyId])
                      .isNotEmpty,
                  onTap: () => controller.onSelect(item),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CompleteRegisterSelectionSheet extends StatelessWidget {
  const CompleteRegisterSelectionSheet({
    Key? key,
    this.title,
    this.children,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final List<String>? children;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomSelectCheckbox(
            title: title ?? '',
            // onPress: onChange,

            isSelected: isSelected,
            fontSized: fontTitle,
            wihBottomBorder: false,
            marginBottom: 0,
          ),
          if (children != null && isSelected)
            ...children!.map(
              (String item) => CommonText(
                item,
                fontColor: Colors.grey[500],
                fontSize: fontTitle,
                marginBottom: 0.012,
              ),
            ),
        ],
      ),
    );
  }
}
