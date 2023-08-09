import '../../../../general_exports.dart';

class PortableTest extends StatelessWidget {
  const PortableTest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PortableTestController>(
      init: PortableTestController(),
      builder: (PortableTestController controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.onPressBack();
            return false;
          },
          child: Scaffold(
            appBar: FormHeader(
              withBack: false,
              title: 'Portable Appliance Test',
              actionItem: ActionItem(
                type: ActionType.image,
              ),
              pressImage: () {
                controller.formImagesAttachmentsController.certId =
                    controller.certId;
                Get.to(
                  () => FormImagesAttachments(
                    formImagesAttachmentsController:
                        controller.formImagesAttachmentsController,
                  ),
                );
              },
              pressNote: () {
                controller.formNotesAttachmentsController.certId =
                    controller.certId;
                Get.to(
                  () => FormNotesAttachments(
                    formNotesAttachmentsController:
                        controller.formNotesAttachmentsController,
                  ),
                );
              },
              showSaveBtn: ((controller.selectedId !=
                      controller.listFormSections.length - 1) &&
                  !controller.isTemplate!),
              onPressSave: () => controller.onNext(fromSave: true),
            ),
            body: CommonContainer(
              width: 1,
              height: 1,
              backgroundColor: AppColors.greyLightBorder,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: DEVICE_HEIGHT * 0.07),
                          controller.listFormSections[controller.selectedId],
                          SizedBox(height: DEVICE_HEIGHT * 0.09),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: StepperHeader(
                      bgColor: Colors.white,
                      fontSize: fontTitle,
                      currentIndex: controller.selectedId,
                      lastIndex: controller.listFormSections.length - 1,
                      title:
                          controller.listSectionsTitle[controller.selectedId],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CommonContainer(
                      paddingHorizontal: 0.03,
                      width: 1,
                      backgroundColor: Colors.white,
                      borderTopWidth: 3,
                      borderTopColor: AppColors.greyLightBorder,
                      paddingVertical: 0.015,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CommonButton(
                            onPress: controller.onPressBack,
                            text:
                                controller.selectedId == 0 ? 'Cancel' : 'Back',
                            backgroundColor: Colors.white,
                            fontColor: AppColors.primary,
                            borderWidth: 1.5,
                            borderColor: AppColors.primary,
                            width: 0.44,
                          ),
                          CommonButton(
                            text: controller.finalPageButton(),
                            onPress: controller.onNext,
                            width: 0.44,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
