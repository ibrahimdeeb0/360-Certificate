import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class EICRSectionI extends StatelessWidget {
  const EICRSectionI({required this.controller, super.key});

  final EicrController controller;
  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return CommonContainer(
      style: appContainerStyles.formSectionsStyle,
      child: Column(
        children: <Widget>[
          const CustomTextFormTitle(
            leftText: 'Part 9. ', //I
            text: 'Main Switch/Switch-Fuse/Circuit Breaker/RCD',
          ),
          CustomSelectContainer(
            title: 'Type BS (EN)',
            value: controller.gazSafetyData[formKeyTypeBsI],
            hint: 'Answer',
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listTypeBS,
                keyOfValue: formKeyTypeBsI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
          ),
          SmallInputField(
            title: 'No. of Poles',
            value: controller.gazSafetyData[formKeyNoPolesI],
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listNumOfPoles,
                keyOfValue: formKeyNoPolesI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            isInputSelection: true,
            marginBottom: 0.02,
          ),
          CustomSelectContainer(
            title: 'Supply Conductor Material',
            value: controller.gazSafetyData[formKeySupplyConductorMaterialI],
            hint: 'Answer',
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listConductorMaterial,
                keyOfValue: formKeySupplyConductorMaterialI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            marginTop: 0.0,
          ),
          SmallInputField(
            title: 'Supply Conductor CSA',
            value: controller.gazSafetyData[formKeySupplyConductorCsaI],
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listConductorCSA,
                keyOfValue: formKeySupplyConductorCsaI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            isInputSelection: true,
            suffix: SvgPicture.asset(
              iconMM,
              width: DEVICE_WIDTH * 0.016,
              height: DEVICE_HEIGHT * 0.016,
            ),
          ),
          SmallInputField(
            title: 'Voltage Rating',
            value: controller.gazSafetyData[formKeyVoltageRatingI],
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listNominalVoltage,
                keyOfValue: formKeyVoltageRatingI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            isInputSelection: true,
          ),
          SmallInputField(
            title: 'Rated Current',
            value: controller.gazSafetyData[formKeyRatedCurrentI],
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listRatedCurrentI,
                keyOfValue: formKeyRatedCurrentI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            isInputSelection: true,
          ),
          CommonText(
            'If RCD Main Switch',
            style: appTextStyles.h2StyleBlack().copyWith(
                  fontWeight: FontWeight.w500,
                  rowMainAxisSize: MainAxisSize.max,
                  textAlign: TextAlign.start,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                ),
            containerStyle: CommonContainerModel(
              backgroundColor: Color(AppColors.grey).withOpacity(0.2),
              borderRadius: 0.015,
              paddingHorizontal: 0.02,
              marginTop: 0.025,
              marginBottom: 0.02,
              paddingVertical: 0.006,
            ),
          ),
          SmallInputField(
            title: 'RCD Operation Current',
            value: controller.gazSafetyData[formKeyRcdOperationCurrentI],
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listRCDOperationCurrent,
                keyOfValue: formKeyRcdOperationCurrentI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            isInputSelection: true,
          ),
          SmallInputField(
            title: 'Rated Time Delay',
            value: controller.gazSafetyData[formKeyRatedTimeDelayI],
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listRatedTimeDelay,
                keyOfValue: formKeyRatedTimeDelayI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            isInputSelection: true,
            suffix: CommonText(
              'mS',
              style: appTextStyles.h3GreyStyle(),
            ),
          ),
          SmallInputField(
            title: 'RCD Operation Time',
            value: controller.gazSafetyData[formKeyRcdOperationTimeI],
            hint: '',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.go,
            onTap: () => Get.bottomSheet(
              EICRSelectBT(
                listTitles: formList.listRatedCurrentI,
                keyOfValue: formKeyRcdOperationTimeI,
                controller: controller,
              ),
              elevation: 0.0,
            ),
            suffix: CommonText(
              'mS',
              style: appTextStyles.h3GreyStyle(),
            ),
            isInputSelection: true,
          ),
        ],
      ),
    );
  }
}
