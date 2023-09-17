import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormsController>(
      init: FormsController(),
      builder: (FormsController controller) {
        return Scaffold(
          appBar: const Header(
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
                              (dynamic element) => ChildeItems(
                                text: element[keyTitle],
                                onPress: () {
                                  // final List<int> formsId = <int>[
                                  //   1,
                                  //   3,
                                  //   5,
                                  //   9,
                                  //   4,
                                  //   11,
                                  // ];
                                  // if (formsId.contains(element[keyId])) {
                                  //   controller.searchTemplate(element);
                                  // }
                                  controller.searchTemplate(element);
                                },
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  // CommonButton(
                  //   width: 0.4,
                  //   marginVertical: 0.04,
                  //   onPress: () {
                  //     Get.toNamed(routeUpdateCertNumber);
                  //   },
                  // ),
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

class ShowNumberMassageSheet extends StatelessWidget {
  const ShowNumberMassageSheet({
    super.key,
    this.title,
    this.text1,
    this.text2,
    this.btnText,
    this.onPress,
    this.isImage = false,
  });

  final String? title;
  final String? text1;
  final String? text2;
  final String? btnText;
  final Function()? onPress;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: DEVICE_HEIGHT * 0.03),
            if (!isImage) SvgPicture.asset(iconFormsOops),
            if (isImage) Image.asset(imageUpgradePlan),
            CommonText(
              title ?? 'Oops!',
              fontSize: fontH1,
              fontWeight: FontWeight.bold,
              marginBottom: 0.02,
              marginTop: 0.02,
            ),
            CommonText(
              text1,
              fontSize: fontH3,
              fontColor: Colors.grey[700],
              marginBottom: 0.015,
            ),
            if (text2 != null)
              CommonText(
                text2,
                fontSize: fontH3,
                fontColor: Colors.grey[700],
                marginBottom: 0.015,
              ),
            CommonButton(
              onPress: onPress,
              text: btnText ?? '',
              backgroundColor: Color(AppColors.primary).withOpacity(0.9),
              marginTop: 0.01,
              marginBottom: 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
