import '../../../../../general_exports.dart';

class ApplianceDetailsPage1 extends StatelessWidget {
  const ApplianceDetailsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableAppliancesController>(
      builder: (PortableAppliancesController controller) {
        final ApplianceListValues list = ApplianceListValues();
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingTop: 0.0,
              backgroundColor: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  0.02.ph,
                  SmallInputField(
                    title: 'Appliance Number',
                    value: controller.applianceDetails[formKeyApplianceNumber],
                    onChanged: (dynamic value) => controller
                        .onChangeChildeValues(formKeyApplianceNumber, value),
                    width: 0.5,
                    marginBottom: 0.016,
                    keyboardType: TextInputType.number,
                  ),
                  CustomSelectContainer(
                    title: 'Appliance Description',
                    value: controller
                        .applianceDetails[formKeyApplianceDescription],
                    onTap: () => Get.bottomSheet(
                      ApplianceSelectSheet(
                        listTitles: list.listApplianceDescription,
                        keyOfValue: formKeyApplianceDescription,
                        controller: controller,
                        isChilde: true,
                      ),
                    ),
                    marginTop: 0.0,
                    marginBottom: 0.016,
                  ),
                  CustomSelectContainer(
                    title: 'Appliance Location',
                    marginTop: 0.0,
                    marginBottom: 0.016,
                    value:
                        controller.applianceDetails[formKeyApplianceLocation],
                    onTap: () => Get.bottomSheet(
                      ApplianceSelectSheet(
                        listTitles: list.listApplianceLocation,
                        keyOfValue: formKeyApplianceLocation,
                        controller: controller,
                        isChilde: true,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                  0.014.ph,
                  SmallInputField(
                    title: 'Appliance Class',
                    value: controller.applianceDetails[formKeyApplianceClass],
                    onTap: () => Get.bottomSheet(
                      ApplianceSelectSheet(
                        listTitles: list.listApplianceClass,
                        keyOfValue: formKeyApplianceClass,
                        controller: controller,
                        isChilde: true,
                      ),
                    ),
                    isInputSelection: true,
                    width: 0.5,
                  ),
                  SmallInputField(
                    title: 'Formal Visual Inspection',
                    value: controller.applianceDetails[formKeyFormalInspection],
                    onTap: () => Get.bottomSheet(
                      ApplianceSelectSheet(
                        listTitles: list.listApplianceInspection,
                        keyOfValue: formKeyFormalInspection,
                        controller: controller,
                        isChilde: true,
                      ),
                    ),
                    isInputSelection: true,
                    width: 0.5,
                  ),
                  SmallInputField(
                    title: 'Combined Inspection & Test',
                    value: controller
                        .applianceDetails[formKeyCombinedInspectionTest],
                    onTap: () => Get.bottomSheet(
                      ApplianceSelectSheet(
                        listTitles: list.listApplianceInspection,
                        keyOfValue: formKeyCombinedInspectionTest,
                        controller: controller,
                        isChilde: true,
                      ),
                    ),
                    isInputSelection: true,
                    width: 0.5,
                  ),
                  FormToggleButton(
                    title: 'Polarity',
                    toggleType: FormToggleType.passFailedNA,
                    titleSize: fontTitle,
                    value: controller.applianceDetails[formKeyPolarity],
                    onChangeValue: (dynamic value) {
                      controller.onChangeChildeValues(formKeyPolarity, value);
                    },
                    textWidth: 0.5,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// Stack(
                  //   children: <Widget>[
                  //     CommonContainer(
                  //       onPress: () {},
                  //       size: 0.3,
                  //       marginTop: 0.02,
                  //       marginRight: 0.04,
                  //       backgroundColor: Colors.grey[400],
                  //       borderRadius: 0.02,
                  //       touchEffect: TouchableEffect(type: TouchTypes.opacity),
                  //       child: Center(
                  //         child: CircleContainer(
                  //           backgroundColor: Colors.transparent,
                  //           iconWidget: SvgPicture.asset(
                  //             iconImageAddLine,
                  //             color: Colors.blue[900],
                  //             height: 0.05.flexHeight,
                  //             width: 0.05.flexWidth,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Positioned(
                  //       right: 0,
                  //       top: 0,
                  //       child: IconButton(
                  //         onPressed: () {},
                  //         icon: CircleAvatar(
                  //           backgroundColor: Colors.black87,
                  //           radius: 15,
                  //           child: SvgPicture.asset(
                  //             iconClose,
                  //             color: Colors.white,
                  //             height: 0.016.flexHeight,
                  //             width: 0.016.flexWidth,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // 0.01.ph,
                  // const Divider(
                  //   color: Colors.white,
                  //   thickness: 3,
                  // 
