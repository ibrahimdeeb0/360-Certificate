import '../../../general_exports.dart';

class MyValidateItem extends StatelessWidget {
  const MyValidateItem({
    this.title,
    this.titleColor,
    this.leftIcon,
    this.text,
    Key? key,
  }) : super(key: key);

  final String? title;
  final dynamic titleColor;
  final Widget? leftIcon;
  final List<Widget>? text;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreController>(
      init: MoreController(),
      builder: (MoreController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: CommonText(
                title ?? 'Title',
                fontColor: titleColor ?? Colors.black,
                fontWeight: FontWeight.bold,
                rowMainAxisSize: MainAxisSize.max,
                textAlign: TextAlign.start,
                marginHorizontal: 0.04,
                marginVertical: 0.02,
                containerStyle: const CommonContainerModel(
                  paddingBottom: 0.01,
                ),
              ),
            ),
            if (text != null) ...?text,
          ],
        );
      },
    );
  }
}

class ChildeItemsValidate extends StatelessWidget {
  const ChildeItemsValidate({
    Key? key,
    this.text,
    this.onPress,
  }) : super(key: key);
  final String? text;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress?.call,
      alignment: AlignmentDirectional.topStart,
      marginVertical: 0.01,
      borderBottomWidth: 1,
      paddingHorizontal: 0.02,
      paddingBottom: 0.015,
      borderBottomColor: AppColors.greyLightBorder,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
        duration: 10,
      ),
      child: CommonText(
        text ?? '',
        rowMainAxisSize: MainAxisSize.max,
        textAlign: TextAlign.start,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        containerStyle: const CommonContainerModel(
          width: 0.68,
          alignment: AlignmentDirectional.topStart,
          marginLeft: 0.04,
          marginHorizontal: 0.02,
        ),
        bottomChild: const SizedBox(),
      ),
    );
  }
}

class SelectValidateBTSheet extends StatelessWidget {
  const SelectValidateBTSheet({
    required this.data,
    super.key,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CretificatesValidateController>(
      init: CretificatesValidateController(),
      builder: (CretificatesValidateController controller) {
        // reset value when open bottom sheet
        // controller.selectedYear = null;

        return BottomSheetContainer(
          // title: 'Select the expiry period of the certificate',
          responsiveContent: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CommonText(
                  'Select the expiry period of the certificate',
                  marginVertical: 0.01,
                  fontSize: fontH2,
                ),
                ...data['valid'].map(
                  (dynamic item) => CustomRadioSelection(
                    title: '$item',
                    onPress: () {
                      controller.onSelectRadio(item);
                      controller.update();
                    },
                    isSelected: ((data['form_valid'].isNotEmpty) &&
                            (data['form_valid'][0]['years'] == item)) ||
                        (controller.selectedYear == item),
                    showRightText: ((data['form_valid'].isNotEmpty) &&
                        (data['form_valid'][0]['years'] == item)),
                    rightText: 'Default',
                  ),
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.02),
                CommonButton(
                  enabled:(controller.selectedYear != null),
                  onPress: () {
                    controller.onCreatValidYear(
                      formId: data[keyId],
                      years: controller.selectedYear!,
                    );
                  },
                  text: 'Confirm',
                  marginBottom: 0.02,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
