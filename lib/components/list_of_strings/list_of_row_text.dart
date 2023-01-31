import '../../general_exports.dart';

class ListOfRowText extends StatelessWidget {
  const ListOfRowText({
    this.name,
    this.rightText,
    this.onPress,
    Key? key,
  }) : super(key: key);

  final String? name;
  final String? rightText;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      name ?? '',
      onPress: onPress ?? () {},
      style: appTextStyles.h3StyleBlack().copyWith(
            rowMainAxisSize: MainAxisSize.max,
            textAlign: TextAlign.start,
          ),
      containerStyle: CommonContainerModel(
        //paddingHorizontal: 0.04,
        marginHorizontal: 0.01,
        paddingVertical: 0.02,
        touchEffect: TouchableEffect(type: TouchTypes.opacity),
        borderBottomWidth: 1,
        borderBottomColor: Color(AppColors.grey).withOpacity(0.3),
      ),
      rightChild: CommonText(
        rightText ?? 'postal_code',
        style: appTextStyles.h3StyleBlack().copyWith(),
        containerStyle: const CommonContainerModel(
          paddingLeft: 0.012,
        ),
      ),
    );
  }
}
