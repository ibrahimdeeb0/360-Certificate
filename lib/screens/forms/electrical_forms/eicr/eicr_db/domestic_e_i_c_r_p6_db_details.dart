import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class DistributionBoardDetails extends StatelessWidget {
  const DistributionBoardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionBoardController>(
      init: DistributionBoardController(),
      builder: (DistributionBoardController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: 'Board Details',
            // rightText: 'Done',
            // withActionText: true,
            // onPressActionText: Get.back,
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomSelectContainer(
                        title: 'DB Ref',
                        value: controller.parentDistrBoardData[formKeyDBRef],
                        hint: 'Answer',
                        onTap: () => Get.bottomSheet(
                          DBSelectBT(
                            listTitles: controller.listDbRef,
                            keyOfValue: formKeyDBRef,
                            controller: controller,
                          ),
                        ),
                        marginBottom: 0.02,
                      ),
                      Image.asset(
                        imageDBElectrical,
                        width: DEVICE_WIDTH * 0.19,
                        height: DEVICE_HEIGHT * 0.1,
                      ),
                    ],
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.01),
                  SmallInputField(
                    title: 'Zs at this Board',
                    value:
                        controller.parentDistrBoardData[formKeyZsAtThisBoard],
                    onChanged: (dynamic value) => controller
                        .onChangeParentDbValues(formKeyZsAtThisBoard, value),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  SmallInputField(
                    title: 'Ipf at this Board',
                    value:
                        controller.parentDistrBoardData[formKeyBoardIpfBoard],
                    onChanged: (dynamic value) => controller
                        .onChangeParentDbValues(formKeyBoardIpfBoard, value),
                    suffix: const CommonText('KA'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CustomSelectContainer(
                    title: 'Main Switch Type BSEN Reference',
                    value: controller
                        .parentDistrBoardData[formKeyBoardMainSwitchTypeBS],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listTypeBSEN,
                        keyOfValue: formKeyBoardMainSwitchTypeBS,
                        controller: controller,
                      ),
                    ),
                  ),
                  SmallInputField(
                    title: 'Rating',
                    value: controller.parentDistrBoardData[formKeyBoardRating],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listRating,
                        keyOfValue: formKeyBoardRating,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                    suffix: const CommonText('Amps'),
                  ),
                  SmallInputField(
                    title: 'Supply Conductors',
                    value: controller
                        .parentDistrBoardData[formKeyBoardSupplyConductors],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listSupplyConductors,
                        keyOfValue: formKeyBoardSupplyConductors,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                    suffix: SvgPicture.asset(
                      iconMM,
                      width: DEVICE_WIDTH * 0.016,
                      height: DEVICE_HEIGHT * 0.016,
                    ),
                  ),
                  SmallInputField(
                    title: 'Earth',
                    value: controller.parentDistrBoardData[formKeyBoardEarth],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listEarth,
                        keyOfValue: formKeyBoardEarth,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                    suffix: SvgPicture.asset(
                      iconMM,
                      width: DEVICE_WIDTH * 0.016,
                      height: DEVICE_HEIGHT * 0.016,
                    ),
                  ),
                  CustomSelectContainer(
                    title: 'Distribution Board Location',
                    value:
                        controller.parentDistrBoardData[formKeyBoardLocation],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listLocations,
                        keyOfValue: formKeyBoardLocation,
                        controller: controller,
                      ),
                    ),
                    marginBottom: 0.03,
                  ),
                  FormToggleButton(
                    title: 'Phase Sequence Confirmed',
                    value: controller
                        .parentDistrBoardData[formKeyBoardPhaseSequence],
                    onChangeValue: (dynamic value) {
                      controller.onChangeParentDbValues(
                          formKeyBoardPhaseSequence, value);
                    },
                  ),
                  SmallInputField(
                    title: 'Supplied From',
                    value: controller
                        .parentDistrBoardData[formKeyBoardSuppliedFrom],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listSuppliedFrom,
                        keyOfValue: formKeyBoardSuppliedFrom,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                  ),
                  SmallInputField(
                    title: 'No. Of Phases',
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listNoOfPhases,
                        keyOfValue: formKeyBoardNoOfPhases,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                  ),
                  CustomSelectContainer(
                    title: 'Supply Protective Device Type (BSEN)',
                    value: controller.parentDistrBoardData[
                        formKeyBoardSupplyProtectiveDeviceType],
                    hint: 'Answer',
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listBSEN,
                        keyOfValue: formKeyBoardSupplyProtectiveDeviceType,
                        controller: controller,
                      ),
                    ),
                    marginBottom: 0.03,
                  ),
                  SmallInputField(
                    title: 'Rating',
                    value: controller.parentDistrBoardData[formKeyBoardRating2],
                    onTap: () => Get.bottomSheet(
                      DBSelectBT(
                        listTitles: controller.listRatingBSEN,
                        keyOfValue: formKeyBoardRating2,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                    suffix: CommonText('Amps'),
                  ),
                  // SPD Details
                  CommonText(
                    'SPD Details: ',
                    rowMainAxisSize: MainAxisSize.max,
                    textAlign: TextAlign.start,
                    rightChild: CommonText(
                      controller.parentDistrBoardData['formKeyBoardSPDDetails'],
                      style: appTextStyles.h3StyleBlack().copyWith(
                            fontSize: fontBody,
                            fontFamily: 'outfitBold',
                          ),
                      containerStyle:
                          const CommonContainerModel(marginLeft: 0.02),
                    ),
                    bottomChild: CommonContainer(
                      backgroundColor:
                          Color(AppColors.textGrey).withOpacity(0.2),
                      width: 1,
                      borderRadius: 0.02,
                      marginTop: 0.01,
                      paddingVertical: 0.01,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CommonText(
                            onPress: () => controller.onChangeSpdValue('T1'),
                            'T1',
                            containerStyle: CommonContainerModel(
                              width: 0.15,
                              borderRightWidth: 0.6,
                              borderLeftColor: AppColors.textGrey,
                            ),
                          ),
                          CommonText(
                            'T2',
                            onPress: () => controller.onChangeSpdValue('T2'),
                            containerStyle: CommonContainerModel(
                              width: 0.15,
                              borderRightWidth: 0.6,
                              borderLeftColor: AppColors.textGrey,
                            ),
                          ),
                          CommonText(
                            'T3',
                            onPress: () => controller.onChangeSpdValue('T3'),
                            containerStyle: CommonContainerModel(
                              width: 0.15,
                              borderRightWidth: 0.6,
                              borderLeftColor: AppColors.textGrey,
                            ),
                          ),
                          CommonText(
                            'T1+T2',
                            onPress: () => controller.onChangeSpdValue('T1+T2'),
                            containerStyle: CommonContainerModel(
                              width: 0.15,
                              borderRightWidth: 0.6,
                              borderLeftColor: AppColors.textGrey,
                            ),
                          ),
                          CommonText(
                            'T2+T3',
                            onPress: () => controller.onChangeSpdValue('T2+T3'),
                            containerStyle: CommonContainerModel(
                              width: 0.15,
                              borderRightWidth: 0.6,
                              borderLeftColor: AppColors.textGrey,
                            ),
                          ),
                          CommonText(
                            'N/A',
                            onPress: () => controller.onChangeSpdValue('N/A'),
                            containerStyle: const CommonContainerModel(
                              width: 0.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
