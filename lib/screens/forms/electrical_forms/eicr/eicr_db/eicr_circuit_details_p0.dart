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
            // rightText: 'Done',
            // withActionText: true,
            // onPressActionText: Get.back,
          ),
          body: Column(
            children: <Widget>[
              CommonContainer(
                style: CommonContainerModel(
                  borderRadius: 0.2,
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
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelStyle: TextStyle(
                    color: Color(AppColors.white),
                    fontFamily: 'outfitBold',
                    fontSize: fontH3,
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

/*

Column(
                    children: <Widget>[
                      if (controller.circuitId == 1)
                        CircuitDetailsP1(controller: controller),
                      if (controller.circuitId == 2)
                        CircuitDetailsP2(controller: controller),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CommonButton(
                            text: controller.circuitId == 1 ? 'Cancel' : 'Back',
                            onPress: controller.onPressBackCircuit,
                            buttonStyle: appButtonStyles.cancelButtonStyle(),
                          ),
                          CommonButton(
                            text: controller.circuitId < 2 ? 'Next' : 'Save',
                            onPress: controller.onPressNextCircuit,
                            buttonStyle: appButtonStyles.addButtonStyle(),
                          ),
                        ],
                      ),
                      SizedBox(height: DEVICE_HEIGHT * 0.02),
                    ],
                  ),

*/
