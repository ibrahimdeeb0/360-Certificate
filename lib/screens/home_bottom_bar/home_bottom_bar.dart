import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBottomBarController>(
      init: homeBottomBarController,
      builder: (HomeBottomBarController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              // Home
              Visibility(
                visible: controller.selectedIndex == toHome,
                child: const Home(),
              ),

              // Notifications
              Visibility(
                visible: controller.selectedIndex == toNotifications,
                child: const Notifications(),
              ),

              // bottom bar
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: CommonContainer(
                  style: CommonContainerStyle().fullShadow.copyWith(
                        backgroundColor: Colors.transparent,
                        paddingTop: 0.01,
                        shadowOpacity: 0.1,
                        shadowBlurRadius: 20,
                        shadowSpreadRadius: 4,
                      ),
                  child: CurvedNavigationBar(
                    onTap: controller.onChangeIndex,
                    backgroundColor: Colors.transparent,
                    buttonBackgroundColor: Color(AppColors.primary),
                    animationDuration: const Duration(milliseconds: 350),
                    key: bottomNavigationKey,
                    curveWidth: isTablet(0.4, 0.25),
                    curveHeight: isTablet(0.665, 0.53),
                    curveInside: 0.1,
                    curveLeftRightRadius: isTablet(0.055, 0.05),
                    index: controller.selectedIndex,
                    height: DEVICE_HEIGHT *
                        isTablet(0.09, (Platform.isIOS ? 0.080 : 0.072)),
                    defaultHeight: isTablet(DEVICE_HEIGHT * 0.09, 75.0),
                    items: <Widget>[
                      ...controller.bottomBarItems.map(
                        (dynamic item) => BottomBarIcon(
                          title: '${item[keyTitle]}'.tr,
                          iconPath: item[iconPath],
                          itemIndex: controller.bottomBarItems.indexOf(item),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    Key? key,
    this.iconPath,
    this.title,
    this.itemIndex,
    this.color,
  }) : super(key: key);

  final String? iconPath;
  final String? title;
  final int? itemIndex;
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBottomBarController>(
      builder: (HomeBottomBarController controller) => CommonContainer(
        height: (controller.selectedIndex != itemIndex)
            ? 0.09
            : isTablet(0.07, 0.05),
        width: isTablet(0.45, 0.25),
        boxShape: controller.selectedIndex != itemIndex
            ? BoxShape.rectangle
            : BoxShape.circle,
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (controller.selectedIndex != itemIndex)
              SizedBox(
                height: DEVICE_HEIGHT * isTablet(0, 0.015),
              ),
            SvgPicture.asset(
              iconPath!,
              width: DEVICE_WIDTH * 0.06,
              height: DEVICE_WIDTH * 0.06,
              fit: BoxFit.scaleDown,
              color: Color(
                controller.selectedIndex == itemIndex
                    ? AppColors.white
                    : AppColors.grey,
              ),
            ),
            if (controller.selectedIndex != itemIndex)
              CommonText(
                title ?? 'Home',
                style: appTextStyles.h4GreyMediumStyle(),
                fontWeight: FontWeight.w600,
                marginBottom: isTablet(0.0, 0.006),
                marginTop: isTablet(0.0, 0.006),
              )
          ],
        ),
      ),
    );
  }
}
