import '../../../general_exports.dart';

class FormHeader extends StatelessWidget with PreferredSizeWidget {
  FormHeader({
    this.title,
    this.withoutBackGround = false,
    this.onPressBack,
    this.withOverLay = false,
    this.withBack = true,
    this.withShadow = true,
    this.circleNumbering,
    this.showSaveBtn = true,
    this.onPressSave,
    this.titleSize,
    this.actionItem,
    this.pressImage,
    this.pressNote,
    Key? key,
  }) : super(key: key);

  final String? title;
  final double? titleSize;
  final bool withBack;
  final bool withoutBackGround;
  final Function? onPressBack;
  final Function? onPressSave;
  final bool withOverLay;
  final bool withShadow;
  final bool showSaveBtn;
  final String? circleNumbering;
  final ActionItem? actionItem;
  final Function()? pressImage;
  final Function()? pressNote;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + DEVICE_HEIGHT * isTablet(0.028, 0.014));

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
        toolbarHeight:
            kToolbarHeight + (DEVICE_HEIGHT * isTablet(0.028, 0.014)),
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
          style: appTextStyles.h2StyleBlack(),
          fontSize: titleSize ?? fontH2,
        ),

        leadingWidth: DEVICE_WIDTH * 0.25,
        // Back Arrow
        leading: showSaveBtn
            ? CommonText(
                'Save & Exit', // & Exit,
                onPress: onPressSave,
                fontColor: AppColors.primary,
                fontSize: fontH3,
                fontWeight: FontWeight.bold,
                containerStyle: CommonContainerModel(
                  alignment: Alignment.center,
                  marginLeft: 0.01,
                  touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
                ),
              )
            : const SizedBox(),

        actions: <Widget>[
          if (actionItem == null && circleNumbering != null)
            CircleNumbering(numbers: circleNumbering ?? ''),
          if (actionItem != null)
            CommonContainer(
              marginTop: 0.01,
              marginBottom: 0.006,
              marginHorizontal: 0.02,
              // onPress: actionItem?.onPress?.call,
              touchEffect: TouchableEffect(
                type: TouchTypes.scaleAndUp,
                lowerBound: 0.8,
              ),
              child: Row(
                children: <Widget>[
                  if (actionItem?.type == ActionType.image)
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color?>(
                          Color(AppColors.primary),
                        ),
                      ),
                      onPressed: pressImage,
                      icon: Icon(
                        Icons.image,
                        color: Color(AppColors.white),
                      ),
                    ),
                  0.006.boxWidth,
                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color?>(
                        Color(AppColors.primary),
                      ),
                    ),
                    onPressed: pressNote,
                    icon: Icon(
                      Icons.edit,
                      color: Color(AppColors.white),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CircleNumbering extends StatelessWidget {
  const CircleNumbering({
    Key? key,
    this.numbers,
  }) : super(key: key);

  final String? numbers;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      size: 0.11,
      marginHorizontal: 0.02,
      boxShape: BoxShape.circle,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: 1,
            ),
            duration: const Duration(milliseconds: 700),
            builder: (BuildContext context, double value, _) => CommonContainer(
              boxShape: BoxShape.circle,
              size: 0.11,
              child: CircularProgressIndicator(
                value: 1,
                strokeWidth: 3.0,
                color: Color(AppColors.primary),
              ),
            ),
          ),
          Align(
            child: CommonText(
              numbers ?? '',
              style: appTextStyles.h4MediumStyleBlack().copyWith(
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    columnMainAxisAlignment: MainAxisAlignment.center,
                    rowMainAxisAlignment: MainAxisAlignment.center,
                  ),
              containerStyle: const CommonContainerModel(
                padding: 0.01,
                size: 0.11,
                boxShape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
