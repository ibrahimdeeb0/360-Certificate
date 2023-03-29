import '../../../../../general_exports.dart';

class LandlordPage3 extends StatelessWidget {
  const LandlordPage3({
    super.key,
    // this.controller,
  });

  // final LandlordSafetyController? controller;

  @override
  Widget build(BuildContext context) {
    final LandlordSafetyController controller =
        Get.put(LandlordSafetyController());
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextFormTitle(
                leftText: 'Part 5. ',
                text: 'Any Defects Identified'.capitalize,
                marginBottom: 0.02,
              ),
              CommonText(
                'Defects Identified',
                rowMainAxisSize: MainAxisSize.max,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                fontWeight: FontWeight.w600,
                fontColor: Colors.grey[700],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.01.flexWidth, top: 0.015.flexHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CommonInput(
                      prefix: PrefixTextNum(
                        num: '1',
                      ),
                      marginBottom: 0.015,
                    ),
                    CommonInput(
                      prefix: PrefixTextNum(
                        num: '2',
                      ),
                      marginBottom: 0.015,
                    ),
                    CommonInput(
                      prefix: PrefixTextNum(
                        num: '3',
                      ),
                      marginBottom: 0.015,
                    ),
                    CommonInput(
                      prefix: PrefixTextNum(
                        num: '4',
                      ),
                      marginBottom: 0.015,
                    ),
                    CommonInput(
                      prefix: PrefixTextNum(
                        num: '5',
                      ),
                      marginBottom: 0.015,
                    ),
                  ],
                ),
              ),
              0.02.ph,
              CommonText(
                'Warning Notice Issue',
                fontWeight: FontWeight.w600,
                fontColor: Colors.grey[700],
                containerStyle: const CommonContainerModel(
                  marginBottom: 0.02,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  CommonText(
                    '1',
                    fontWeight: FontWeight.bold,
                    topChild: FormToggleButton(
                      isBtnBox: true,
                      toggleType: FormToggleType.yesNo,
                      textWidget: SizedBox(),
                    ),
                  ),
                  CommonText(
                    '2',
                    fontWeight: FontWeight.bold,
                    topChild: FormToggleButton(
                      isBtnBox: true,
                      toggleType: FormToggleType.yesNo,
                      textWidget: SizedBox(),
                    ),
                  ),
                  CommonText(
                    '3',
                    fontWeight: FontWeight.bold,
                    topChild: FormToggleButton(
                      isBtnBox: true,
                      toggleType: FormToggleType.yesNo,
                      textWidget: SizedBox(),
                    ),
                  ),
                  CommonText(
                    '4',
                    fontWeight: FontWeight.bold,
                    topChild: FormToggleButton(
                      isBtnBox: true,
                      toggleType: FormToggleType.yesNo,
                      textWidget: SizedBox(),
                    ),
                  ),
                  CommonText(
                    '5',
                    fontWeight: FontWeight.bold,
                    topChild: FormToggleButton(
                      isBtnBox: true,
                      toggleType: FormToggleType.yesNo,
                      textWidget: SizedBox(),
                    ),
                  ),
                ],
              ),
              0.01.ph,
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          paddingBottom: 0.025,
          marginTop: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextFormTitle(
                leftText: 'Part 6. ',
                text: 'Record Remedial Action Taken Or Notes'.capitalize,
                marginBottom: 0.02,
              ),
              const CommonText(
                'Numbering should correspond to defects identified in report',
                rowMainAxisSize: MainAxisSize.max,
                textAlign: TextAlign.start,
                fontSize: fontH3,
                marginBottom: 0.015,
              ),
              const CommonInput(
                maxLines: 6,
              ),
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          marginTop: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextFormTitle(
                leftText: 'Part 7. ',
                text: 'ATTENTION'.capitalize,
                marginBottom: 0.01,
              ),
              CommonInput(
                topLabelText: 'Next Safety Check Due By',
                onTap: () {
                  CommonDatePicker.showDatePicker(
                    context,
                    onConfirm: (DateTime value) {
                      // controller.onConfirmDate(
                      //   dateTime: value,
                      //   type: FormDateType.recommendation,
                      // );
                    },
                    currentTime: DateTime.now(),
                  );
                },
                enabled: false,
                hint: 'select',
                // value: ,
                marginBottom: 0.02,
                suffix: const Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
