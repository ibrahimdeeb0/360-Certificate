import '../../general_exports.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: Header(
        backgroundColor: Colors.grey[100],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   onPressed: () {
      //     consoleLogPretty(homeController.subscriptionModel!.monthlyPlans);
      //   },
      // ),
      body: GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (SubscriptionController controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CommonText(
                    'Choose Your Plan',
                    fontSize: fontHeader,
                    marginTop: 0.02,
                    marginBottom: 0.04,
                  ),
                ),
                CommonContainer(
                  borderRadius: 0.025,
                  width: 0.75,
                  height: 0.055,
                  backgroundColor: Color(AppColors.grey).withOpacity(0.1),
                  clipBehavior: Clip.hardEdge,
                  child: TabBar(
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                      color: Color(AppColors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    dividerColor: Colors.transparent,
                    indicatorPadding: EdgeInsets.all(0.003.flexAll),
                    indicatorSize: TabBarIndicatorSize.tab,
                    overlayColor: MaterialStatePropertyAll<Color?>(
                        Colors.grey.withOpacity(0.3)),
                    splashBorderRadius: BorderRadius.circular(8.0),
                    labelStyle: TextStyle(
                      fontFamily: fontFamilyType,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelColor: Colors.grey[600],
                    labelColor: Color(AppColors.primary),
                    tabs: <Widget>[
                      ...controller.tabItems.map(
                        (dynamic item) => Tab(
                          text: item[keyText],
                        ),
                      ),
                    ],
                    onTap: controller.onSelectTab,
                  ),
                ),
                Expanded(
                  child: CommonContainer(
                    backgroundColor: Colors.grey[100],
                    marginTop: 0.03,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (controller.tabIndex == 0)
                          ...homeController.subscriptionModel!.monthlyPlans.map(
                            (MonthlyPlans item) => ChoosePlanContainer(
                              certType: item.name.contains('Certificates')
                                  ? item.name.split(' ')[0]
                                  : item.name,
                              // offer: '10%',
                              plan: item.interval.capitalize,
                              price: '${item.price}',
                              press: () {
                                controller.selectedMonthPlane = item;
                                controller.update();
                                Get.bottomSheet(
                                  PlanDetailsSheet(
                                    // isMonthly: true,
                                    certType: item.name.contains('Certificates')
                                        ? item.name.split(' ')[0]
                                        : item.name,
                                    price: '${item.price}',
                                    listFeatures: item.features,
                                  ),
                                  isScrollControlled: true,
                                );
                              },
                              isSelected:
                                  (controller.selectedMonthPlane != null) &&
                                      (controller.selectedMonthPlane?.id ==
                                          item.id),
                            ),
                          )
                        else if (controller.tabIndex == 1)
                          ...homeController.subscriptionModel!.yearlyPlans.map(
                            (YearlyPlans item) => ChoosePlanContainer(
                              certType: item.name.contains('Certificates')
                                  ? item.name.split(' ')[0]
                                  : item.name,
                              // offer: '',
                              plan: item.interval.capitalize,
                              price: '${item.price}',
                              press: () {
                                controller.selectedYearPlane = item;
                                controller.update();
                                Get.bottomSheet(
                                  PlanDetailsSheet(
                                    isMonthly: false,
                                    certType: item.name.contains('Certificates')
                                        ? item.name.split(' ')[0]
                                        : item.name,
                                    price: '${item.price}',
                                    listFeatures: item.features,
                                  ),
                                  isScrollControlled: true,
                                );
                              },
                              isSelected: (controller.selectedYearPlane !=
                                      null) &&
                                  (controller.selectedYearPlane?.id == item.id),
                            ),
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
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

class PlanDetailsSheet extends StatelessWidget {
  const PlanDetailsSheet({
    // required this.data,
    this.listFeatures,
    this.onPress,
    this.certType,
    this.isMonthly = true,
    this.price,
    super.key,
  });
  // final Map<String, dynamic> data;
  final String? certType;
  final String? price;
  final bool isMonthly;
  final List<Features>? listFeatures;
  final Function()? onPress;
/* 
   onWillPop: () async {
        consoleLog('closed bottom sheet');
        return false;
      },

 */
  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              '$certType Plan',
              fontSize: fontHeader,
              marginTop: 0.01,
              marginBottom: 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CommonText(
                  'This includes:',
                  fontColor: Colors.grey[700],
                ),
                CommonText(
                  'Per ${isMonthly ? 'Month' : 'Year'}',
                  leftChild: CommonText(
                    '$price',
                    leftChild: CommonText(
                      '£',
                      fontWeight: FontWeight.bold,
                      fontSize: fontH2,
                      fontColor: Colors.orange[700],
                    ),
                    letterSpacing: 1.5,
                    fontColor: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                    marginHorizontal: 0.01,
                  ),
                ),
              ],
            ),
            0.02.boxHeight,
            if (listFeatures != null && listFeatures!.isNotEmpty)
              ...listFeatures!.map(
                (Features item) => PlaneFeaturesContainer(
                  text: item.name,
                ),
              ),
            // const PlaneFeaturesContainer(),
            CommonButton(
              onPress: onPress ??
                  () {
                    Get.to(
                      () => PayForSubscribe(
                        certType: certType,
                        planeType: isMonthly ? 'Month' : 'Year',
                        price: price,
                      ),
                    );
                  },
              text: 'Subscribe',
              marginBottom: 0.03,
              marginTop: 0.02,
            ),
          ],
        ),
      ),
    );
  }
}

class PlaneFeaturesContainer extends StatelessWidget {
  const PlaneFeaturesContainer({
    super.key,
    this.text,
  });
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.015.flexHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.done,
            color: Colors.green[600],
          ),
          SizedBox(
            width: 0.84.flexWidth,
            child: CommonText(
              text ?? '',
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

class ChoosePlanContainer extends StatelessWidget {
  const ChoosePlanContainer({
    super.key,
    this.isSelected = false,
    this.offer,
    this.certType,
    this.price,
    this.plan,
    this.press,
  });
  final bool isSelected;
  final String? offer;
  final String? certType;
  final String? price;
  final String? plan;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: press,
      width: 1,
      backgroundColor: Colors.grey[300],
      borderRadius: 0.04,
      marginBottom: 0.02,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              CommonText(
                certType ?? '',
                fontWeight: FontWeight.w600,
                fontColor: isSelected ? Colors.white : Colors.black,
                topChild:
                    // const SizedBox(),
                    (offer != null)
                        ? CommonText(
                            offer ?? '',
                            fontColor:
                                isSelected ? Colors.white : Colors.orange[700],
                            marginTop: 0.01,
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 0.01.flexHeight),
                            child: const SizedBox(),
                          ),
                containerStyle: CommonContainerModel(
                  backgroundColor:
                      isSelected ? AppColors.primary : Colors.white,
                  borderRadius: 0.03,
                  paddingHorizontal: 0.06,
                  paddingVertical: 0.02,
                  width: 0.4,
                ),
              ),
              CommonText(
                price ?? '',
                fontWeight: FontWeight.bold,
                fontSize: fontH2,
                marginHorizontal: 0.01,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                leftChild: const CommonText(
                  '£',
                  fontWeight: FontWeight.bold,
                  fontSize: fontH2,
                ),
                bottomChild: CommonText(
                  plan ?? '',
                ),
                containerStyle: const CommonContainerModel(
                  paddingHorizontal: 0.04,
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
              child: isSelected
                  ? Icon(
                      Icons.radio_button_checked,
                      color: Color(AppColors.primary),
                    )
                  : Icon(
                      Icons.radio_button_off,
                      color: Colors.grey[600],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
