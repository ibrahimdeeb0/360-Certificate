import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  Header({
    this.title,
    this.withNotification = false,
    this.withBag = false,
    this.withoutBackGround = false,
    this.onPressBack,
    this.withOverLay = false,
    this.withBack = true,
    this.withShadow = true,
    this.actionItem,
    Key? key,
  }) : super(key: key);

  final String? title;
  final bool withNotification;
  final bool withBag;
  final bool withBack;
  final bool withoutBackGround;
  final Function? onPressBack;
  final bool withOverLay;
  final bool withShadow;
  final ActionItem? actionItem;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + DEVICE_HEIGHT * isTablet(0.028, 0.00));

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
        toolbarHeight: kToolbarHeight + (DEVICE_HEIGHT * isTablet(0.028, 0.00)),
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
          child: CircleContainer(
            onPress: onPressBack ?? Get.back,
            marginHorizontal: 0.02,
            backgroundColor: Color(AppColors.greyLight),
            iconWidget: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),

        actions: <Widget>[
          if (actionItem != null)
            CommonContainer(
              marginTop: actionItem?.type == ActionType.add ? 0.0 : 0.01,
              marginBottom: 0.006,
              marginHorizontal: 0.02,
              onPress: actionItem?.onPress?.call,
              child: actionItem?.type == ActionType.filter
                  ? Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: DEVICE_WIDTH * 0.08,
                    )
                  : actionItem?.type == ActionType.support
                      ? CommonText(
                          'support_center'.tr,
                          marginHorizontal: 0.02,
                        )
                      : actionItem?.type == ActionType.add
                          ? CircleContainer(
                              circuitSize: 0.1,
                              marginHorizontal: 0.02,
                              backgroundColor: Color(AppColors.greyLight),
                              iconWidget: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            )
                          : actionItem?.type == ActionType.safety
                              ? CommonText(
                                  'safety'.tr,
                                  rightChild: Padding(
                                    padding: EdgeInsets.only(
                                        right: DEVICE_WIDTH * 0.02),
                                    child: SvgPicture.asset(
                                      iconSafety,
                                      width: DEVICE_WIDTH * 0.03,
                                      height: DEVICE_HEIGHT * 0.03,
                                    ),
                                  ),
                                  containerStyle: CommonContainerModel(
                                    backgroundColor: AppColors.greyLight,
                                    borderRadius: 0.15,
                                    paddingHorizontal: 0.03,
                                  ),
                                )
                              : const Center(),
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
  support,
  safety,
  filter,
  add,
}
