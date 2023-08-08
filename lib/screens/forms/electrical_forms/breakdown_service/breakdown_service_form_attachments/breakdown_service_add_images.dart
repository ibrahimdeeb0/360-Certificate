import '../../../../../general_exports.dart';

class BreakdownServiceAddImage extends StatelessWidget {
  const BreakdownServiceAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceAttachmentsController>(
      init: BreakdownServiceAttachmentsController(),
      builder: (BreakdownServiceAttachmentsController controller) {
        return Scaffold(
            appBar: Header(
              title: 'Images & Notes',
              withShadow: true,
              actionItem: ActionItem(type: ActionType.save),
              onPressSave: () {},
            ),
            floatingActionButton: Visibility(
              visible: controller.imagesData.isNotEmpty,
              child: FloatingActionButton(
                onPressed: () {
                  controller.pickImage();
                },
                backgroundColor: Color(AppColors.primary),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            body: CommonContainer(
                style: appContainerStyles.containerStyles,
                paddingTop: 0.02,
                child: controller.imagesData.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CommonText(
                                  'Uploaded Images',
                                  fontColor: AppColors.primary,
                                  fontSize: fontH2,
                                  marginBottom: 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                                if (controller.imagesData.isNotEmpty)
                                  ...controller.imagesData.map(
                                    (FormImageClass item) {
                                      final int itemIndex =
                                          controller.imagesData.indexOf(item);

                                      return FormAddImageCard(
                                        // fileName: item.file.path
                                        //     .split('/')
                                        //     .last
                                        //     .split('picker')
                                        //     .last,
                                        // imagePath: item.file.path,
                                        pressToggleInclude: () {
                                          controller.imagesData[itemIndex]
                                              .isIncluded = !item.isIncluded;
                                          controller.update();
                                        },
                                        isIncluded: item.isIncluded,
                                        pressView: () {
                                          // Get.dialog(
                                          //   ViewImageContainer(
                                          //     imagePath: item.file.path,
                                          //     imageType: ImageFormatType.local,
                                          //     isFullScreen: true,
                                          //   ),
                                          // );
                                        },
                                        pressDelete: () {
                                          openDialog(
                                            child: CommonText(
                                              'Are You Sure want to Delete?',
                                              marginTop: 0.02,
                                              topChild: Icon(
                                                Icons.delete,
                                                size: 0.07.flexAll,
                                                color: Colors.red[900],
                                              ),
                                            ),
                                            onCancel: () {
                                              if (Get.isDialogOpen!) {
                                                Get.back();
                                              }
                                            },
                                            onConfirm: () {
                                              if (Get.isDialogOpen!) {
                                                Get.back();
                                              }
                                              item.onPress?.call();
                                            },
                                            title: '',
                                          );
                                        },
                                        pressNote: () {
                                          if (item.note == null) {
                                            Get.to(
                                              () => const MinorWriteNote(
                                                fromImage: true,
                                              ),
                                              arguments: <String, dynamic>{
                                                'index': itemIndex,
                                              },
                                            );
                                          } else {
                                            controller.noteController.text =
                                                item.note!;
                                            Get.to(
                                              () => const MinorWriteNote(
                                                fromImage: true,
                                              ),
                                              arguments: <String, dynamic>{
                                                'index': itemIndex,
                                              },
                                            );
                                          }
                                        },
                                        note: item.note,
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: <Widget>[
                          CommonText(
                            'Uploaded Images',
                            fontColor: AppColors.primary,
                            fontSize: fontH2,
                            marginBottom: 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                          CommonText(
                            'No data available',
                            fontColor: Colors.grey[700],
                            marginBottom: 0.1,
                          ),
                          CommonButton(
                            onPress: () {
                              controller.pickImage();
                            },
                            child: const CommonText(
                              'Upload Image',
                              fontColor: Colors.white,
                              leftChild: Icon(
                                Icons.file_upload_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )));
      },
    );
  }
}
