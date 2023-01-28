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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(AppColors.primary),
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: Stack(
            children: <Widget>[
              Visibility(
                visible: controller.selectedIndex == toHome,
                child: const Home(),
              ),

              // Notifications
              Visibility(
                visible: controller.selectedIndex == toCertificates,
                child: const Certificates(),
              ),

              // More
              Visibility(
                visible: controller.selectedIndex == toMore,
                child: const More(),
              ),
            ],
          ),
          bottomNavigationBar: CommonContainer(
            borderRadius: 0.02,
            shadowSpreadRadius: 10.0,
            shadowBlurRadius: 10.0,
            shadowOffsetDY: 10.0,
            shadowOpacity: 0.2,
            backgroundColor: COMMON_WHITE_COLOR,
            shadowColor: COMMON_GREY_COLOR,
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.business),
                  icon: SvgPicture.asset(
                    iconCertificates,
                    width: DEVICE_WIDTH * 0.05,
                    height: DEVICE_WIDTH * 0.05,
                    color: controller.selectedIndex == 1
                        ? Color(AppColors.primary)
                        : Colors.grey[600],
                  ),
                  label: 'Certificates',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'More',
                ),
              ],
              currentIndex: controller.selectedIndex,
              selectedItemColor: Color(AppColors.primary),
              onTap: controller.onChangeIndex,
              elevation: 10.0,
            ),
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
