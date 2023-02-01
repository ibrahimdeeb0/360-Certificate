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
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Color(AppColors.primary),
            onPressed: () {
              Get.toNamed(routeCreateCustomer);
              // showAnimatedDialog(
              //   context: context,
              //   barrierDismissible: true,
              //   builder: (BuildContext context) {
              //     return CommonContainer(
              //       // width: 0.5,
              //       // height: 0.5,
              //       borderRadius: 0.02,
              //       paddingVertical: 0.008,
              //       marginHorizontal: 0.07,
              //       marginVertical: 0.14,
              //       backgroundColor: Colors.white,
              //       child: Stack(
              //         children: <Widget>[
              //           SingleChildScrollView(
              //             child: Column(
              //               children: <Widget>[
              //                 SizedBox(height: DEVICE_HEIGHT * 0.06),
              //                 ...controller.bottomBarItems
              //                     .map(
              //                       (dynamic item) => ExpandableTile(
              //                         title: item[keyTitle],
              //                         titleColor: AppColors.primary,
              //                         children: <Widget>[
              //                           ...item[keyItems]
              //                               .map(
              //                                 (dynamic childe) => ChildeItems(
              //                                   text: childe[keyTitle],
              //                                   onPress: childe[keyOnPress],
              //                                 ),
              //                               )
              //                               .toList(),
              //                         ],
              //                       ),
              //                     )
              //                     .toList(),
              //                 SizedBox(height: DEVICE_HEIGHT * 0.06),
              //               ],
              //             ),
              //           ),
              //           Positioned(
              //             top: 0,
              //             left: 0,
              //             right: 0,
              //             child: CommonText(
              //               'Please Select Certificate Type',
              //               fontSize: fontH3,
              //               fontColor: AppColors.black,
              //               marginBottom: 0.02,
              //               marginTop: 0.01,
              //               containerStyle: CommonContainerModel(
              //                 backgroundColor: Colors.white,
              //                 width: 1,
              //                 alignment: AlignmentDirectional.center,
              //                 borderBottomWidth: 2,
              //                 borderColor: AppColors.greyLightBorder,
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //             bottom: 0,
              //             left: 0,
              //             right: 0,
              //             child: CommonButton(
              //               onPress: Get.back,
              //               text: 'Cancel',
              //               height: 0.05,
              //               borderWidth: 1,
              //               borderColor: AppColors.red,
              //               fontColor: AppColors.red,
              //               backgroundColor: Colors.white,
              //               marginHorizontal: 0.02,
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   animationType: DialogTransitionType.slideFromBottomFade,
              //   curve: Curves.fastOutSlowIn,
              //   duration: const Duration(milliseconds: 600),
              // );
            },
            tooltip: 'Create',
            icon: const Icon(Icons.add),
            label: const Text('Create'),
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

class ChildeItems extends StatelessWidget {
  const ChildeItems({
    Key? key,
    this.text,
    this.onPress,
  }) : super(key: key);
  final String? text;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress?.call,
      alignment: AlignmentDirectional.topStart,
      marginVertical: 0.01,
      borderBottomWidth: 1,
      paddingHorizontal: 0.02,
      paddingBottom: 0.015,
      borderBottomColor: AppColors.greyLightBorder,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
        duration: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            text ?? '',
            rowMainAxisSize: MainAxisSize.max,
            textAlign: TextAlign.start,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            containerStyle: const CommonContainerModel(
              width: 0.68,
              alignment: AlignmentDirectional.topStart,
              marginLeft: 0.04,
              marginHorizontal: 0.02,
            ),
            bottomChild: const SizedBox(),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(AppColors.grey),
            size: 20,
          ),
        ],
      ),
    );
  }
}
