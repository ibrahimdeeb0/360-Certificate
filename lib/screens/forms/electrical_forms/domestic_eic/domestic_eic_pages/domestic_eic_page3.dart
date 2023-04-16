import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class DomesticEicPage3 extends StatelessWidget {
  const DomesticEicPage3({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 6. ',
                    text: 'SUPPLY CHARACTERISTICS & EARTHING ARRANGEMENTS',
                    marginBottom: 0.025,
                    marginLeft: 0.03,
                  ),
                  CommonText(
                    'System Types',
                    fontWeight: FontWeight.bold,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rowMainAxisSize: MainAxisSize.max,
                    rightChild: Listener(
                      behavior: HitTestBehavior.opaque,
                      onPointerDown: (PointerDownEvent details) {
                        formsDialog(
                          title: 'Earthing Arrangements',
                          description:
                              'TN-C No separate earth conductors,neutral used as earth throughout supply and installation. Not permitted for a low voltage public supply in theUK \n\nTN-S Separate earth conductor back to substation \n\nTN-C-S (Protective Multiple Earthing)Supply combines neutral and earth separate in the installation\n\nTT No earth provided by supplier;installation requires earth rod(common with overhead supply lines)\n\n IT Supply may be portable generator with no earth connection, installation supplies own earth rod. Not permitted for a low voltage public supply in the UK\n\nWhere the supply to an installation is at high voltage, protection against faults between the high voltage supply and earth shall be provided in accordance with Section 442',
                        );
                      },
                      child: SvgPicture.asset(
                        iconAttention,
                        width: DEVICE_WIDTH * 0.012,
                        height: DEVICE_HEIGHT * 0.02,
                        color: Color(AppColors.primary),
                      ),
                    ),
                    containerStyle: appContainerStyles.topBottomBorderStyle,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: DEVICE_HEIGHT * 0.02),
                        const FormToggleButton(
                          title: 'TN-C-S',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: 'TN-S',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: 'TT',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: 'Other',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                      ],
                    ),
                  ),
                  CommonText(
                    'Number and types of live conductors',
                    fontWeight: FontWeight.bold,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rowMainAxisSize: MainAxisSize.max,
                    rightChild: Listener(
                      behavior: HitTestBehavior.opaque,
                      onPointerDown: (PointerDownEvent details) {
                        formsDialog(
                          title: 'Live Conductor',
                          description:
                              'A conductor or conductive part intended to be energized in normal use, including a neutral conductor but,by convention, not a PEN conductor',
                        );
                      },
                      child: SvgPicture.asset(
                        iconAttention,
                        width: DEVICE_WIDTH * 0.012,
                        height: DEVICE_HEIGHT * 0.02,
                        color: Color(AppColors.primary),
                      ),
                    ),
                    containerStyle: appContainerStyles.topBottomBorderStyle,
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: DEVICE_HEIGHT * 0.02),
                        const FormToggleButton(
                          title: '1- Phase  2 wire',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: '1- Phase  3 wire',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: '2- Phase  3 wire',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: '3- Phase  4 wire',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                        const FormToggleButton(
                          title: 'Other',
                          toggleType: FormToggleType.trueFalse,
                          titleSize: fontTitle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.03.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          'Nature of supply parameters',
                          fontWeight: FontWeight.bold,
                          rowMainAxisSize: MainAxisSize.max,
                          containerStyle:
                              appContainerStyles.topBottomBorderStyle.copyWith(
                            borderBottomWidth: 0,
                            paddingHorizontal: 0.0,
                          ),
                        ),
                        const CommonText(
                          '(1) by enquiry',
                          fontSize: fontBody,
                          marginTop: 0.01,
                          marginHorizontal: 0.03,
                        ),
                        const CommonText(
                          '(2) by enquiry or by measurement',
                          fontSize: fontBody,
                          marginHorizontal: 0.03,
                        ),
                        const CommonText(
                          '(3) where more than one supply, the higher or highest values',
                          textAlign: TextAlign.start,
                          rowMainAxisSize: MainAxisSize.max,
                          marginHorizontal: 0.03,
                          fontSize: fontBody,
                          marginBottom: 0.02,
                        ),
                        const SmallInputField(
                          title: 'AC or DC',
                          isInputSelection: true,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
                        ),
                        const SmallInputField(
                          title: 'Nominal voltage U (1)',
                          isInputSelection: true,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
                        ),
                        SmallInputField(
                          title: 'Uo (1)',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
                          suffix: CommonText(
                            'Volts',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                        ),
                        SmallInputField(
                          title: 'Nominal frequency f(1)',
                          suffix: CommonText(
                            'Ω',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        SmallInputField(
                          title: 'External earth fault loop impedance Ze (2/3)',
                          suffix: CommonText(
                            'kA',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        SmallInputField(
                          title:
                              'Single-phase \nProspective fault current (2/3)',
                          suffix: CommonText(
                            'kA',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        SmallInputField(
                          title: '3-phase \nProspective fault current (2/3)',
                          suffix: CommonText(
                            'HZ',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  CommonContainer(
                    style: appContainerStyles.bottomBorderContainer,
                  ),
                  const CommonText(
                    'Characteristics of primary supply over current protective device(s)',
                    textAlign: TextAlign.start,
                    marginHorizontal: 0.03,
                    marginTop: 0.02,
                    fontWeight: FontWeight.bold,
                    fontSize: fontH3,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
                    child: Column(
                      children: <Widget>[
                        const CustomSelectContainer(
                          title: 'BS (EN)',

                          // onTap: () => Get.bottomSheet(
                          //   EICRSelectBT(
                          //     listTitles: formList.listBS,
                          //     keyOfValue: formKeyBSF,
                          //     controller: controller,
                          //   ),
                          //   elevation: 0.0,
                          // ),
                        ),
                        const SmallInputField(
                          title: 'Type',

                          // onTap: () => Get.bottomSheet(
                          //   EICRSelectBT(
                          //     listTitles: formList.listTypeH,
                          //     keyOfValue: formKeyTypeF,
                          //     controller: controller,
                          //   ),
                          //   elevation: 0.0,
                          // ),
                          isInputSelection: true,
                        ),
                        const SmallInputField(
                          title: 'Rated current',

                          // onTap: () => Get.bottomSheet(
                          //   EICRSelectBT(
                          //     listTitles: formList.listRatedCurrentI,
                          //     keyOfValue: formKeyRatedCurrentF,
                          //     controller: controller,
                          //   ),
                          //   elevation: 0.0,
                          // ),
                          isInputSelection: true,
                        ),
                        SmallInputField(
                          title: 'Short circuit capacity',
                          suffix: CommonText(
                            'KA',
                            style: appTextStyles.h3GreyStyle(),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.go,
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
