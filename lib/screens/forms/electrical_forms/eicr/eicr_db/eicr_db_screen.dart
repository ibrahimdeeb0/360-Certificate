import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class DistributionBoardScreen extends StatelessWidget {
  const DistributionBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionBoardController>(
      init: DistributionBoardController(),
      builder: (DistributionBoardController controller) {
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
                      () => const DistributionBoardDetails(),
                      transition: Transition.rightToLeftWithFade,
                    ),
                    dbName: controller.selectedParentDistrBoardData?[
                        parentDistributionBoardValues][formKeyDBRef],
                    //
                    locationName: controller.selectedParentDistrBoardData?[
                                    parentDistributionBoardValues]
                                [formKeyBoardLocation] ==
                            ''
                        ? ''
                        : 'Location: ${controller.selectedParentDistrBoardData?[parentDistributionBoardValues][formKeyBoardLocation] ?? ''}',
                    //
                    zsName: controller.selectedParentDistrBoardData?[
                                    parentDistributionBoardValues]
                                [formKeyZsAtThisBoard] ==
                            ''
                        ? ''
                        : 'Zs: ${controller.selectedParentDistrBoardData?[parentDistributionBoardValues][formKeyZsAtThisBoard] ?? ''}',
                    //
                    ipfName: controller.selectedParentDistrBoardData?[
                                    parentDistributionBoardValues]
                                [formKeyBoardIpfBoard] ==
                            ''
                        ? ''
                        : 'Ipf: ${controller.selectedParentDistrBoardData?[parentDistributionBoardValues][formKeyBoardIpfBoard] ?? ''}',
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
                              () => const CircuitDetailsP0(),
                              transition: Transition.rightToLeftWithFade,
                            );
                          },
                          circuitName: 'circuit: ${item['id']}',
                          locationName: item['circuit_designation_a'],
                          isComplete: item['mark_as_completed'] == true,
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

class ViewDBDetails extends StatelessWidget {
  const ViewDBDetails({
    Key? key,
    this.dbName,
    this.locationName,
    this.zsName,
    this.ipfName,
    this.onPressDBContainer,
  }) : super(key: key);

  final String? dbName;
  final String? locationName;
  final String? zsName;
  final String? ipfName;
  final Function? onPressDBContainer;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPressDBContainer?.call,
      style: CommonContainerModel(
        backgroundColor: Color(AppColors.grey).withOpacity(0.1),
        width: 1,
        borderRadius: 0.02,
        paddingTop: 0.015,
        paddingBottom: 0.015,
        paddingHorizontal: 0.03,
        borderWidth: 1,
        borderColor: AppColors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            imageDBElectrical,
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
                  dbName ?? 'DB1',
                  style: appTextStyles.h2StyleBlack().copyWith(
                        fontWeight: FontWeight.w500,
                        fontColor: Color(AppColors.colorBlack).withOpacity(0.8),
                        textAlign: TextAlign.start,
                      ),
                ),
                CommonText(
                  locationName ?? 'Location:',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                        fontColor: AppColors.textGrey,
                      ),
                ),
                CommonText(
                  zsName ?? 'Zs :',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                        fontColor: AppColors.textGrey,
                      ),
                ),
                CommonText(
                  ipfName ?? 'Ipf :',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                        fontColor: AppColors.textGrey,
                      ),
                ),
              ],
            ),
          ),
          const SvgIconHelper(
            iconPath: iconArrowGo,
            color: Colors.black,
            width: 16.0,
            height: 16.0,
          ),
        ],
      ),
    );
  }
}

class ViewCircuitsDetails extends StatelessWidget {
  const ViewCircuitsDetails({
    Key? key,
    this.circuitName,
    this.locationName,
    this.onPressDBContainer,
    this.onPressDelete,
    this.showDeleteIcon = true,
    this.isComplete = false,
    this.iconPath,
  }) : super(key: key);

  final String? circuitName;
  final String? locationName;

  final Function? onPressDBContainer;
  final Function()? onPressDelete;
  final bool showDeleteIcon;
  final bool isComplete;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPressDBContainer?.call,
      style: CommonContainerModel(
        backgroundColor: Color(AppColors.grey).withOpacity(0.1),
        width: 1,
        borderRadius: 0.02,
        marginBottom: 0.016,
        paddingTop: 0.01,
        paddingBottom: 0.015,
        paddingRight: 0.03,
        paddingLeft: 0.02,
        borderColor: AppColors.grey,
        touchEffect: TouchableEffect(type: TouchTypes.opacity),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (iconPath == null)
            Image.asset(
              imageCircuitElectrical,
              width: DEVICE_WIDTH * 0.08,
              height: DEVICE_HEIGHT * 0.06,
            )
          else
            SvgPicture.asset(
              iconPath ?? iconPlug,
              width: DEVICE_WIDTH * 0.15,
              height: DEVICE_HEIGHT * 0.06,
            ),
          CommonContainer(
            style: const CommonContainerModel(
              width: 0.6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText(
                  circuitName ?? '_',
                  style: appTextStyles.h2StyleBlack().copyWith(
                        fontWeight: FontWeight.w500,
                        fontColor: Color(AppColors.colorBlack).withOpacity(0.8),
                        textAlign: TextAlign.start,
                      ),
                ),
                CommonText(
                  locationName ?? '_',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                        fontColor: AppColors.textGrey,
                      ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Visibility(
                visible: showDeleteIcon,
                child: IconButton(
                  onPressed: onPressDelete?.call,
                  icon: CommonContainer(
                    boxShape: BoxShape.circle,
                    borderWidth: 1,
                    borderColor: Colors.red,
                    child: Icon(
                      Icons.close_rounded,
                      color: Color(AppColors.red),
                      size: ((DEVICE_HEIGHT * 0.018) + (DEVICE_WIDTH * 0.018)),
                    ),
                  ),
                ),
              ),
              if (showDeleteIcon) 0.016.boxHeight,
              Visibility(
                visible: isComplete,
                child: Icon(
                  Icons.task_alt_rounded,
                  color: Color(AppColors.primary),
                  size: ((DEVICE_WIDTH * 0.017) + (DEVICE_HEIGHT * 0.017)),
                ),
              ),
              Visibility(
                visible: !isComplete,
                child: SvgIconHelper(
                  iconPath: iconArrowGo,
                  color: Colors.grey,
                  width: DEVICE_WIDTH * 0.014,
                  height: DEVICE_HEIGHT * 0.014,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
