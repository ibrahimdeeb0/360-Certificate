import '../../general_exports.dart';

class ContentPart1 extends StatelessWidget {
  const ContentPart1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CompleteProfileController>()) {
      return GetBuilder<CompleteProfileController>(
        init: CompleteProfileController(),
        builder: (CompleteProfileController controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              0.03.boxHeight,
              ...controller.formSelectionGroup.map(
                (Map<String, dynamic> item) => CompleteRegisterSelectionSheet(
                  title: item[keyTitle],
                  children: item['children'],
                  isSelected: controller.selectedFormGroup
                      .where((Map<String, dynamic> element) =>
                          element[keyId] == item[keyId])
                      .isNotEmpty,
                  onTap: () => controller.onSelectFormGroup(item),
                ),
              ),
            ],
          );
        },
      );
    } else {
      return const SizedBox();
    }
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
      child: Padding(
        padding: EdgeInsets.only(bottom: 0.03.flexHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              title ?? '',
              fontSize: fontH2,
              fontColor: isSelected ? AppColors.primary : Colors.black,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              rowMainAxisSize: MainAxisSize.max,
              rightChild: isSelected
                  ? Icon(
                      Icons.check_box,
                      color: Color(AppColors.primary),
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.grey[600],
                    ),
            ),
            0.015.boxHeight,
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
      ),
    );
  }
}
