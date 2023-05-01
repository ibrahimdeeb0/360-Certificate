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
    this.textWidth,
    this.axisAlignment,
    this.isBtnBox = false,
    this.marginBottom = 0.02,
    Key? key,
  }) : super(key: key);

  final String? title;
  final double titleSize;
  final String? value;
  final double paddingHorizontal;
  final Function(String)? onChangeValue;
  final FormToggleType? toggleType;
  final Widget? textWidget;
  final double? textWidth;
  final CrossAxisAlignment? axisAlignment;
  final bool isBtnBox;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      paddingHorizontal: paddingHorizontal,
      marginBottom: marginBottom,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: axisAlignment ?? CrossAxisAlignment.center,
        children: <Widget>[
          if (textWidget == null)
            CommonText(
              title ?? 'Text',
              fontSize: titleSize,
              style: appTextStyles.textStartStyle,
              bottomChild: const SizedBox(),
              containerStyle: CommonContainerModel(
                width: textWidth ?? 0.65,
                marginRight: 0.02,
              ),
            )
          else
            textWidget!,
          GetBuilder<FormToggleButtonController>(
            global: false,
            init: FormToggleButtonController(
              currentValue: value ?? 'N/A',
              toggleType: toggleType ?? FormToggleType.yesNoNA,
            ),
            builder: (FormToggleButtonController controller) {
              return CommonButton(
                onPress: () {
                  controller.onChangeCurrentValue();
                  onChangeValue?.call(controller.currentValue!);
                },
                text: controller.currentValue,
                width: isBtnBox ? 0.14 : 0.2,
                height: isBtnBox ? 0.06 : 0.045,
                backgroundColor: Colors.blueGrey,
                alignment: Alignment.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
