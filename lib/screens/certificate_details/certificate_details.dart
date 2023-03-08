import '../../general_exports.dart';

class CertificateDetails extends StatelessWidget {
  const CertificateDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Certificate',
      ),
      body: GetBuilder<CertificateDetailsController>(
        init: CertificateDetailsController(),
        builder: (CertificateDetailsController controller) {
          return controller.certDetails.isEmpty
              ? const SizedBox()
              : CommonContainer(
                  width: 1,
                  height: 1,
                  backgroundColor: Colors.white,
                  child: Column(
                    children: <Widget>[
                      CertificateTitleCard(
                        certCode: '#${controller.certId}',
                        certStatus: controller.certStatus,
                        statusColor: controller.statusId == idCompleted
                            ? AppColors.completedClr
                            : controller.statusId == idCanceled
                                ? AppColors.canceledClr
                                : controller.statusId == idInProgress
                                    ? AppColors.inProgressClr
                                    : AppColors.pendingClr,
                      ),
                      CommonContainer(
                        paddingHorizontal: 0.04,
                        height: 0.8297,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: DEVICE_HEIGHT * 0.02),
                            // Tabs
                            CommonContainer(
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
                                        // item[keyText] == 'Customer Details'
                                        //     ? fontH4
                                        //     : fontBody,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                                onTap: controller.onSelectTab,
                              ),
                            ),
                            // Body
                            Expanded(
                              child: SingleChildScrollView(
                                controller: controller.scrollController,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: DEVICE_HEIGHT * 0.02),
                                    ...controller.tabViewItems.map(
                                      (dynamic tabView) =>
                                          controller.tabIndex ==
                                                  controller.tabViewItems
                                                      .indexOf(tabView)
                                              ? tabView
                                              : const SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class CertificateTitleCard extends StatelessWidget {
  const CertificateTitleCard({
    super.key,
    this.certCode,
    this.certStatus,
    this.statusColor,
  });

  final String? certCode;
  final String? certStatus;
  final dynamic statusColor;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      certCode ?? '#097282',
      rowMainAxisSize: MainAxisSize.max,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      rightChild: CommonText(
        certStatus ?? 'Pending',
        fontWeight: FontWeight.bold,
        containerStyle: CommonContainerModel(
          borderRadius: 0.05,
          backgroundColor: statusColor ?? AppColors.yellowOpacity,
          paddingHorizontal: 0.02,
          paddingVertical: 0.004,
        ),
      ),
      containerStyle: CommonContainerModel(
        width: 1,
        paddingHorizontal: 0.04,
        paddingVertical: 0.01,
        backgroundColor:
            Color(statusColor ?? AppColors.yellowOpacity).withOpacity(0.2),
      ),
    );
  }
}
