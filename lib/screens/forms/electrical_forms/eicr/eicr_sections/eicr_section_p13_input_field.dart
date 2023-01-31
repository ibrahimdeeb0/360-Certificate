import '../../../../../general_exports.dart';

class EICRSectionInputField extends StatelessWidget {
  const EICRSectionInputField({
    required this.controller,
    super.key,
  });

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return Column(
      children: <Widget>[
        const CommonContainer(
          backgroundColor: Colors.white,
          width: 1,
          paddingHorizontal: 0.03,
          paddingVertical: 0.015,
          marginBottom: 0.02,
          child: CustomTextFormTitle(
            leftText: 'Part 13.  ',
            text:
                'Prosumers Low Voltage Installation/Other Special Installations Or Locations',
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionK12Style,
          child: Column(
            children: <Widget>[
              CommonText(
                "ENTER YOUR OWN INSPECTIONS HERE FOR THE *PROSUMER'SINSTALLATION AND OR OTHER SPECIAL INSTALLATIONS ORLOCATIONS IF APPLICABLE.",
                style: appTextStyles.h4GreyMediumStyle().copyWith(
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                    ),
                containerStyle: const CommonContainerModel(
                  width: 1,
                  marginBottom: 0.025,
                ),
                bottomChild: CommonText(
                  "*Including local production and/or storage of energy in order to achieve compatibility with the existing and future ways to deliver electrical energy to current-using equipment or to the public network by means of local sources. Such electrical installations are designated as prosumer's electrical installations (PEEls)",
                  style: appTextStyles.h4GreyMediumStyle().copyWith(
                        rowMainAxisSize: MainAxisSize.max,
                        textAlign: TextAlign.start,
                        fontSize: 13.0,
                      ),
                  bottomChild: const SizedBox(),
                  containerStyle: const CommonContainerModel(
                    width: 1,
                    marginTop: 0.01,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formList.listRenderWidgets[8][keyData].length,
                itemBuilder: (BuildContext ctx, int index) => InputNAButton(
                  title: formList.listRenderWidgets[8][keyData][index]
                      [keyTitle],
                  btnValue: controller.gazSafetyData[formList
                      .listRenderWidgets[8][keyData][index]['button_form_key']],
                  value: controller.gazSafetyData[formList.listRenderWidgets[8]
                      [keyData][index]['input_form_key']],
                  hint: 'Typing...',
                  onChanged: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[8][keyData][index]
                          ['input_form_key'],
                      value,
                    );
                  },
                  btnOnChanged: (dynamic value) {
                    controller.onChangeFormDataValue(
                      formList.listRenderWidgets[8][keyData][index]
                          ['button_form_key'],
                      value,
                    );
                  },
                ),
              ),
              if (controller.renderItem)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: formList.listRenderWidgets[9][keyData].length,
                  itemBuilder: (BuildContext ctx, int index) => InputNAButton(
                    title: formList.listRenderWidgets[9][keyData][index]
                        [keyTitle],
                    btnValue: controller.gazSafetyData[
                        formList.listRenderWidgets[9][keyData][index]
                            ['button_form_key']],
                    value: controller.gazSafetyData[
                        formList.listRenderWidgets[9][keyData][index]
                            ['input_form_key']],
                    hint: 'Typing...',
                    onChanged: (dynamic value) {
                      controller.onChangeFormDataValue(
                        formList.listRenderWidgets[9][keyData][index]
                            ['input_form_key'],
                        value,
                      );
                    },
                    btnOnChanged: (dynamic value) {
                      controller.onChangeFormDataValue(
                        formList.listRenderWidgets[9][keyData][index]
                            ['button_form_key'],
                        value,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class InputNAButton extends StatelessWidget {
  const InputNAButton({
    Key? key,
    this.title,
    this.hint,
    this.value,
    this.onChanged,
    this.btnOnChanged,
    this.btnValue,
  }) : super(key: key);

  final String? title;
  final String? hint;
  final String? value;
  final Function(String)? onChanged;
  final String? btnValue;
  final Function(String)? btnOnChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: DEVICE_HEIGHT * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonInput(
            topLabelText: title,
            width: 0.65,
            maxLines: 2,
            textInputAction: TextInputAction.newline,
            hint: hint,
            value: value,
            onChanged: onChanged,
          ),
          FormToggleButton(
            toggleType: FormToggleType.multi,
            onChangeValue: btnOnChanged,
            value: btnValue,
            textWidget: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
