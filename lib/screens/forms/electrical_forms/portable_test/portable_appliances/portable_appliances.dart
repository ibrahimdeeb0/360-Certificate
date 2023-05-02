import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class PortableAppliances extends StatelessWidget {
  const PortableAppliances({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableAppliancesController>(
      init: PortableAppliancesController(),
      builder: (PortableAppliancesController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: 'Test Appliances',
            // title: controller.selectedParentDistrBoardData?[
            //     parentDistributionBoardValues][formKeyDBRef],
            // rightText: 'Done',
            // withActionText: true,
            // onPressActionText: Get.back,
          ),
          body: CommonContainer(
            width: 1,
            height: 1,
            paddingHorizontal: 0.04,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  // ViewDBDetails(
                  //   onPressDBContainer: () => Get.to(
                  //     () => const DBrdDetails(),
                  //     transition: Transition.leftToRightWithFade,
                  //   ),
                  // ),
                  CommonContainer(
                    onPress: () =>
                        Get.to(() => const SummaryApplianceDetails()),
                    backgroundColor: Color(AppColors.grey).withOpacity(0.1),
                    width: 1,
                    borderRadius: 0.02,
                    paddingTop: 0.015,
                    paddingBottom: 0.015,
                    paddingHorizontal: 0.03,
                    borderWidth: 1,
                    borderColor: AppColors.grey,
                    touchEffect: TouchableEffect(type: TouchTypes.opacity),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SvgPicture.asset(
                          iconPlugFill,
                          width: DEVICE_WIDTH * 0.18,
                          height: DEVICE_HEIGHT * 0.08,
                        ),
                        CommonContainer(
                          style: const CommonContainerModel(
                            width: 0.6,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CommonText(
                                'Summary of Testing',
                                style: appTextStyles.h2StyleBlack().copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontColor: Color(AppColors.colorBlack)
                                          .withOpacity(0.8),
                                      textAlign: TextAlign.start,
                                    ),
                              ),
                              CommonText(
                                'Total Appliance: ',
                                style: appTextStyles.h3GreyStyle().copyWith(
                                      fontSize: fontBody,
                                      textAlign: TextAlign.start,
                                      fontColor: AppColors.textGrey,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          iconArrowGo,
                          color: Colors.black,
                          width: 16.0,
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                  CommonText(
                    'Add Appliances',
                    fontColor: AppColors.textGrey,
                    fontWeight: FontWeight.w500,
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                    containerStyle: const CommonContainerModel(
                      marginBottom: 0.01,
                      marginTop: 0.03,
                    ),
                  ),
                  ViewCircuitsDetails(
                    onPressDBContainer: () {
                      Get.to(() => const ApplianceDetails());
                    },
                    iconPath: iconPlug,
                    circuitName: 'Appliance # 1',
                    locationName: 'Pass',
                  ),
                  // const [formKeyApplianceChildeData]

                  // ...controller.appliancesArray.map(
                  //   (dynamic item) => ViewCircuitsDetails(
                  //     iconPath: iconPlug,
                  //     onPressDBContainer: () {
                  //       controller.selectedApplianceData = item;

                  //       controller.resetApplianceData();
                  //       controller.setChildeValues();
                  //       Get.to(
                  //         () => const ApplianceDetails(),
                  //         transition: Transition.leftToRight,
                  //         duration: const Duration(milliseconds: 300),
                  //       );
                  //     },
                  //   ),
                  // ),

                  CommonButton(
                    onPress: () {
                      controller.resetApplianceData();
                      // controller.onCreateChildeCircuit();
                    },
                    height: 0.05,
                    marginVertical: 0.02,
                    child: CommonText(
                      'Add New Appliance',
                      style: appTextStyles.h3MediumStyleWhite(),
                      leftChild: Padding(
                        padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.015),
                        child: const Icon(Icons.add_circle_outline_outlined),
                      ),
                    ),
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
