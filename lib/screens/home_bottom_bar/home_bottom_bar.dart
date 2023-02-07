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
            },
            tooltip: 'Create',
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: const CommonText(
              'Create',
              fontColor: Colors.white,
            ),
          ),
          body: Stack(
            children: <Widget>[
              Visibility(
                visible: controller.selectedIndex == toHome,
                child: const Home(),
              ),

              // Invoices
              Visibility(
                visible: controller.selectedIndex == toInvoices,
                child: const Invoices(),
              ),

              // Certificates
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
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    iconHome,
                    width: DEVICE_WIDTH * 0.05,
                    height: DEVICE_WIDTH * 0.05,
                    color: controller.selectedIndex == toHome
                        ? Color(AppColors.primary)
                        : Colors.grey[600],
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.business),
                  icon: SvgPicture.asset(
                    iconInvoice,
                    width: DEVICE_WIDTH * 0.05,
                    height: DEVICE_WIDTH * 0.05,
                    color: controller.selectedIndex == toInvoices
                        ? Color(AppColors.primary)
                        : Colors.grey[600],
                  ),
                  label: 'Invoices',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.business),
                  icon: SvgPicture.asset(
                    iconCertificates,
                    width: DEVICE_WIDTH * 0.05,
                    height: DEVICE_WIDTH * 0.05,
                    color: controller.selectedIndex == toCertificates
                        ? Color(AppColors.primary)
                        : Colors.grey[600],
                  ),
                  label: 'Certificates',
                ),
                BottomNavigationBarItem(
                  // icon: Icon(Icons.business),
                  icon: Padding(
                    padding: EdgeInsets.only(
                      bottom: DEVICE_HEIGHT * 0.006,
                      top: DEVICE_HEIGHT * 0.009,
                    ),
                    child: SvgPicture.asset(
                      iconMore,
                      width: DEVICE_WIDTH * 0.015,
                      height: DEVICE_WIDTH * 0.015,
                      color: controller.selectedIndex == toMore
                          ? Color(AppColors.primary)
                          : Colors.grey[600],
                    ),
                  ),
                  label: 'More',
                ),
              ],
              currentIndex: controller.selectedIndex,
              selectedItemColor: Color(AppColors.primary),
              onTap: controller.onChangeIndex,
              elevation: 10.0,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'Careem', fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Careem', fontWeight: FontWeight.bold),
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
