import '../../../../../general_exports.dart';

class ApplianceDetails extends StatelessWidget {
  const ApplianceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableAppliancesController>(
      init: PortableAppliancesController(),
      builder: (PortableAppliancesController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title:
                controller.tabIndex == 0 ? 'Appliance Details' : 'Test Result',
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: Get.back,
            ),
          ),
          body: Column(
            children: <Widget>[
              CommonContainer(
                style: CommonContainerModel(
                  borderRadius: 0.02,
                  width: 1,
                  height: 0.05,
                  marginTop: 0.01,
                  marginHorizontal: 0.04,
                  backgroundColor: Color(AppColors.grey).withOpacity(0.2),
                  clipBehavior: Clip.hardEdge,
                ),
                child: TabBar(
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                    color: Color(AppColors.primary),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: fontH3,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: Color(AppColors.primary),
                  tabs: <Widget>[
                    ...controller.tabItems.map(
                      (dynamic item) => Tab(
                        text: item['text'],
                      ),
                    ),
                  ],
                  onTap: controller.onSelectTab,
                ),
              ),
              Expanded(
                child: RawScrollbar(
                  controller: controller.scrollController,
                  thumbColor: Colors.grey[500],
                  radius: const Radius.circular(50.0),
                  thumbVisibility: true,
                  thickness: 4.0,
                  padding: EdgeInsets.only(right: 0.005.flexWidth),
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: CommonContainer(
                      backgroundColor: Colors.white,
                      paddingHorizontal: 0.01,
                      child: Column(
                        children: <Widget>[
                          ...controller.tabViewItems.map(
                            (dynamic tabView) => controller.tabIndex ==
                                    controller.tabViewItems.indexOf(tabView)
                                ? tabView
                                : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
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
