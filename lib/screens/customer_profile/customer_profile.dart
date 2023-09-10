import '../../general_exports.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProfileController>(
      init: CustomerProfileController(),
      builder: (CustomerProfileController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Customer Profile',
            backgroundColor: Color(AppColors.greyLightBorder).withOpacity(0.4),
            // actionItem: ActionItem(
            //   type: ActionType.search,
            // ),
          ),
          body: controller.customerData.isEmpty
              ? const SizedBox()
              : CommonContainer(
                  height: 1,
                  width: 1,
                  backgroundColor: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // Header Cards
                        CommonContainer(
                          paddingTop: 0.02,
                          backgroundColor:
                              Color(AppColors.greyLightBorder).withOpacity(0.4),
                          width: 1,
                          // height: 0.3,
                          paddingBottom: 0.025,
                          bottomLeftRadius: 0.1,
                          bottomRightRadius: 0.1,
                          paddingHorizontal: 0.04,
                          child: Column(
                            children: <Widget>[
                              HomeCards(
                                // paddingHorizontal: 0.04,
                                // width: 1,
                                iconPath: iconCertificates,
                                title: controller.certData.length.toString(),
                                subTitle: 'Number Of Certs',
                                bgColor:
                                    Color(AppColors.orange).withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        // Tabs
                        CommonContainer(
                          marginTop: 0.03,
                          marginHorizontal: 0.04,
                          borderRadius: 0.015,
                          width: 1,
                          height: 0.06,
                          backgroundColor:
                              Color(AppColors.grey).withOpacity(0.2),
                          clipBehavior: Clip.hardEdge,
                          child: TabBar(
                            controller: controller.tabController,
                            indicator: BoxDecoration(
                              color: Color(AppColors.primary),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: <Widget>[
                              ...controller.tabItems.map(
                                (dynamic item) => Tab(
                                  child: CommonText(
                                    item[keyText],
                                    fontColor:
                                        item[keyId] == controller.tabIndex
                                            ? Colors.white
                                            : AppColors.primary,
                                    fontSize: fontH3,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            onTap: controller.onSelectTab,
                          ),
                        ),

                        Column(
                          children: <Widget>[
                            ...controller.tabViewItems.map(
                              (dynamic tabView) => controller.tabIndex ==
                                      controller.tabViewItems.indexOf(tabView)
                                  ? tabView
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
