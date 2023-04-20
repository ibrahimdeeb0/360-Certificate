import '../../../../../general_exports.dart';

class DomesticEicPage4 extends StatelessWidget {
  const DomesticEicPage4({super.key});

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
                    leftText: 'Part 7. ',
                    text: 'PARTICULARS OF INSTALLATION AT THE ORIGIN',
                    marginBottom: 0.02,
                    marginLeft: 0.03,
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        CommonText(
                          'Means of earthing',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                          marginBottom: 0.02,
                        ),
                        FormToggleButton(
                          title: "Distributor's facility",
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                        ),
                        FormToggleButton(
                          title: 'Installation earth electrode',
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
                        CommonText(
                          'Details of installation Earth  \n Electrode (where applicable)',
                          fontWeight: FontWeight.bold,
                          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                          rowMainAxisSize: MainAxisSize.max,
                          rightChild: IconButton(
                            onPressed: () {
                              formsDialog(
                                title: 'Earth Electrode',
                                description:
                                    'values above 200 Q may not be stable, as soil conditions change due to factors such as soil drying and freezing',
                              );
                            },
                            icon: Icon(
                              Icons.info_outline,
                              color: Color(AppColors.primary),
                            ),
                          ),
                          containerStyle:
                              const CommonContainerModel(marginBottom: 0.02),
                        ),
                        const CommonInput(
                          topLabelText: 'Type (e.g. rods, tape etc...)',
                          hint: 'N/A',
                          marginBottom: 0.015,
                        ),
                        const CommonInput(
                          topLabelText: 'Location',
                          hint: 'N/A',
                          marginBottom: 0.015,
                        ),
                        SmallInputField(
                          title: 'Electrode resistance, RA',
                          hint: 'N/A',
                          width: 0.5,
                          suffix: CommonText(
                            'Ω',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                        ),
                        const CommonInput(
                          topLabelText: 'Method of measurement',
                          hint: 'N/A',
                          marginBottom: 0.015,
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorder,
                    child: Column(
                      children: const <Widget>[
                        SmallInputField(
                          title: 'Measured Ze Ω',
                          hint: 'N/A',
                          width: 0.5,
                        ),
                        SmallInputField(
                          title: 'Maximum Demand (Load)',
                          hint: 'N/A',
                          width: 0.5,
                        ),
                        SmallInputField(
                          title: 'Number of smoke alarms',
                          hint: 'N/A',
                          width: 0.5,
                          isInputSelection: true,
                        ),
                        CommonInput(
                          topLabelText:
                              'Protective measures for fault protection',
                          marginBottom: 0.02,
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
