import 'package:flutter_svg/flutter_svg.dart';

import '../../../general_exports.dart';

class SelectItemComponents extends StatelessWidget {
  const SelectItemComponents({
    Key? key,
    this.image,
    this.title,
    this.onPressItem,
    this.marginHorizontal = 0.0,
    this.paddingVertical = 0.012,
    this.isSelected = false,
    this.icon,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final Function? onPressItem;
  final double? marginHorizontal;
  final bool isSelected;
  final double? paddingVertical;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPressItem?.call,
      style: appContainerStyles.bottomBorderStyle,
      paddingVertical: paddingVertical,
      marginHorizontal: marginHorizontal,
      backgroundColor: isSelected
          ? Color(AppColors.primary).withOpacity(0.06)
          : AppColors.white,
      child: Row(
        children: <Widget>[
          CircleContainer(
            backgroundColor: isSelected == true ? Colors.white : null,
            iconWidget: icon != null
                ? SvgPicture.asset(
                    icon!,
                    width: DEVICE_WIDTH * 0.04,
                    height: DEVICE_HEIGHT * 0.04,
                  )
                : image,
            // iconWidget: image ??
            //     SvgPicture.asset(
            //       icon ?? iconCar,
            //       width: DEVICE_WIDTH * 0.04,
            //       height: DEVICE_HEIGHT * 0.04,
            //     ),
            contentPadding: 0.015,
          ),
          CommonText(
            title ?? 'Title',
            rowMainAxisSize: MainAxisSize.max,
            textAlign: TextAlign.start,
            containerStyle: CommonContainerModel(
              width: isSelected ? 0.62 : 0.68,
              marginHorizontal: 0.03,
            ),
            columnCrossAxisAlignment: CrossAxisAlignment.start,
          ),
          if (isSelected) SizedBox(width: DEVICE_WIDTH * 0.025),
          if (isSelected)
            Icon(
              Icons.task_alt,
              color: Color(
                AppColors.primary,
              ),
            ),
        ],
      ),
    );
  }
}
