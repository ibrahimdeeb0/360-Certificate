import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<MoreController>(
        init: MoreController(),
        builder: (MoreController controller) {
          return CommonContainer(
            style: const CommonContainerModel(
                // paddingHorizontal: 0.04,
                ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.07),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: CommonText(
                      homeController.plan,
                      fontColor: Colors.white,
                      containerStyle: appContainerStyles.planContainerStyle
                          .copyWith(marginBottom: 0.01),
                      onPress: homeController.getUrlSubscription,
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: CommonText(
                      'Hello, ${profileController.userProfileData['first_name']}'
                          .capitalize,
                      fontSize: fontH1,
                      fontWeight: FontWeight.bold,
                      marginRight: 0.02,
                      rightChild: Image.asset(
                        imageHello,
                        width: DEVICE_WIDTH * 0.08,
                        // height: DEVICE_HEIGHT * 0.08,
                      ),
                    ),
                  ),
                  0.015.boxHeight,
                  ...controller.moreItems.map(
                    (dynamic item) => MoreComponents(
                      title: item[keyTitle],
                      iconPath: item[keyIcon],
                      isLogout: item[keyTitle] == 'Logout',
                      onPress: item[keyOnPress],
                    ),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.25),
                  GetBuilder<MoreController>(
                    init: MoreController(),
                    builder: (MoreController controller) {
                      return Center(
                        child: CommonText(
                          'App Version (${controller.appVersion}${currentMode == AppMode.dev ? '-dev' : ''}) ',
                          style: appTextStyles.h3GreyStyle(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MoreComponents extends StatelessWidget {
  const MoreComponents({
    super.key,
    this.title,
    this.iconPath,
    this.onPress,
    this.isLogout = false,
  });

  final String? title;
  final String? iconPath;
  final Function()? onPress;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPress: onPress,
      // paddingBottom: 0.01,
      paddingHorizontal: 0.04,
      height: 0.07,
      overlayColor: Colors.black12,
      backgroundColor: Colors.white,
      elevation: 0.0,
      width: 1,
      borderRadius: 0.0,
      child: CommonContainer(
        borderBottomWidth: 2.5,
        borderBottomColor: AppColors.greyLight,
        paddingVertical: 0.02,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonText(
              title ?? 'Label',
              marginLeft: 0.03,
              fontSize: fontH2,
              containerStyle: const CommonContainerModel(
                width: 0.7,
              ),
              leftChild: CircleContainer(
                backgroundColor:
                    isLogout ? Color(AppColors.red).withOpacity(0.1) : null,
                circuitSize: 0.12,
                iconWidget: SvgPicture.asset(
                  iconPath ?? iconCustomers,
                  color: isLogout
                      ? Color(AppColors.red)
                      : Color(AppColors.primary),
                ),
              ),
            ),
            if (!isLogout)
              Padding(
                padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(AppColors.black2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
