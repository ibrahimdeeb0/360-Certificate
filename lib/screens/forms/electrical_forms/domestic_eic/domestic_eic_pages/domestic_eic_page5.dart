import '../../../../../general_exports.dart';

class DomesticEicPage5 extends StatelessWidget {
  const DomesticEicPage5({super.key});

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
                  CustomTextFormTitle(
                    leftText: 'Part 8. ',
                    text: 'Main Switch/Switch-Fuse/Circuit Breaker/RCD'
                        .toUpperCase(),
                    marginBottom: 0.02,
                    marginLeft: 0.03,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CustomSelectContainer(
                          title: 'Type BS (EN)',
                          width: 0.9,
                        ),
                        const SmallInputField(
                          title: 'No. of Poles',
                          isInputSelection: true,
                          marginBottom: 0.02,
                          width: 0.5,
                        ),
                        SmallInputField(
                          title: 'Voltage Rating',
                          isInputSelection: true,
                          suffix: CommonText(
                            'V',
                            style: appTextStyles.h3GreyStyle(),
                            fontWeight: FontWeight.bold,
                          ),
                          width: 0.5,
                        ),
                        const SmallInputField(
                          title: 'Rated Current',
                          isInputSelection: true,
                          width: 0.5,
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
                            backgroundColor:
                                Color(AppColors.grey).withOpacity(0.2),
                            borderRadius: 0.015,
                            paddingHorizontal: 0.02,
                            marginTop: 0.025,
                            marginBottom: 0.02,
                            paddingVertical: 0.006,
                          ),
                        ),
                        SmallInputField(
                          title: 'RCD Operation Current',
                          width: 0.5,
                          isInputSelection: true,
                          suffix: CommonText(
                            'mA',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                        ),
                        SmallInputField(
                          title: 'Rated Time Delay',
                          width: 0.5,
                          isInputSelection: true,
                          suffix: CommonText(
                            'mS',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                        ),
                        SmallInputField(
                          title: 'RCD Operation Time',
                          width: 0.5,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
                          suffix: CommonText(
                            'mS',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          isInputSelection: true,
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      children: const <Widget>[
                        CustomSelectContainer(
                          title: 'Supply conductor material',
                        ),
                        SmallInputField(
                          title: 'Supply conductor csa',
                          isInputSelection: true,
                          width: 0.5,
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
