import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class CircuitP2 extends StatelessWidget {
  const CircuitP2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DomesticEicLists list = DomesticEicLists();
    return GetBuilder<DBController>(
      init: DBController(),
      builder: (DBController controller) {
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
                    onTap: () {
                      controller.circuitNumIndex = 0;
                      controller.circuitTypeIndex = 0;
                      controller.update();
                      Get.bottomSheet(
                        CustomItemPicker(
                          controller: Get.find<DBController>(),
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
                  DBSelectSheet(
                    listTitles: list.listCircuitDesignation,
                    keyOfValue: formKeyCircuitDesignationA,
                    controller: controller,
                    isChilde: true,
                  ),
                  isScrollControlled: true,
                ),
                marginTop: 0.0,
              ),
              SmallInputField(
                title: 'Type of Wiring',
                value: controller.childCircuitData[formKeyTypeOfWiringA],
                onTap: () => Get.bottomSheet(
                  DBSelectSheet(
                    listTitles: list.listTypeOfWiring,
                    keyOfValue: formKeyTypeOfWiringA,
                    controller: controller,
                    isChilde: true,
                  ),
                  isScrollControlled: true,
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
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listConductorLive,
                          keyOfValue: formKeyLiveB,
                          controller: controller,
                          isChilde: true,
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
                      title: 'CPC',
                      value: controller.childCircuitData[formKeyCpcB],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listConductorCSA,
                          keyOfValue: formKeyCpcB,
                          controller: controller,
                          isChilde: true,
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
                      title: 'Max Disconnection Time Permitted',
                      value: controller
                          .childCircuitData[formKeyMaxDisconnectionTimeB],
                      keyboardType: TextInputType.number,
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listMaxDiscTime,
                          keyOfValue: formKeyMaxDisconnectionTimeB,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
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
                      marginBottom: 0.02,
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listTypeBSEN2,
                          keyOfValue: formKeyTypeBsC,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
                      ),
                    ),
                    SmallInputField(
                      title: 'Type',
                      value: controller.childCircuitData[formKeyTypeC],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listTypeCurrentDevice,
                          keyOfValue: formKeyTypeC,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Rating A',
                      value: controller.childCircuitData[formKeyRatingC],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listRatingBSEN,
                          keyOfValue: formKeyRatingC,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Short Circuit Capacity ',
                      value: controller.childCircuitData[formKeyShortCircuitC],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listShortCircuitCapacity,
                          keyOfValue: formKeyShortCircuitC,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
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
                      marginBottom: 0.02,
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listTypeBSEN2,
                          keyOfValue: formKeyTypeBsD,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
                      ),
                    ),
                    SmallInputField(
                      title: 'Type',
                      value: controller.childCircuitData[formKeyTypeD],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listTypeRCD,
                          keyOfValue: formKeyTypeD,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'RCD at IΔn ',
                      value: controller.childCircuitData[formKeyRcdD],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listRCDAtDelta,
                          keyOfValue: formKeyRcdD,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
                      ),
                      isInputSelection: true,
                    ),
                    SmallInputField(
                      title: 'Rating A',
                      value: controller.childCircuitData[formKeyRatingD],
                      onTap: () => Get.bottomSheet(
                        DBSelectSheet(
                          listTitles: list.listRatingBSEN,
                          keyOfValue: formKeyRatingD,
                          controller: controller,
                          isChilde: true,
                        ),
                        isScrollControlled: true,
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
