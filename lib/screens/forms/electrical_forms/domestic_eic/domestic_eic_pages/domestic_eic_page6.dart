import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class DomesticEicPage6 extends StatelessWidget {
  const DomesticEicPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingBottom: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 9. ',
                    text: '',
                    marginBottom: 0.02,
                    marginLeft: 0.03,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CommonText(
                          'Earthing conductor',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                        ),
                        const CustomSelectContainer(
                          title: 'Conductor material',
                        ),
                        SmallInputField(
                          title: 'Conductor csa',
                          isInputSelection: true,
                          width: 0.5,
                          suffix: SvgPicture.asset(
                            iconMM,
                            width: DEVICE_WIDTH * 0.016,
                            height: DEVICE_HEIGHT * 0.016,
                          ),
                        ),
                        const FormToggleButton(
                          title: 'Continuity check',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CommonText(
                          'Main protective bonding conductors to extraneous conductive parts',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                          textAlign: TextAlign.start,
                        ),
                        const CustomSelectContainer(
                          title: 'Conductor material',
                        ),
                        SmallInputField(
                          title: 'Conductor csa',
                          width: 0.5,
                          isInputSelection: true,
                          suffix: SvgPicture.asset(
                            iconMM,
                            width: DEVICE_WIDTH * 0.016,
                            height: DEVICE_HEIGHT * 0.016,
                          ),
                        ),
                        const CustomSelectContainer(
                          title: 'Location (where not obvious)',
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        FormToggleButton(
                          title: 'Water installation pipes',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                        ),
                        FormToggleButton(
                          title: 'Gas installation pipes',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                        ),
                        FormToggleButton(
                          title: 'Oil installation pipes',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                        ),
                        FormToggleButton(
                          title: 'Structural steel',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                        ),
                        FormToggleButton(
                          title: '•Other services',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                          titleSize: fontTitle,
                        ),
                        CommonText(
                          '*List in remarks section',
                          fontSize: fontH4,
                        ),
                      ],
                    ),
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
