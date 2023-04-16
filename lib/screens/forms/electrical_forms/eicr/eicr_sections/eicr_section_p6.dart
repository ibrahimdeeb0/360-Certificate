import 'package:flutter_svg/svg.dart';

import '../../../../../general_exports.dart';

class EICRSectionF extends StatelessWidget {
  const EICRSectionF({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return CommonContainer(
      style: appContainerStyles.formSectionsStyle,
      paddingHorizontal: 0.0,
      child: Column(
        children: <Widget>[
          const CustomTextFormTitle(
            leftText: 'Part 6. ', //F
            text: 'Supply characteristics & earthing arrangements',
            marginBottom: 0.025,
            marginLeft: 0.03,
          ),
          FormToggleButton(
            title: 'Confirmation of supply polarity',
            value: controller.gazSafetyData[formKeyConfirmationSupplyF],
            onChangeValue: (dynamic value) => controller.onChangeFormDataValue(
                formKeyConfirmationSupplyF, value),
            paddingHorizontal: 0.03,
            toggleType: FormToggleType.trueFalse,
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
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.02),
                FormToggleButton(
                  title: 'TN-C-S',
                  value: controller.gazSafetyData[formKeyTNCSF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyTNCSF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
                FormToggleButton(
                  title: 'TN-S',
                  value: controller.gazSafetyData[formKeyTNSF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyTNSF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
                FormToggleButton(
                  title: 'TT',
                  value: controller.gazSafetyData[formKeyTTF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyTTF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
                FormToggleButton(
                  title: 'TN-C',
                  value: controller.gazSafetyData[formKeyTNCF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyTNCF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
                FormToggleButton(
                  title: 'IT',
                  value: controller.gazSafetyData[formKeyITF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyITF, value),
                  toggleType: FormToggleType.trueFalse,
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
          CommonContainer(
            paddingHorizontal: 0.03,
            paddingVertical: 0.01,
            borderBottomWidth: 1.6,
            borderBottomColor: Color(AppColors.textGrey).withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FormToggleButton(
                  textWidget: const CommonText(
                    'A.C.',
                    marginRight: 0.04,
                  ),
                  value: controller.gazSafetyData[formKeyACF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyACF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
                FormToggleButton(
                  textWidget: const CommonText(
                    'D.C.',
                    marginRight: 0.04,
                  ),
                  value: controller.gazSafetyData[formKeyDCF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyDCF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
              ],
            ),
          ),
          CommonContainer(
            paddingTop: 0.02,
            borderBottomWidth: 1.6,
            borderBottomColor: Color(AppColors.textGrey).withOpacity(0.2),
            paddingHorizontal: 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FormToggleButton(
                      textWidget: const CommonText(
                        '1- Phase \n    2 wire',
                        marginRight: 0.04,
                        fontSize: fontH3,
                      ),
                      value: controller.gazSafetyData[formKey1Phase2WireF],
                      onChangeValue: (dynamic value) => controller
                          .onChangeFormDataValue(formKey1Phase2WireF, value),
                      toggleType: FormToggleType.trueFalse,
                    ),
                    FormToggleButton(
                      textWidget: const CommonText(
                        '1- Phase \n    3 wire',
                        marginRight: 0.04,
                        fontSize: fontH3,
                      ),
                      value: controller.gazSafetyData[formKey1Phase3WireF],
                      onChangeValue: (dynamic value) => controller
                          .onChangeFormDataValue(formKey1Phase3WireF, value),
                      toggleType: FormToggleType.trueFalse,
                    ),
                  ],
                ),
                SizedBox(
                  width: DEVICE_WIDTH * 0.4,
                  child: FormToggleButton(
                    textWidget: const CommonText(
                      '2 wire',
                      fontSize: fontH3,
                    ),
                    value: controller.gazSafetyData[formKey2WireF],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKey2WireF, value),
                    toggleType: FormToggleType.trueFalse,
                  ),
                ),
              ],
            ),
          ),
          CommonContainer(
            paddingTop: 0.02,
            borderBottomWidth: 1.6,
            borderBottomColor: Color(AppColors.textGrey).withOpacity(0.2),
            paddingHorizontal: 0.03,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FormToggleButton(
                  textWidget: const CommonText(
                    '2-Phase \n    3 wire',
                    fontSize: fontH3,
                    marginRight: 0.04,
                  ),
                  value: controller.gazSafetyData[formKey2Phase3WireF],
                  onChangeValue: (dynamic value) => controller
                      .onChangeFormDataValue(formKey2Phase3WireF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
                FormToggleButton(
                  textWidget: const CommonText(
                    '3 wire \n',
                    fontSize: fontH3,
                    marginRight: 0.04,
                  ),
                  value: controller.gazSafetyData[formKey3WireF],
                  onChangeValue: (dynamic value) =>
                      controller.onChangeFormDataValue(formKey3WireF, value),
                  toggleType: FormToggleType.trueFalse,
                ),
              ],
            ),
          ),
          CommonContainer(
            paddingTop: 0.02,
            borderBottomWidth: 1.6,
            borderBottomColor: Color(AppColors.textGrey).withOpacity(0.2),
            paddingHorizontal: 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FormToggleButton(
                      textWidget: const CommonText(
                        '3-Phase \n    3 wire',
                        fontSize: fontH3,
                        marginRight: 0.04,
                      ),
                      value: controller.gazSafetyData[formKey3Phase3WireF],
                      onChangeValue: (dynamic value) => controller
                          .onChangeFormDataValue(formKey3Phase3WireF, value),
                      toggleType: FormToggleType.trueFalse,
                    ),
                    FormToggleButton(
                      textWidget: const CommonText(
                        '3-Phase \n    4 wire',
                        fontSize: fontH3,
                        marginRight: 0.04,
                      ),
                      value: controller.gazSafetyData[formKey3Phase4WireF],
                      onChangeValue: (dynamic value) => controller
                          .onChangeFormDataValue(formKey3Phase4WireF, value),
                      toggleType: FormToggleType.trueFalse,
                    ),
                  ],
                ),
                SizedBox(
                  width: DEVICE_WIDTH * 0.4,
                  child: FormToggleButton(
                    textWidget: const CommonText(
                      'Other',
                      fontSize: fontH3,
                    ),
                    value: controller.gazSafetyData[formKeyOtherF],
                    onChangeValue: (dynamic value) =>
                        controller.onChangeFormDataValue(formKeyOtherF, value),
                    toggleType: FormToggleType.trueFalse,
                  ),
                ),
              ],
            ),
          ),
          const CustomTextFormTitle(
            text: 'Nature of supply parameters',
            marginLeft: 0.03,
            marginTop: 0.02,
            marginBottom: 0.03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
            child: Column(
              children: <Widget>[
                SmallInputField(
                  title: 'Nominal voltage U(o)',
                  value: controller.gazSafetyData[formKeyNominalVoltageF],
                  hint: '230',
                  isInputSelection: true,
                  onTap: () => Get.bottomSheet(
                    EICRSelectBT(
                      listTitles: formList.listNominalVoltage,
                      keyOfValue: formKeyNominalVoltageF,
                      controller: controller,
                    ),
                    isScrollControlled: true,
                    elevation: 0.0,
                  ),
                ),
                SmallInputField(
                  title: 'Nominal frequency f(1)',
                  value: controller.gazSafetyData[formKeyNominalFrequencyFF],
                  hint: controller.gazSafetyData[formKeyNominalFrequencyFF],
                  onChanged: (dynamic value) => controller
                      .onChangeFormDataValue(formKeyNominalFrequencyFF, value),
                  suffix: CommonText(
                    'HZ',
                    style: appTextStyles.h3GreyStyle(),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SmallInputField(
                  title: 'Earth fault loop impedance Ze(1,2)',
                  value: controller.gazSafetyData[formKeyEarthFaultLoopF],
                  onChanged: (dynamic value) => controller
                      .onChangeFormDataValue(formKeyEarthFaultLoopF, value),
                  suffix: CommonText(
                    'Ω',
                    style: appTextStyles.h3GreyStyle(),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SmallInputField(
                  title: 'PFC Ipf(1,2)',
                  value: controller.gazSafetyData[formKeyPFC],
                  onChanged: (dynamic value) =>
                      controller.onChangeFormDataValue(formKeyPFC, value),
                  suffix: CommonText(
                    'KA',
                    style: appTextStyles.h3GreyStyle(),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.go,
                ),
                Row(
                  children: <Widget>[
                    const CommonText(
                      'Note:',
                    ),
                    CommonContainer(
                      width: 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          CommonText(
                            '(1) by enquiry',
                            marginTop: 0.01,
                            marginHorizontal: 0.03,
                          ),
                          CommonText(
                            '(2) by enquiry or by measurement',
                            marginHorizontal: 0.03,
                          ),
                        ],
                      ),
                    ),
                  ],
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
            padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
            child: Column(
              children: <Widget>[
                CustomSelectContainer(
                  title: 'BS (EN)',
                  value: controller.gazSafetyData[formKeyBSF],
                  hint: controller.gazSafetyData[formKeyBSF],
                  onTap: () => Get.bottomSheet(
                    EICRSelectBT(
                      listTitles: formList.listBS,
                      keyOfValue: formKeyBSF,
                      controller: controller,
                    ),
                    elevation: 0.0,
                  ),
                ),
                SmallInputField(
                  title: 'Type',
                  value: controller.gazSafetyData[formKeyTypeF],
                  hint: controller.gazSafetyData[formKeyTypeF],
                  onTap: () => Get.bottomSheet(
                    EICRSelectBT(
                      listTitles: formList.listTypeH,
                      keyOfValue: formKeyTypeF,
                      controller: controller,
                    ),
                    elevation: 0.0,
                  ),
                  isInputSelection: true,
                ),
                SmallInputField(
                  title: 'Rated current',
                  value: controller.gazSafetyData[formKeyRatedCurrentF],
                  hint: controller.gazSafetyData[formKeyRatedCurrentF],
                  onTap: () => Get.bottomSheet(
                    EICRSelectBT(
                      listTitles: formList.listRatedCurrentI,
                      keyOfValue: formKeyRatedCurrentF,
                      controller: controller,
                    ),
                    elevation: 0.0,
                  ),
                  isInputSelection: true,
                ),
                SmallInputField(
                  title: 'Short circuit capacity',
                  value: controller.gazSafetyData[formKeyShortCircuitCapacityF],
                  onChanged: (dynamic value) =>
                      controller.onChangeFormDataValue(
                          formKeyShortCircuitCapacityF, value),
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
    );
  }
}

class CustomSelectContainer extends StatelessWidget {
  const CustomSelectContainer({
    Key? key,
    this.title,
    this.onTap,
    this.value,
    this.hint,
    this.marginHorizontal = 0.0,
    this.marginTop = 0.01,
    this.marginBottom = 0.03,
    this.width,
  }) : super(key: key);

  final String? title;
  final Function()? onTap;
  final String? value;
  final String? hint;
  final double? marginHorizontal;
  final double marginTop;
  final double marginBottom;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CommonInput(
      enabled: false,
      onTap: onTap?.call,
      topLabelText: title ?? '',
      value: value,
      hint: hint,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginHorizontal: marginHorizontal,
      suffix: const Icon(Icons.keyboard_arrow_down),
      width: width,
    );
  }
}

class SmallInputField extends StatelessWidget {
  const SmallInputField({
    Key? key,
    this.title,
    this.hint,
    this.value,
    this.suffix,
    this.onChanged,
    this.onTap,
    this.isInputSelection = false,
    this.keyboardType,
    this.textInputAction,
    this.paddingHorizontal = 0.0,
    this.marginBottom = 0.03,
    this.width = 0.55,
  }) : super(key: key);

  final String? title;
  final bool isInputSelection;
  final Widget? suffix;
  final String? hint;
  final String? value;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double paddingHorizontal;
  final double marginBottom;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: 1,
      paddingHorizontal: paddingHorizontal,
      marginBottom: marginBottom,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            title ?? '',
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnCrossAxisAlignment: CrossAxisAlignment.start,
            textAlign: TextAlign.start,
            marginRight: 0.015,
            bottomChild: const SizedBox(),
            containerStyle: CommonContainerModel(
              width: width,
            ),
          ),
          CommonInput(
            onTap: onTap?.call,
            enabled: !isInputSelection,
            hint: hint ?? '',
            value: value,
            onChanged: onChanged,
            width: 0.33,
            suffix: suffix ??
                (isInputSelection == true
                    ? const Icon(Icons.keyboard_arrow_down)
                    : const SizedBox()),
            keyboardType: keyboardType,
            textInputAction: textInputAction,
          ),
        ],
      ),
    );
  }
}
