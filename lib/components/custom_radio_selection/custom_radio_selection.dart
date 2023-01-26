import '../../general_exports.dart';

class CustomRadioSelection extends StatelessWidget {
  const CustomRadioSelection({
    Key? key,
    this.title,
    this.leftWidget,
    this.onPress,
    this.isSelected = false,
    this.showRightText = false,
    this.rightText,
  }) : super(key: key);

  final String? title;
  final Widget? leftWidget;
  final Function? onPress;
  final bool isSelected;
  final bool showRightText;
  final String? rightText;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress?.call,
      style: appContainerStyles.bottomBorderStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            title ?? '',
            fontColor: isSelected ? AppColors.primary : Colors.black,
            leftChild: leftWidget ?? const SizedBox(),
          ),
          Visibility(
            replacement: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextContainer(
                  text: rightText,
                ),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? Color(AppColors.primary) : Colors.black38,
                ),
              ],
            ),
            visible: !showRightText,
            child: Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Color(AppColors.primary) : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
