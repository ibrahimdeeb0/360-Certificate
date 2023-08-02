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
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: Get.back,
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            backgroundColor: Colors.white,
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
                          elevation: 0.0,
                          DBSelectBT(
                            listTitles: controller.listDbRef,
                            keyOfValue: formKeyDBRef,
                            controller: controller,
                          ),
                          isScrollControlled: true,
                        ),
                        width: 0.65,
                        marginBottom: 0.02,
                      ),
                      Image.asset(
                        imageDBElectrical,
                        width: DEVICE_WIDTH * 0.23,
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
                    suffix: const CommonText(
                      'KA',
                      fontColor: Colors.grey,
                      fontSize: fontH3,
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  CustomSelectContainer(
                    title: 'Main Switch Type BSEN Reference',
                    value: controller
                        .parentDistrBoardData[formKeyBoardMainSwitchTypeBS],
                    onTap: () => Get.bottomSheet(
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listTypeBSEN,
                        keyOfValue: formKeyBoardMainSwitchTypeBS,
                        controller: controller,
                      ),
                      isScrollControlled: true,
                    ),
                  ),
                  SmallInputField(
                    title: 'Rating',
                    value: controller.parentDistrBoardData[formKeyBoardRating],
                    onTap: () => Get.bottomSheet(
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listRating,
                        keyOfValue: formKeyBoardRating,
                        controller: controller,
                      ),
                      isScrollControlled: true,
                    ),
                    isInputSelection: true,
                    suffix: const CommonText(
                      'Amps',
                      fontColor: Colors.grey,
                      fontSize: fontH4,
                      marginRight: 0.01,
                    ),
                  ),
                  SmallInputField(
                    title: 'Supply Conductors',
                    value: controller
                        .parentDistrBoardData[formKeyBoardSupplyConductors],
                    onTap: () => Get.bottomSheet(
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listSupplyConductors,
                        keyOfValue: formKeyBoardSupplyConductors,
                        controller: controller,
                      ),
                      isScrollControlled: true,
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
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listEarth,
                        keyOfValue: formKeyBoardEarth,
                        controller: controller,
                      ),
                      isScrollControlled: true,
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
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listLocations,
                        keyOfValue: formKeyBoardLocation,
                        controller: controller,
                      ),
                      isScrollControlled: true,
                    ),
                  ),
                  FormToggleButton(
                    title: 'Phase Sequence Confirmed',
                    value: controller
                        .parentDistrBoardData[formKeyBoardPhaseSequence],
                    onChangeValue: (dynamic value) {
                      controller.onChangeParentDbValues(
                          formKeyBoardPhaseSequence, value);
                    },
                    toggleType: FormToggleType.multi,
                  ),
                  SmallInputField(
                    title: 'Supplied From',
                    value: controller
                        .parentDistrBoardData[formKeyBoardSuppliedFrom],
                    onTap: () => Get.bottomSheet(
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listSuppliedFrom,
                        keyOfValue: formKeyBoardSuppliedFrom,
                        controller: controller,
                      ),
                      isScrollControlled: true,
                    ),
                    isInputSelection: true,
                  ),
                  SmallInputField(
                    title: 'No. Of Phases',
                    value:
                        controller.parentDistrBoardData[formKeyBoardNoOfPhases],
                    onTap: () => Get.bottomSheet(
                      elevation: 0.0,
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
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listBSEN,
                        keyOfValue: formKeyBoardSupplyProtectiveDeviceType,
                        controller: controller,
                      ),
                      isScrollControlled: true,
                    ),
                  ),
                  SmallInputField(
                    title: 'Rating',
                    value: controller.parentDistrBoardData[formKeyBoardRating2],
                    onTap: () => Get.bottomSheet(
                      elevation: 0.0,
                      DBSelectBT(
                        listTitles: controller.listRatingBSEN,
                        keyOfValue: formKeyBoardRating2,
                        controller: controller,
                      ),
                      isScrollControlled: true,
                    ),
                    isInputSelection: true,
                    suffix: const CommonText(
                      'Amps',
                      fontColor: Colors.grey,
                      fontSize: fontH3,
                      marginRight: 0.01,
                    ),
                  ),
                  // SPD Details

                  CommonText(
                    'SPD Details: ',
                    containerStyle: const CommonContainerModel(
                      marginBottom: 0.01,
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    rightChild: CommonText(
                      controller.parentDistrBoardData[formKeyBoardSPDDetails],
                      marginHorizontal: 0.015,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CommonContainer(
                    borderRadius: 0.02,
                    clipBehavior: Clip.hardEdge,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          ...controller.spdDetails.map(
                            (dynamic item) => CommonButton(
                              text: item[keyName],
                              onPress: () =>
                                  controller.onChangeSpdValue(item[keyName]),
                              width: 0.15,
                              height: 0.05,
                              backgroundColor: Colors.grey[300],
                              fontColor: Colors.black,
                              borderRadius: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
