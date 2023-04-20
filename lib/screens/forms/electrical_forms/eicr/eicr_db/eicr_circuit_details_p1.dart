import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class CircuitDetailsP1 extends StatelessWidget {
  const CircuitDetailsP1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionBoardController>(
      init: DistributionBoardController(),
      builder: (DistributionBoardController controller) {
        return CommonContainer(
          paddingHorizontal: 0.04,
          child: Column(
            children: <Widget>[
              SizedBox(height: DEVICE_HEIGHT * 0.02),
              const CommonText(
                'Circuit Assistant',
                rowMainAxisSize: MainAxisSize.max,
                fontWeight: FontWeight.bold,
                containerStyle: CommonContainerModel(
                  marginBottom: 0.02,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomSelectContainer(
                    width: 0.7,
                    title: 'Circuit Reference',
                    value:
                        controller.childCircuitData[formKeyCircuitReferenceA],
                    hint: 'Answer',
                    onTap: () {
                      controller.circuitNumIndex = 0;
                      controller.circuitTypeIndex = 0;
                      controller.update();
                      Get.bottomSheet(
                        CustomItemPicker(
                          controller: Get.find<DistributionBoardController>(),
                        ),
                      );
                    },
                    marginBottom: 0.02,
                  ),
                  Image.asset(
                    imageCircuitElectrical,
                    width: DEVICE_WIDTH * 0.16,
                    height: DEVICE_HEIGHT * 0.07,
                  ),
                ],
              ),
              CustomSelectContainer(
                title: 'Circuit Designation',
                value: controller.childCircuitData[formKeyCircuitDesignationA],
                onTap: () => Get.bottomSheet(
                  DBSelectBT(
                    listTitles: controller.listCircuitDesignation,
                    keyOfValue: formKeyCircuitDesignationA,
                    controller: controller,
                    isChilde: true,
                  ),
                ),
                marginTop: 0.0,
              ),
              SmallInputField(
                title: 'Type of Wiring',
                value: controller.childCircuitData[formKeyTypeOfWiringA],
                hint: 'Answer',
                onTap: () => Get.bottomSheet(
                  DBSelectBT(
                    listTitles: controller.listTypeOfWiring,
                    keyOfValue: formKeyTypeOfWiringA,
                    controller: controller,
                    isChilde: true,
                  ),
                ),
                isInputSelection: true,
              ),
              SmallInputField(
                title: 'Reference Method',
                value: controller.childCircuitData[formKeyReferenceMethodA],
                keyboardType: TextInputType.text,
                onChanged: (dynamic value) => controller.onChangeChildeDbValues(
                    formKeyReferenceMethodA, value),
              ),
              SmallInputField(
                title: 'Number of Point Served',
                value: controller.childCircuitData[formKeyNumberOfPointA],
                onChanged: (dynamic value) => controller.onChangeChildeDbValues(
                    formKeyNumberOfPointA, value),
                keyboardType: TextInputType.number,
              ),
              // Section 2
              CommonContainer(
                style: appContainerStyles.topBottomBorderStyle
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  children: <Widget>[
                    const CommonText(
                      'Circuit Conductor',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(marginBottom: 0.015),
                    ),
                    SmallInputField(
                      title: 'Live',
                      value: controller.childCircuitData[formKeyLiveB],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listConductorLive,
                          keyOfValue: formKeyLiveB,
                          controller: controller,
                          isChilde: true,
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
                      title: 'CPC',
                      value: controller.childCircuitData[formKeyCpcB],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listConductorCSA,
                          keyOfValue: formKeyCpcB,
                          controller: controller,
                          isChilde: true,
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
                      title: 'Max Disconnection Time Permitted',
                      value: controller
                          .childCircuitData[formKeyMaxDisconnectionTimeB],
                      hint: 'Answer',
                      keyboardType: TextInputType.number,
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listMaxDiscTime,
                          keyOfValue: formKeyMaxDisconnectionTimeB,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                  ],
                ),
              ),
              // Section 3
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer,
                paddingHorizontal: 0.0,
                child: Column(
                  children: <Widget>[
                    const CommonText(
                      'Over Current Device',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(marginBottom: 0.015),
                    ),
                    CustomSelectContainer(
                      title: 'Type BS EN',
                      value: controller.childCircuitData[formKeyTypeBsC],
                      hint: 'Answer',
                      marginBottom: 0.02,
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listTypeBSEN2,
                          keyOfValue: formKeyTypeBsC,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                    ),
                    SmallInputField(
                      title: 'Type',
                      value: controller.childCircuitData[formKeyTypeC],
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listTypeCurrentDevice,
                          keyOfValue: formKeyTypeC,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Rating A',
                      value: controller.childCircuitData[formKeyRatingC],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listRatingBSEN,
                          keyOfValue: formKeyRatingC,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Short Circuit Capacity ',
                      value: controller.childCircuitData[formKeyShortCircuitC],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listShortCircuitCapacity,
                          keyOfValue: formKeyShortCircuitC,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Max Permitted Zs',
                      value: controller.childCircuitData[formKeyMaxPermittedC],
                      onChanged: (dynamic value) => controller
                          .onChangeChildeDbValues(formKeyMaxPermittedC, value),
                      suffix: const CommonText('Ω'),
                    ),
                  ],
                ),
              ),
              // Section 4
              CommonContainer(
                style: appContainerStyles.bottomBorderContainer
                    .copyWith(paddingHorizontal: 0.0),
                child: Column(
                  children: <Widget>[
                    const CommonText(
                      'RCD',
                      rowMainAxisSize: MainAxisSize.max,
                      fontWeight: FontWeight.bold,
                      containerStyle: CommonContainerModel(marginBottom: 0.015),
                    ),
                    CustomSelectContainer(
                      title: 'Type BS EN',
                      value: controller.childCircuitData[formKeyTypeBsD],
                      hint: 'Answer',
                      marginBottom: 0.02,
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listTypeBSEN2,
                          keyOfValue: formKeyTypeBsD,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                    ),
                    SmallInputField(
                      title: 'Type',
                      value: controller.childCircuitData[formKeyTypeD],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listTypeRCD,
                          keyOfValue: formKeyTypeD,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'RCD at IΔn ',
                      value: controller.childCircuitData[formKeyRcdD],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listRCDAtDelta,
                          keyOfValue: formKeyRcdD,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Rating A',
                      value: controller.childCircuitData[formKeyRatingD],
                      hint: 'Answer',
                      onTap: () => Get.bottomSheet(
                        DBSelectBT(
                          listTitles: controller.listRatingBSEN,
                          keyOfValue: formKeyRatingD,
                          controller: controller,
                          isChilde: true,
                        ),
                      ),
                      isInputSelection: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.03),
            ],
          ),
        );
      },
    );
  }
}
