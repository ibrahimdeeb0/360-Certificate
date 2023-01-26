import '../../general_exports.dart';

class CheckBoxC extends StatelessWidget {
  const CheckBoxC({this.onPress, this.title, this.child, Key? key})
      : super(key: key);

  final Function? onPress;
  final String? title;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckBoxController>(
      init: CheckBoxController(),
      global: false,
      builder: (CheckBoxController controller) => CommonContainer(
        onPress: () {
          controller.changeSelection();
          onPress?.call(controller.isSelected);
        },
        child: Row(
          children: <Widget>[
            if (controller.isSelected)
              Icon(
                Icons.check_box_rounded,
                color: Color(AppColors.primary),
              )
            else
              const Icon(
                Icons.check_box_outline_blank_rounded,
                color: Colors.grey,
              ),
            CommonText(
              title ?? '',
              style: appTextStyles.h3GreyStyle(),
              fontColor:
                  controller.isSelected ? AppColors.primary : AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
