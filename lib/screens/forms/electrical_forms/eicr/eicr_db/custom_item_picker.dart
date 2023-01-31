import 'package:flutter/cupertino.dart';

import '../../../../../general_exports.dart';

class CustomItemPicker extends StatelessWidget {
  const CustomItemPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DistributionBoardController>(
      init: DistributionBoardController(),
      builder: (DistributionBoardController controller) {
        return BottomSheetContainer(
          title: 'Select Circuit Reference',
          height: 0.46,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CommonContainer(
                    width: 0.45,
                    height: 0.3,
                    child: CupertinoPicker(
                      magnification: 1.5,
                      backgroundColor: Color(AppColors.white),
                      itemExtent: 30, //height of each item
                      onSelectedItemChanged: controller.onChangCircuitNum,
                      children: <Widget>[
                        ...controller.listNumbers
                            .map(
                              (int num) => CommonText(
                                '$num',
                                style: appTextStyles.h3StyleBlack().copyWith(
                                      rowMainAxisAlignment:
                                          MainAxisAlignment.center,
                                      columnMainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  CommonContainer(
                    width: 0.45,
                    height: 0.3,
                    child: CupertinoPicker(
                      magnification: 1.5,
                      backgroundColor: Color(AppColors.white),
                      itemExtent: 30, //height of each item
                      onSelectedItemChanged: controller.onChangCircuitType,
                      children: <Widget>[
                        ...controller.listCircuitReference
                            .map(
                              (String item) => CommonText(
                                item,
                                style: appTextStyles.h3StyleBlack()
                                  ..copyWith(
                                    rowMainAxisAlignment:
                                        MainAxisAlignment.center,
                                    columnMainAxisAlignment:
                                        MainAxisAlignment.center,
                                  ),
                                containerStyle: const CommonContainerModel(
                                    marginTop: 0.005),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
              CommonButton(
                onPress: () => controller.onSelectCircuitReference(),
                text: 'Select',
                marginTop: 0.01,
                marginBottom: 0.014,
              ),
            ],
          ),
        );
      },
    );
  }
}
