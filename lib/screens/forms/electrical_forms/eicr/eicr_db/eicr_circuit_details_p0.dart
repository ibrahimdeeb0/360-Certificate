import '../../../../../general_exports.dart';

class CircuitDetailsP0 extends StatelessWidget {
  const CircuitDetailsP0({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionBoardController>(
      init: DistributionBoardController(),
      builder: (DistributionBoardController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: controller.tabIndex == 0 ? 'Circuit Details' : 'TestResult',
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
                  marginTop: 0.02,
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
                  labelStyle: TextStyle(
                    color: Color(AppColors.white),
                    fontSize: fontH3,
                    fontWeight: FontWeight.bold,
                  ),
                  // labelColor: ,
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
                child: SingleChildScrollView(
                  controller: controller.scrollController,
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
            ],
          ),
        );
      },
    );
  }
}
