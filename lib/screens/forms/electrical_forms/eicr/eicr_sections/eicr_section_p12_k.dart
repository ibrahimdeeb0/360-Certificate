import '../../../../../general_exports.dart';

class EICRSectionKPart1 extends StatelessWidget {
  const EICRSectionKPart1({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CommonText(
                    '1.0. Condition and Adequacy of Distributors or Supply in Take',
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    containerStyle: CommonContainerModel(
                      width: 0.7,
                    ),
                    bottomChild: SizedBox(),
                  ),
                  CommonButton(
                    text: 'Notes',
                    // style: appButtonStyles.bgGreyTextPrimaryStyle,
                    width: 0.2,
                    height: 0.04,
                    borderRadius: 0.015,
                    backgroundColor: Colors.grey[200],
                    fontColor: AppColors.primary,
                    onPress: () => formsDialog(
                      title: 'Notes',
                      description:
                          "NOTE 1: Where inadequacies in the intake equipment are encountered,which may result in a dangerous or potentially dangerous situation,the person ordering the work and/or duty holder must be informed. It is strongly recommended that the person ordering the work informs the appropriate authority.\n\nNOTE 2: For this section only,where inadequacies are found, an 'X' should be put against the appropriate item and a comment made in Section K",
                    ),
                  ),
                ],
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.025),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[0][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[0][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[0]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[0][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '3.0. ',
                text:
                    'Earthing and Bounding Arrangements \n(411.3; Chapter 54)',
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.025),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[1][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[1][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[1]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                        formList.listRenderWidgets[1][keyData][index][formKey],
                        value);
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Part12Title extends StatelessWidget {
  const Part12Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonContainer(
      backgroundColor: Colors.white,
      width: 1,
      paddingHorizontal: 0.03,
      paddingVertical: 0.015,
      marginBottom: 0.02,
      child: CustomTextFormTitle(
        leftText: 'Part 12. ',
        text: 'Inspection Schedule',
      ),
    );
  }
}

class EICRSectionKPart2 extends StatelessWidget {
  const EICRSectionKPart2({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '4.0.',
                text: 'Consumer Unit Or Distribution Board',
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.025),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[2][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[2][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[2]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[2][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EICRSectionKPart3 extends StatelessWidget {
  const EICRSectionKPart3({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              SizedBox(height: DEVICE_HEIGHT * 0.01),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[3][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[3][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[3]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[3][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EICRSectionKPart4 extends StatelessWidget {
  const EICRSectionKPart4({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '5.0.',
                text: ' Final Circuits',
              ),
              SizedBox(height: DEVICE_HEIGHT * 0.025),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[4][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[4][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[4]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[4][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EICRSectionKPart5 extends StatelessWidget {
  const EICRSectionKPart5({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '5.12.',
                text:
                    ' Provision of Additional Requirement for Protection By RCD Not Exceeding 30 mA',
                fontSize: fontBody,
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.025,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[5][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[5][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[5]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[5][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EICRSectionKPart6 extends StatelessWidget {
  const EICRSectionKPart6({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '5.17. ',
                text:
                    'Termination Of Cables At Enclosures - Indicate Extent Of Sampling in Extent And Limitations in section C on this Report (Section 526)',
                fontSize: fontH4,
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.025,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[6][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[6][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[6]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[6][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EICRSectionKPart7 extends StatelessWidget {
  const EICRSectionKPart7({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const Part12Title(),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '6.0. ',
                text: ' Location(s) Containing A Bath or Shower',
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.025,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[7][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => FormToggleButton(
                  title: formList.listRenderWidgets[7][keyData][index]
                      [keyTitle],
                  value: controller.gazSafetyData[formList.listRenderWidgets[7]
                      [keyData][index][formKey]],
                  onChangeValue: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[7][keyData][index][formKey],
                      value,
                    );
                  },
                  titleSize: fontBody,
                  toggleType: FormToggleType.multi,
                ),
              ),
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '7.0. ',
                text: 'Other Part Special Installations or Locations',
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.025,
              ),
              FormToggleButton(
                title:
                    '7.1. List All Other Special Installation or Locations Present, If any. (Record Separately The Results Of Particular Inspections Applied on Next Page)',
                value: controller.gazSafetyData[formKey7_1],
                onChangeValue: (dynamic value) {
                  controller.onChangeFormDataValue(formKey7_1, value);
                },
                titleSize: 13.0,
                toggleType: FormToggleType.multi,
              ),
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              const CustomTextFormTitle(
                leftText: '8.0. ',
                text: "Presumer's Low Voltage Electrical Installation (s )",
              ),
              SizedBox(
                height: DEVICE_HEIGHT * 0.025,
              ),
              FormToggleButton(
                title:
                    '8.1. Where The Installation Includes Additional Requirements and Recommendations Relating to Chapter 82, Additional Inspection Items Should be Added to The Checklist',
                value: controller.gazSafetyData[formKey8_1],
                onChangeValue: (dynamic value) {
                  controller.onChangeFormDataValue(formKey8_1, value);
                },
                titleSize: 13.0,
                toggleType: FormToggleType.multi,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
