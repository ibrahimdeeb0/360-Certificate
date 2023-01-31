import 'package:flutter_svg/flutter_svg.dart';

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
      style: appTextStyles.h3StyleBlack().copyWith(
            rowMainAxisSize: MainAxisSize.max,
            textAlign: TextAlign.start,
            fontSize: nameSize ?? fontH3,
          ),
      containerStyle: CommonContainerModel(
        //paddingHorizontal: 0.04,
        marginHorizontal: 0.01,
        paddingVertical: 0.02,
        paddingRight: 0.015,
        touchEffect: TouchableEffect(type: TouchTypes.opacity),
        borderBottomWidth: 1,
        borderBottomColor: Color(AppColors.grey).withOpacity(0.3),
      ),
      leftChild: Padding(
        padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.03),
        child: withLeftIcon
            ? SvgPicture.asset(
                leftIcon!,
                width: 30,
                height: 30,
              )
            : const SizedBox(),
      ),
    );
  }
}
