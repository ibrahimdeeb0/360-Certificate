import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    this.image,
    this.title,
    this.subTitle,
    this.onPressItem,
    this.hideArrow = false,
    this.letterSpacing = 1.5,
    this.marginHorizontal,
  }) : super(key: key);

  final Widget? image;
  final String? title;
  final String? subTitle;
  final Function? onPressItem;
  final bool hideArrow;
  // letter Spacing for Sub title
  final double? letterSpacing;
  final double? marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPressItem?.call,
      width: 1,
      marginBottom: 0.02,
      marginHorizontal: marginHorizontal ?? 0.0,
      touchEffect: TouchableEffect(type: TouchTypes.opacity),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleContainer(
                iconWidget: image ??
                    SvgPicture.asset(
                      iconCar,
                      width: DEVICE_WIDTH * 0.04,
                      height: DEVICE_HEIGHT * 0.04,
                    ),
                contentPadding: 0.015,
              ),
              CommonText(
                title ?? 'Title',
                rowMainAxisSize: MainAxisSize.max,
                textAlign: TextAlign.start,
                containerStyle: const CommonContainerModel(
                  width: 0.62,
                  marginHorizontal: 0.03,
                ),
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                bottomChild: subTitle != null
                    ? CommonText(
                        subTitle,
                        fontSize: fontH3,
                        fontColor: AppColors.greyDark,
                        marginTop: 0.01,
                        letterSpacing: letterSpacing,
                      )
                    : const SizedBox(),
              ),
              if (!hideArrow)
                CommonContainer(
                  width: 0.07,
                  height: 0.04,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: DEVICE_HEIGHT * 0.02,
                  ),
                ),
            ],
          ),
          SizedBox(height: DEVICE_HEIGHT * 0.01),
          Divider(
            thickness: 1,
            color: Color(AppColors.greyLight),
          ),
        ],
      ),
    );
  }
}
