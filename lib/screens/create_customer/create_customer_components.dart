import '../../general_exports.dart';

class RadioButtonYesNo extends StatelessWidget {
  const RadioButtonYesNo({
    Key? key,
    this.onTapYes,
    this.onTapNo,
    this.isSelect = true,
  }) : super(key: key);
  final Function? onTapYes;
  final Function? onTapNo;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CommonText(
          'Yes',
          onPress: onTapYes,
          fontSize: fontH3,
          fontColor: isSelect ? AppColors.primary : AppColors.grey,
          marginLeft: 0.015,
          leftChild: Icon(
            isSelect ? Icons.radio_button_checked : Icons.radio_button_off,
            color: Color(
              isSelect ? AppColors.primary : AppColors.grey,
            ),
          ),
          containerStyle: CommonContainerModel(
            touchEffect: TouchableEffect(
              type: TouchTypes.scaleAndUp,
            ),
          ),
        ),
        SizedBox(width: DEVICE_WIDTH * 0.1),
        CommonText(
          'No',
          onPress: onTapNo,
          fontSize: fontH3,
          fontColor: !isSelect ? AppColors.primary : AppColors.grey,
          marginLeft: 0.015,
          leftChild: Icon(
            !isSelect ? Icons.radio_button_checked : Icons.radio_button_off,
            color: Color(
              !isSelect ? AppColors.primary : AppColors.grey,
            ),
          ),
          containerStyle: CommonContainerModel(
            touchEffect: TouchableEffect(
              type: TouchTypes.scaleAndUp,
            ),
          ),
        ),
      ],
    );
  }
}

class TopLabelText extends StatelessWidget {
  const TopLabelText({
    Key? key,
    this.text,
    this.isRequired = true,
  }) : super(key: key);

  final String? text;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      text ?? '',
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      marginRight: 0.01,
      containerStyle: const CommonContainerModel(
        marginVertical: 0.01,
      ),
      rightChild: isRequired
          ? const Icon(
              Icons.star,
              color: Colors.red,
              size: 12,
            )
          : const SizedBox(),
    );
  }
}

class SelectValueBT extends StatelessWidget {
  const SelectValueBT({
    required this.listTitles,
    required this.controller,
    this.title,
    super.key,
  });
  final String? title;
  final List<String> listTitles;
  final CreateCustomerController controller;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: title ?? 'Select',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: DEVICE_HEIGHT * 0.03),
            ...listTitles
                .map(
                  (String title) => CommonText(
                    title,
                    fontColor: AppColors.primary,
                    textAlign: TextAlign.center,
                    containerStyle: CommonContainerModel(
                      alignment: AlignmentDirectional.center,
                      width: 1,
                      backgroundColor:
                          Color(AppColors.primary).withOpacity(0.1),
                      borderRadius: 0.02,
                      paddingVertical: 0.02,
                      marginBottom: 0.02,
                      touchEffect: TouchableEffect(type: TouchTypes.opacity),
                    ),
                  ),
                )
                .toList(),
            SizedBox(height: DEVICE_HEIGHT * 0.01),
          ],
        ),
      ),
    );
  }
}
