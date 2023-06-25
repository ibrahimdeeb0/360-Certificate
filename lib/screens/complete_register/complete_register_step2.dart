import '../../general_exports.dart';

class CompleteRegisterSteps2 extends StatelessWidget {
  const CompleteRegisterSteps2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteRegisterController>(
      init: CompleteRegisterController(),
      builder: (CompleteRegisterController controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonContainer(
                borderRadius: 0.01,
                backgroundColor: Colors.grey[200],
                paddingHorizontal: 0.02,
                paddingVertical: 0.01,
                child: CommonText(
                  "Great, you've chosen to create electrical certificates. To ensure your compliance, we'll need you to select your board and enter your license number.",
                  textAlign: TextAlign.start,
                  fontSize: fontH3,
                  fontColor: Colors.grey[600],
                ),
              ),
              CommonText(
                'Please select your board from the list below:',
                marginTop: 0.02,
                fontColor: AppColors.primary,
                fontSize: fontTitle,
              ),
              SizedBox(height: 0.02.flexHeight),
              ...controller.activationSelectionS2.map(
                (Map<String, dynamic> item) => CompleteRegisterSelectionSheet(
                  title: item[keyTitle],
                  isSelected: controller.selectedItems
                      .where((Map<String, dynamic> element) =>
                          element[keyId] == item[keyId])
                      .isNotEmpty,
                  onTap: () => controller.onSelect(item),
                ),
              ),
              CommonContainer(
                borderRadius: 0.01,
                backgroundColor: Colors.grey[200],
                paddingHorizontal: 0.02,
                paddingVertical: 0.01,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Icon(
                          Icons.info_outline,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 0.01.flexWidth,
                        ),
                        Expanded(
                          child: CommonText(
                            "After you've made your selection, please enter your license number. If you don't have it on hand, you can add it later from your account settings. Please note that you won't be able to create certificates without a valid license number.",
                            textAlign: TextAlign.start,
                            fontSize: fontH3,
                            fontColor: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const CommonText(
                      'License Number',
                      marginTop: 0.01,
                      marginBottom: 0.01,
                      textAlign: TextAlign.start,
                    ),
                    const CommonInput(
                      hint: 'DN8735',
                      fillColor: Colors.white,
                      borderColor: Colors.transparent,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    CommonText(
                      "You don't have license number",
                      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                      rowMainAxisSize: MainAxisSize.max,
                      rightChild: TextButton(
                        onPressed: () {},
                        child: CommonText(
                          'Skip',
                          fontColor: AppColors.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CompleteRegisterElectricalSheet extends StatelessWidget {
  const CompleteRegisterElectricalSheet({
    Key? key,
    this.title,
    this.children,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final List<String>? children;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomSelectCheckbox(
            title: title ?? '',
            // onPress: onChange,

            isSelected: isSelected,
            fontSized: fontTitle,
            wihBottomBorder: false,
            marginBottom: 0,
          ),
          if (children != null && isSelected)
            ...children!.map(
              (String item) => CommonText(
                item,
                fontColor: Colors.grey[500],
                fontSize: fontTitle,
                marginBottom: 0.012,
              ),
            ),
        ],
      ),
    );
  }
}
