import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class ApplianceDetailsPage1 extends StatelessWidget {
  const ApplianceDetailsPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          paddingTop: 0.0,
          backgroundColor: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CommonInput(
                topLabelText: 'Appliance Number',
                // marginBottom: 0.02,
              ),
              Stack(
                children: <Widget>[
                  CommonContainer(
                    onPress: () {},
                    size: 0.3,
                    marginTop: 0.02,
                    marginRight: 0.04,
                    backgroundColor: Colors.grey[400],
                    borderRadius: 0.02,
                    touchEffect: TouchableEffect(type: TouchTypes.opacity),
                    child: Center(
                      child: CircleContainer(
                        backgroundColor: Colors.transparent,
                        iconWidget: SvgPicture.asset(
                          iconImageAddLine,
                          color: Colors.blue[900],
                          height: 0.05.flexHeight,
                          width: 0.05.flexWidth,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 15,
                        child: SvgPicture.asset(
                          iconClose,
                          color: Colors.white,
                          height: 0.016.flexHeight,
                          width: 0.016.flexWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              0.01.ph,
              const Divider(
                color: Colors.white,
                thickness: 3,
              ),
              const CustomSelectContainer(
                title: 'Appliance Description',
                // value:
                //     controller.childCircuitData[formKeyCircuitDesignationA],
                // onTap: () => Get.bottomSheet(
                //   DBSelectSheet(
                //     listTitles: list.listCircuitDesignation,
                //     keyOfValue: formKeyCircuitDesignationA,
                //     controller: controller,
                //     isChilde: true,Polarity
                //   ),
                // ),
                marginTop: 0.0,
                marginBottom: 0.016,
              ),
              const CommonInput(
                topLabelText: 'Appliance Location',
                marginBottom: 0.016,
              ),
              const Divider(
                color: Colors.white,
                thickness: 3,
              ),
              0.014.ph,
              const SmallInputField(
                title: 'Appliance Class',
                // value: controller.childCircuitData[formKeyTypeOfWiringA],
                // onTap: () => Get.bottomSheet(
                //   DBSelectSheet(
                //     listTitles: list.listTypeOfWiring,
                //     keyOfValue: formKeyTypeOfWiringA,
                //     controller: controller,
                //     isChilde: true,
                //   ),
                // ),
                isInputSelection: true,
                width: 0.5,
              ),
              const SmallInputField(
                title: 'Formal Visual Inspection',
                // value: controller.childCircuitData[formKeyTypeOfWiringA],
                // onTap: () => Get.bottomSheet(
                //   DBSelectSheet(
                //     listTitles: list.listTypeOfWiring,
                //     keyOfValue: formKeyTypeOfWiringA,
                //     controller: controller,
                //     isChilde: true,
                //   ),
                // ),
                isInputSelection: true,
                width: 0.5,
              ),
              const SmallInputField(
                title: 'Combined Inspection & Test',
                // value: controller.childCircuitData[formKeyTypeOfWiringA],
                // onTap: () => Get.bottomSheet(
                //   DBSelectSheet(
                //     listTitles: list.listTypeOfWiring,
                //     keyOfValue: formKeyTypeOfWiringA,
                //     controller: controller,
                //     isChilde: true,
                //   ),
                // ),
                isInputSelection: true,
                width: 0.5,
              ),
              const FormToggleButton(
                title: 'Polarity',
                toggleType: FormToggleType.passFailed,
                titleSize: fontTitle,

                // value: controller.childCircuitData[formKeyPolarityG],
                // onChangeValue: (dynamic value) {
                //   controller.onChangeChildeDbValues(
                //       formKeyPolarityG, value);
                // },
                textWidth: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
