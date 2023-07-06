import '../../general_exports.dart';

// ignore: must_be_immutable
class CustomCheck extends StatefulWidget {
  CustomCheck({
    this.value = false,
    this.title = '',
    this.onChanged,
    this.onPress,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  bool? value;
  final Function? onChanged;
  final Function? onPress;
  final String title;
  final double? fontSize;

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  @override
  Widget build(BuildContext context) {
    return CommonText(
      widget.title,
      onPress: () {
        setState(() {
          widget.value = !widget.value!;
        });
        widget.onChanged?.call(widget.value);
        // setState(onPress);
        widget.onPress?.call();
      },
      style: appTextStyles.h3StyleBlack().copyWith(
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            rowMainAxisSize: MainAxisSize.min,
          ),
      fontSize: widget.fontSize,
      containerStyle: const CommonContainerModel(
        marginBottom: 0.01,
      ),
      leftChild: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          widget.value! ? Icons.check_box : Icons.check_box_outline_blank,
          color: widget.value! ? Color(AppColors.primary) : Colors.grey,
        ),
      ),
    );
  }
}
