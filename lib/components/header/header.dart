import '../../general_exports.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
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
    this.backgroundColor,
    Key? key,
    this.onPressAddImage,
    this.onPressSave,
  }) : super(key: key);

  final String? title;
  final bool withNotification;
  final bool withSearch;
  final bool withBack;
  final bool withoutBackGround;
  final Function()? onPressBack;
  final Function()? onPressAddImage;
  final Function()? onPressSave;

  final Function? onPressSearch;
  final bool withOverLay;
  final bool withShadow;
  final ActionItem? actionItem;
  final dynamic backgroundColor;

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
            backgroundColor: backgroundColor ?? Colors.white,
          ),
      child: AppBar(
        elevation: withShadow ? 1 : 0,
        toolbarHeight: kToolbarHeight + (DEVICE_HEIGHT * isTablet(0.028, 0.01)),
        // backgroundColor: withoutBackGround ? Colors.transparent : Colors.white,
        // backgroundColor: Colors.transparent,
        // foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        // allow pack icon
        // automaticallyImplyLeading: withBack,
        centerTitle: true,

        // title and icon
        title: CommonText(
          title ?? '',
          // marginTop: 0.02,
          style: appTextStyles.h2StyleBlack(),
        ),
        // Back Arrow
        leading: Visibility(
          visible: withBack,
          child: CommonContainer(
            boxShape: BoxShape.circle,
            clipBehavior: Clip.hardEdge,
            child: IconButton(
              onPressed: onPressBack ?? Get.back,
              tooltip: 'Back',
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          // CommonContainer(
          //   touchEffect: TouchableEffect(type: TouchTypes.opacity),
          //   onPress: onPressBack ?? Get.back,
          //   child: const Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //   ),
          // ),
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
                      onPress: onPressSave,
                    )
                  : actionItem?.type == ActionType.add
                      ? Icon(
                          Icons.add_circle_outline,
                          color: Color(AppColors.primary),
                        )
                      : actionItem?.type == ActionType.filter
                          ? SvgIconHelper(
                              iconPath: iconFilter,
                              color: Colors.black,
                              height: DEVICE_HEIGHT * 0.03,
                              width: DEVICE_WIDTH * 0.06,
                            )
                          : actionItem?.type == ActionType.search
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    right: DEVICE_WIDTH * 0.015,
                                  ),
                                  child: const SvgIconHelper(
                                      iconPath: iconSearch,
                                      color: Colors.black),
                                )
                              : actionItem?.type == ActionType.addImage
                                  ? CommonButton(
                                      width: 0.25,
                                      text: 'Add Image',
                                      fontSize: fontH4,
                                      onPress: onPressAddImage,
                                    )
                                  : const Center(),
            ),
          if (withSearch)
            CommonContainer(
              onPress: onPressSearch,
              marginTop: 0.01,
              marginBottom: 0.006,
              marginHorizontal: 0.04,
              touchEffect: TouchableEffect(type: TouchTypes.opacity),
              child: const SvgIconHelper(
                  iconPath: iconSearch, color: Colors.black),
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
  image,
  note,
  addImage,
  addNote,
}
