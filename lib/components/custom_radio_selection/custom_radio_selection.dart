import '../../general_exports.dart';

class CustomRadioSelection extends StatelessWidget {
  const CustomRadioSelection({
    Key? key,
    this.title,
    this.onPress,
    this.isSelected = false,
    this.showRightText = false,
    this.rightText,
  }) : super(key: key);

  final String? title;
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
            fontColor: isSelected ? AppColors.primary : AppColors.greyDark,
            textAlign: TextAlign.start,
            rowMainAxisSize: MainAxisSize.max,
            containerStyle: CommonContainerModel(
              width: showRightText ? 0.6 : 0.8,
              alignment: AlignmentDirectional.topStart,
            ),
            bottomChild: const SizedBox(),
          ),
          Visibility(
            visible: !showRightText,
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
            child: Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_off,
              color: isSelected ? Color(AppColors.primary) : Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
