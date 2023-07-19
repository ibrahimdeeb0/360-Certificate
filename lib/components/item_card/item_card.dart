import '../../general_exports.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    this.title,
    this.subTitle,
    this.onPressItem,
    this.hideArrow = false,
    this.letterSpacing = 0.7,
    this.marginHorizontal,
    this.isRequired = false,
  }) : super(key: key);

  final String? title;
  final String? subTitle;
  final Function? onPressItem;
  final bool hideArrow;
  // letter Spacing for Sub title
  final double? letterSpacing;
  final double? marginHorizontal;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPressItem?.call,
      width: 1,
      marginBottom: 0.02,
      marginHorizontal: marginHorizontal ?? 0.0,
      borderBottomWidth: 2,
      borderBottomColor: AppColors.greyLight,
      paddingTop: 0.0,
      paddingBottom: 0.015,
      touchEffect: TouchableEffect(type: TouchTypes.opacity),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            title ?? 'Title',
            rowMainAxisSize: MainAxisSize.max,
            textAlign: TextAlign.start,
            containerStyle: const CommonContainerModel(
              width: 0.62,
              marginHorizontal: 0.03,
            ),
            marginRight: 0.015,
            rightChild: isRequired
                ? Icon(
                    Icons.star_rounded,
                    color: Colors.red[700],
                    size: 0.011.flexAll,
                  )
                : const SizedBox(),
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            bottomChild: subTitle != null
                ? CommonText(
                    subTitle,
                    fontSize: fontH3,
                    fontColor: AppColors.greyDark,
                    marginTop: 0.01,
                    letterSpacing: letterSpacing,
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                  )
                : const SizedBox(),
          ),
          if (!hideArrow)
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 0.022.flexHeight + 0.022.flexWidth,
            ),
        ],
      ),
    );
  }
}
