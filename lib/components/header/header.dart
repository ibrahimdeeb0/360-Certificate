import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  Header({
    this.title,
    this.withNotification = false,
    this.withSearch = false,
    this.withoutBackGround = false,
    this.onPressBack,
    this.withOverLay = false,
    this.withBack = true,
    this.withShadow = false,
    this.actionItem,
    this.onPressSearch,
    Key? key,
  }) : super(key: key);

  final String? title;
  final bool withNotification;
  final bool withSearch;
  final bool withBack;
  final bool withoutBackGround;
  final Function? onPressBack;
  final Function? onPressSearch;
  final bool withOverLay;
  final bool withShadow;
  final ActionItem? actionItem;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + DEVICE_HEIGHT * isTablet(0.028, 0.01));

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: CommonContainerStyle().bottomShadow.copyWith(
            shadowColor: COMMON_GREY_COLOR,
            shadowOpacity: withShadow ? 0.1 : 0,
            shadowSpreadRadius: .5,
            shadowOffsetDY: 2,
            shadowBlurRadius: 4,
            paddingTop: 0.02,
            backgroundColor: Colors.white,
          ),
      child: AppBar(
        elevation: withShadow ? 1 : 0,
        toolbarHeight: kToolbarHeight + (DEVICE_HEIGHT * isTablet(0.028, 0.01)),
        // backgroundColor: withoutBackGround ? Colors.transparent : Colors.white,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        // allow pack icon
        // automaticallyImplyLeading: withBack,
        centerTitle: true,

        // title and icon
        title: CommonText(
          title ?? 'title',
          // marginTop: 0.02,
          style: appTextStyles.h2StyleBlack(),
        ),
        // Back Arrow
        leading: Visibility(
          visible: withBack,
          child: CommonContainer(
            touchEffect: TouchableEffect(type: TouchTypes.opacity),
            onPress: onPressBack ?? Get.back,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        // Visibility(
        //   visible: withBack,
        //   child: CircleContainer(
        //     onPress: onPressBack ?? Get.back,
        //     marginHorizontal: 0.02,
        //     backgroundColor: Color(AppColors.greyLight),
        //     iconWidget: const Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),

        actions: <Widget>[
          if (actionItem != null)
            CommonContainer(
              marginTop: 0.01,
              marginBottom: 0.006,
              marginHorizontal: 0.02,
              onPress: actionItem?.onPress?.call,
              touchEffect: TouchableEffect(
                type: TouchTypes.scaleAndUp,
                lowerBound: 0.8,
              ),
              child: actionItem?.type == ActionType.save
                  ? CommonText(
                      'Save',
                      fontWeight: FontWeight.bold,
                      fontColor: AppColors.primary,
                      marginHorizontal: 0.01,
                    )
                  : actionItem?.type == ActionType.add
                      ? Icon(
                          Icons.add_circle_outline,
                          color: Color(AppColors.primary),
                        )
                      : actionItem?.type == ActionType.filter
                          ? SvgPicture.asset(iconFilter, color: Colors.black)
                          : const Center(),
            ),
          if (withSearch)
            CommonContainer(
              onPress: onPressSearch,
              marginTop: 0.01,
              marginBottom: 0.006,
              marginHorizontal: 0.04,
              touchEffect: TouchableEffect(type: TouchTypes.opacity),
              child: SvgPicture.asset(iconSearch, color: Colors.black),
            ),
        ],
      ),
    );
  }
}

class ActionItem {
  ActionItem({
    this.type,
    this.onPress,
  });
  ActionType? type;
  Function()? onPress;
}

enum ActionType {
  save,
  add,
  filter,
  search,
}
