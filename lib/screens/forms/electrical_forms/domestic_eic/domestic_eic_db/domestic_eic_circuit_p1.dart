import '../../../../../general_exports.dart';

class CircuitP1 extends StatelessWidget {
  const CircuitP1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DBController>(
      init: DBController(),
      builder: (DBController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: '',
            // actionItem: ActionItem(
            //   type: ActionType.save,
            //   onPress: Get.back,
            // ),
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
