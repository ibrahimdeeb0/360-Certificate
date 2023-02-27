import '../../general_exports.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormsController>(
      init: FormsController(),
      builder: (FormsController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Forms',
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingHorizontal: 0.02,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: DEVICE_HEIGHT * 0.02,
                  ),
                  ...controller.formItems.map(
                    (dynamic item) => ExpandableTile(
                      title: item[keyTitle],
                      titleColor: AppColors.primary,
                      children: <Widget>[
                        ...item[keyItems]
                            .map(
                              (dynamic childe) => ChildeItems(
                                text: childe[keyTitle],
                                onPress: () {
                                  if (childe[keyId] == 5) {
                                    controller.searchTemplate(childe);
                                  }
                                },
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShowTemplatesBT extends StatelessWidget {
  const ShowTemplatesBT({
    super.key,
    this.formInfo,
  });

  final Map<String, dynamic>? formInfo;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Select Template',
      responsiveContent: true,
      child: GetBuilder<FormsController>(
        init: FormsController(),
        builder: (FormsController controller) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.03),
                // if (controller.listTemp.isNotEmpty)
                if (controller.listTemp.isNotEmpty)
                  ...controller.listTemp.map(
                    (dynamic item) => ShowTemplateCard(
                      title: item['name'],
                      onPress: () => controller.onSelectFormTemplate(
                        formInfo: formInfo,
                        tempId: item['id'],
                      ),
                    ),
                  )
                else
                  CommonText(
                    'There is no templates for this form',
                    fontColor: Colors.grey[700],
                    marginBottom: 0.04,
                    marginTop: 0.02,
                  ),

                CommonButton(
                  onPress: () => controller.onSkipTemplate(formInfo!),
                  text: 'Continue without template',
                  backgroundColor: Color(AppColors.primary).withOpacity(0.9),
                  marginTop: 0.01,
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.025),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ShowTemplateCard extends StatelessWidget {
  const ShowTemplateCard({
    super.key,
    this.title,
    this.onPress,
  });

  final String? title;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      title ?? 'text',
      onPress: onPress,
      leftChild: CommonText(
        'Template Name: ',
        marginRight: 0.015,
        fontSize: fontBody,
        fontColor: AppColors.greyDark,
      ),
      textAlign: TextAlign.start,
      containerStyle: CommonContainerModel(
        width: 1,
        paddingHorizontal: 0.04,
        paddingVertical: 0.015,
        backgroundColor: Color(AppColors.primary).withOpacity(0.1),
        borderRadius: 0.02,
        marginBottom: 0.02,
      ),
    );
  }
}
