import '../../../general_exports.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    this.title,
    this.titleFontSize,
    this.titleFontWeight,
    this.leftChild,
    this.rightChild,
    this.rightText,
    this.rightTextColor,
    this.rightTextSize,
    this.titleColor,
    this.paddingBottom,
    this.withRightChild = false,
    this.withBottomText = false,
    this.rightFontWeight,
    this.leftPadding,
    this.bottomText,
    Key? key,
  }) : super(key: key);

  final String? title;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final Widget? leftChild;
  final Widget? rightChild;
  final String? rightText;
  final int? rightTextColor;
  final double? rightTextSize;
  final int? titleColor;
  final bool withRightChild;
  final double? paddingBottom;
  final FontWeight? rightFontWeight;
  final double? leftPadding;
  final bool withBottomText;
  final String? bottomText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CommonText(
          containerStyle: CommonContainerModel(
            paddingBottom: paddingBottom ?? 0.015,
            width: 0.5,
          ),
          title ?? '',
          style: appTextStyles.h3Style().copyWith(
                fontSize: titleFontSize ?? COMMON_H3_FONT,
                fontColor: titleColor ?? AppColors.primary,
                fontWeight: titleFontWeight ?? FontWeight.w400,
                textAlign: TextAlign.start,
                rowCrossAxisAlignment: CrossAxisAlignment.center,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                overflow: TextOverflow.ellipsis,
              ),
          leftChild: Padding(
            padding: EdgeInsets.only(
              right: leftPadding ?? paddingChild,
            ),
            child: leftChild ?? const SizedBox(),
          ),
          bottomChild: withBottomText
              ? CommonText(
                  bottomText ?? '',
                  style: appTextStyles.h3Style().copyWith(
                        fontSize: fontBody,
                        fontColor: AppColors.textGrey,
                        textAlign: TextAlign.start,
                        //  columnCrossAxisAlignment: CrossAxisAlignment.start,
                        // rowCrossAxisAlignment: CrossAxisAlignment.start,
                      ),
                  containerStyle: const CommonContainerModel(
                    marginLeft: 0.053,
                    marginTop: 0.002,
                  ),
                )
              : const SizedBox(),
        ),
        Visibility(
          visible: withRightChild,
          child: rightChild ??
              CommonText(
                rightText ?? 'rightText',
                style: appTextStyles.h3Style().copyWith(
                      fontColor: rightTextColor ?? AppColors.blue,
                      fontSize: rightTextSize ?? fontH3,
                      fontWeight: rightFontWeight ?? FontWeight.w400,
                    ),
              ),
        ),
      ],
    );
  }
}
