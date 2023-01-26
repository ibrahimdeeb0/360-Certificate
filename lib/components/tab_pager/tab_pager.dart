import 'dart:io';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

import '../../general_exports.dart';

class TabPager extends StatelessWidget {
  const TabPager({
    required this.tabs,
    required this.pages,
    Key? key,
  }) : super(key: key);

  final List<Widget> tabs;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: CommonContainerModel(
        height: DEVICE_HEIGHT * 0.63,
        width: DEVICE_WIDTH,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: DEVICE_HEIGHT * (Platform.isAndroid ? 0.065 : 0.06),
            child: CommonContainer(
              style: CommonContainerModel(
                width: DEVICE_WIDTH,
                borderBottomColor: Color(AppColors.grey).withOpacity(0.5),
                borderBottomWidth: 0.4,
              ),
            ),
          ),
          ContainedTabBarView(
            tabBarProperties: TabBarProperties(
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(
                horizontal: DEVICE_WIDTH * 0.18,
                vertical: DEVICE_HEIGHT * 0.01,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: const TextStyle(
                fontSize: fontH3,
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelColor: Color(
                AppColors.grey,
              ),
              labelColor: Color(
                AppColors.primary,
              ),
              indicatorColor: Color(AppColors.primary),
            ),
            tabs: tabs,
            views: pages,
          ),
        ],
      ),
    );
  }
}
