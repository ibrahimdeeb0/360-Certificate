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
      appBar: const Header(
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
    final bool isDefault = itemData['default'].contains('yes');

    return CommonContainer(
      style: appContainerStyles.cardContainer(),
      marginBottom: 0.02,
      marginHorizontal: 0.04,
      onPress: () => Get.bottomSheet(
        elevation: 0.0,
        GetBuilder<FormTemplateController>(
          init: FormTemplateController(),
          // global: false,
          builder: (FormTemplateController? controller) {
            return BottomSheetContainer(
              height: 0.35,
              title: '$tempName',
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: DEVICE_HEIGHT * 0.05),
                    TemplateButtons(
                      press: () => controller!.onPressEditTemplate(
                        formId: formId,
                        name: tempName,
                        tempId: tempId,
                      ),
                    ),
                    TemplateButtons(
                      name: 'Delete',
                      press: () => controller?.onPressDelete(
                        formId: formId,
                        name: tempName,
                        tempId: tempId,
                      ),
                      status: TemplateStatus.deleteTemp,
                    ),
                    TemplateButtons(
                      name: 'Make as Default',
                      press: () => controller?.onPressDefault(
                        tempId: tempId!,
                      ),
                      status: TemplateStatus.defaultTemp,
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

class TemplateButtons extends StatelessWidget {
  const TemplateButtons({
    super.key,
    this.press,
    this.status,
    this.name,
  });

  final Function()? press;
  final TemplateStatus? status;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPress: press,
      width: 0.7,
      backgroundColor: status == TemplateStatus.deleteTemp
          ? Colors.red
          : status == TemplateStatus.defaultTemp
              ? AppColors.green
              : AppColors.primary,
      marginBottom: 0.02,
      child: CommonText(
        name ?? 'Edit',
        style: appTextStyles.h2StyleWhite(),
        marginHorizontal: 0.02,
        leftChild: Padding(
          padding: EdgeInsets.only(left: DEVICE_WIDTH * 0.015),
          child: Icon(
            status == TemplateStatus.defaultTemp
                ? Icons.favorite
                : status == TemplateStatus.deleteTemp
                    ? Icons.delete
                    : Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
