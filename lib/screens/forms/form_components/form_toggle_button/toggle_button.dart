import '../../../../general_exports.dart';

class FormToggleButton extends StatelessWidget {
  const FormToggleButton({
    this.title,
    this.value,
    this.titleSize = fontH3,
    this.paddingHorizontal = 0,
    this.onChangeValue,
    this.toggleType,
    this.textWidget,
    Key? key,
  }) : super(key: key);

  final String? title;
  final double titleSize;
  final String? value;
  final double paddingHorizontal;
  final Function(String)? onChangeValue;
  final FormToggleType? toggleType;
  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      paddingHorizontal: paddingHorizontal,
      marginBottom: 0.02,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (textWidget == null)
            CommonText(
              title ?? 'Text',
              fontSize: titleSize,
              style: appTextStyles.textStartStyle,
              bottomChild: const SizedBox(),
              containerStyle: const CommonContainerModel(
                width: 0.65,
                marginRight: 0.02,
              ),
            )
          else
            textWidget!,
          GetBuilder<FormToggleButtonController>(
            global: false,
            init: FormToggleButtonController(
              currentValue: value ?? 'N/A',
              toggleType: toggleType ?? FormToggleType.yesNo,
            ),
            builder: (FormToggleButtonController controller) {
              return CommonText(
                controller.currentValue,
                fontColor: AppColors.black,
                fontWeight: FontWeight.w500,
                onPress: () {
                  controller.onChangeCurrentValue();
                  onChangeValue?.call(controller.currentValue!);
                },
                containerStyle: appContainerStyles.formToggleStyle,
              );
            },
          ),
        ],
      ),
    );
  }
}
