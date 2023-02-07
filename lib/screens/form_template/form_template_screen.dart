import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class FormTemplate extends StatelessWidget {
  const FormTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(AppColors.primary),
        onPressed: () => Get.to(
          () => const AddFormTemplate(),
          transition: Transition.rightToLeft,
        ),
        tooltip: 'Start New',
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const CommonText(
          'Start New',
          fontColor: Colors.white,
        ),
      ),
      appBar: Header(
        title: 'Form Template',
      ),
      body: GetBuilder<FormTemplateController>(
        init: FormTemplateController(),
        builder: (FormTemplateController controller) {
          return CommonContainer(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  ...controller.allFormsTemplates.map(
                    (dynamic item) => FormTemplateCard(
                      itemData: item,
                    ),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.01),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FormTemplateCard extends StatelessWidget {
  const FormTemplateCard({
    this.itemData,
    Key? key,
  }) : super(key: key);

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    final String? tempName = itemData['name'];
    final String? formName = itemData['form']['name'];
    final int? formId = itemData['form']['id'];
    final int? tempId = itemData['id'];
    // final bool isDefault = itemData['default'] == 'no' ? false : true;
    final bool isDefault = itemData['default'].contains('yes');
    // consoleLog(itemData, key: 'itemData for card');

    return CommonContainer(
      style: appContainerStyles.cardContainer(),
      marginBottom: 0.02,
      marginHorizontal: 0.04,
      onPress: () => Get.bottomSheet(
        elevation: 0.0,
        GetBuilder<AddFormTemplateController>(
          init: AddFormTemplateController(),
          global: false,
          builder: (AddFormTemplateController? controller) {
            return BottomSheetContainer(
              height: 0.36,
              title: '$tempName',
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: DEVICE_HEIGHT * 0.03),
                    CommonText(
                      'Edit  ',
                      onPress: () => controller!.onPressEdit(
                        formId: formId,
                        name: tempName,
                        tempId: tempId,
                      ),
                      style: appTextStyles.h3StyleWhite(),
                      containerStyle: CommonContainerModel(
                        backgroundColor: AppColors.primary,
                        borderRadius: 0.01,
                        padding: 0.01,
                        width: 0.7,
                        marginVertical: 0.01,
                      ),
                      rightChild: Padding(
                        padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.015),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CommonText(
                      'Copy  ',
                      onPress: () => controller!.onPressCopy(
                        formId: formId,
                        name: tempName,
                        tempId: tempId,
                      ),
                      style: appTextStyles.h3StyleWhite(),
                      containerStyle: CommonContainerModel(
                        backgroundColor: AppColors.green2,
                        borderRadius: 0.01,
                        padding: 0.01,
                        width: 0.7,
                        marginVertical: 0.01,
                      ),
                      rightChild: Padding(
                        padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.015),
                        child: const Icon(
                          Icons.copy,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CommonText(
                      'Delete  ',
                      onPress: () => controller?.onPressDelete(
                        formId: formId,
                        name: tempName,
                        tempId: tempId,
                      ),
                      style: appTextStyles.h3StyleWhite(),
                      containerStyle: const CommonContainerModel(
                        backgroundColor: Colors.red,
                        borderRadius: 0.01,
                        padding: 0.01,
                        width: 0.7,
                        marginVertical: 0.01,
                      ),
                      rightChild: Padding(
                        padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.015),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    CommonText(
                      'Make as Default  ',
                      onPress: () => controller?.onPressDefault(
                        tempId: tempId!,
                      ),
                      style: appTextStyles.h3StyleWhite(),
                      containerStyle: CommonContainerModel(
                        backgroundColor: AppColors.textGrey,
                        borderRadius: 0.01,
                        padding: 0.01,
                        width: 0.7,
                        marginVertical: 0.01,
                      ),
                      rightChild: Padding(
                        padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.015),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: CommonText(
              tempName ?? 'Form Template Name',
              marginLeft: 0.01,
              rowMainAxisSize: MainAxisSize.max,
              leftChild: SvgPicture.asset(
                iconFormTemplate,
                height: DEVICE_HEIGHT * 0.03,
                width: DEVICE_WIDTH * 0.03,
                color: Color(AppColors.primary),
              ),
              containerStyle: const CommonContainerModel(
                width: 1,
                alignment: AlignmentDirectional.topStart,
              ),
              bottomChild: CommonText(
                formName ?? 'Form Related: ',
                textAlign: TextAlign.start,
                fontColor: AppColors.textGrey,
                rowMainAxisSize: MainAxisSize.max,
                inlineSpans: const <InlineSpan>[],
                containerStyle: const CommonContainerModel(
                  marginTop: 0.015,
                  marginLeft: 0.07,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CommonText(
              isDefault ? 'Default' : '',
              marginRight: 0.015,
              fontColor: AppColors.green,
              rightChild: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
