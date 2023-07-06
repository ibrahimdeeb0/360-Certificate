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
