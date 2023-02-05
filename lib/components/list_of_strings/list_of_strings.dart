import '../../general_exports.dart';

class ListOfStrings extends StatelessWidget {
  const ListOfStrings({
    this.name,
    this.nameSize,
    this.onPress,
    this.withLeftIcon = false,
    this.leftIcon,
    Key? key,
  }) : super(key: key);

  final String? name;
  final double? nameSize;
  final Function? onPress;
  final bool withLeftIcon;
  final String? leftIcon;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      name ?? '',
      onPress: onPress ?? () {},
      rowMainAxisSize: MainAxisSize.max,
      textAlign: TextAlign.start,
      fontSize: nameSize ?? fontH3,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      containerStyle: CommonContainerModel(
        alignment: AlignmentDirectional.topStart,
        width: 1,
        marginHorizontal: 0.01,
        paddingVertical: 0.02,
        paddingRight: 0.015,
        touchEffect: TouchableEffect(type: TouchTypes.opacity),
        borderBottomWidth: 1,
        borderBottomColor: Color(AppColors.grey).withOpacity(0.3),
      ),
      bottomChild: const SizedBox(),
      // leftChild: Padding(
      //   padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.03),
      //   child: withLeftIcon
      //       ? SvgPicture.asset(
      //           leftIcon!,
      //           width: 30,
      //           height: 30,
      //         )
      //       : const SizedBox(),
      // ),
    );
  }
}
