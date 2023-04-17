import '../../../../../general_exports.dart';

class DBScreen extends StatelessWidget {
  const DBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DBController>(
      init: DBController(),
      builder: (DBController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: controller.selectedParentDistrBoardData?[
                parentDistributionBoardValues][formKeyDBRef],
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
                  CommonText(
                    'Distribution Board Details',
                    fontColor: AppColors.textGrey,
                    fontWeight: FontWeight.w500,
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                    containerStyle:
                        const CommonContainerModel(marginBottom: 0.01),
                  ),
                  ViewDBDetails(
                    onPressDBContainer: () => Get.to(
                      () => const DBrdDetails(),
                      transition: Transition.leftToRightWithFade,
                    ),
                    dbName: controller.selectedParentDistrBoardData?[
                        parentDistributionBoardValues][formKeyDBRef],
                    //
                    locationName: controller.selectedParentDistrBoardData?[
                                    parentDistributionBoardValues]
                                [formKeyBoardLocation] ==
                            ''
                        ? ''
                        : 'Location: ${controller.selectedParentDistrBoardData?[parentDistributionBoardValues][formKeyBoardLocation]}',
                    //
                    zsName: controller.selectedParentDistrBoardData?[
                                    parentDistributionBoardValues]
                                [formKeyZsAtThisBoard] ==
                            ''
                        ? ''
                        : 'Zs: ${controller.selectedParentDistrBoardData?[parentDistributionBoardValues][formKeyZsAtThisBoard]}',
                    //
                    ipfName: controller.selectedParentDistrBoardData?[
                                    parentDistributionBoardValues]
                                [formKeyBoardIpfBoard] ==
                            ''
                        ? ''
                        : 'Ipf: ${controller.selectedParentDistrBoardData?[parentDistributionBoardValues][formKeyBoardIpfBoard]}',
                  ),
                  CommonText(
                    'Circuits and Test Result',
                    fontColor: AppColors.textGrey,
                    fontWeight: FontWeight.w500,
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                    containerStyle: const CommonContainerModel(
                      marginBottom: 0.01,
                      marginTop: 0.03,
                    ),
                  ),
                  ...controller
                      .selectedParentDistrBoardData?[listChildCircuitData]
                      .map(
                        (dynamic item) => ViewCircuitsDetails(
                          showDeleteIcon: !(controller
                                  .selectedParentDistrBoardData?[
                                      listChildCircuitData]
                                  .length ==
                              1),
                          onPressDelete: () =>
                              controller.onDeleteChildeDbValues(item),
                          onPressDBContainer: () {
                            controller.selectedChildCircuitData = item;

                            controller.resetChildValues();
                            controller.setChildeValues();
                            Get.to(
                              () => const CircuitP1(),
                              transition: Transition.leftToRightWithFade,
                            );
                          },
                          circuitName:
                              'circuit: ${item['circuit_reference_a']}',
                          locationName: item['circuit_designation_a'],
                          isComplete: item['mark_as_completed'],
                        ),
                      )
                      .toList(),
                  CommonButton(
                    onPress: () {
                      controller.resetChildValues();
                      controller.onCreateChildeCircuit();
                    },
                    height: 0.05,
                    marginVertical: 0.02,
                    child: CommonText(
                      'Add New Circuits and Test Result',
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
