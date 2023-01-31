import '../../../general_exports.dart';

class SuffixInputIcon extends StatelessWidget {
  const SuffixInputIcon({
    Key? key,
    this.iconWidget,
    this.onPress,
  }) : super(key: key);

  final Function? onPress;
  final Widget? iconWidget;
  // components

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress?.call,
      alignment: Alignment.center,
      backgroundColor: AppColors.greyLightBorder,
      width: 0.08,
      height: 0.04,
      boxShape: BoxShape.rectangle,
      borderRadius: 0.02,
      marginHorizontal: 0.02,
      marginBottom: 0.12,
      touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
      child: iconWidget ??
          const Icon(
            Icons.filter_list,
          ),
    );
  }
}

class CustomInputDescription extends StatelessWidget {
  const CustomInputDescription({
    Key? key,
    this.title,
    this.hint,
    this.value,
    this.onChanged,
    this.suffixWidget,
    this.maxLines = 6,
  }) : super(key: key);

  final String? title;
  final String? hint;
  final String? value;
  final Function(dynamic)? onChanged;
  final Widget? suffixWidget;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return CommonInput(
      topLabelText: title,
      maxLines: maxLines ?? 6,
      hint: hint,
      suffix: suffixWidget,
      value: value,
      onChanged: onChanged,
    );
  }
}

class CustomTextFormTitle extends StatelessWidget {
  const CustomTextFormTitle({
    Key? key,
    this.text,
    this.leftText,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.fontSize,
  }) : super(key: key);

  final String? text;
  final String? leftText;

  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: DEVICE_HEIGHT * marginTop,
        bottom: DEVICE_HEIGHT * marginBottom,
        left: DEVICE_WIDTH * marginLeft,
        right: DEVICE_WIDTH * marginRight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonText(
            leftText ?? '',
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
          CommonText(
            text ?? '',
            bottomChild: const SizedBox(),
            textAlign: TextAlign.start,
            rowMainAxisSize: MainAxisSize.max,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            fontWeight: FontWeight.bold,
            containerStyle: const CommonContainerModel(
              width: 0.72,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.title,
    this.hint,
    this.keyboardType,
    this.textInputAction,
    this.marginTop,
    this.marginBottom,
  }) : super(key: key);

  final String? title;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double? marginTop;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return CommonInput(
      topLabelText: title ?? 'Name (Capitals)',
      hint: hint ?? 'NAME',
      keyboardType: keyboardType ?? TextInputType.name,
      textInputAction: textInputAction ?? TextInputAction.next,
      marginTop: marginTop,
      marginBottom: marginBottom,
    );
  }
}
