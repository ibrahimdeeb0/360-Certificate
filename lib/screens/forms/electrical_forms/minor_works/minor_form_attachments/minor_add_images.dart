import '../../../../../general_exports.dart';

class MinorAddImage extends StatelessWidget {
  const MinorAddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorAttachmentsController>(
      init: MinorAttachmentsController(),
      builder: (MinorAttachmentsController controller) {
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
                                        fileName: item.file.path
                                            .split('/')
                                            .last
                                            .split('picker')
                                            .last,
                                        imagePath: item.file.path,
                                        pressToggleInclude: () {
                                          controller.imagesData[itemIndex]
                                              .isIncluded = !item.isIncluded;
                                          controller.update();
                                        },
                                        isIncluded: item.isIncluded,
                                        pressView: () {
                                          Get.dialog(
                                            ViewImageContainer(
                                              imagePath: item.file.path,
                                              imageType: ImageFormatType.local,
                                              isFullScreen: true,
                                            ),
                                          );
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
                            'Please attach images',
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

class FormAddImageCard extends StatelessWidget {
  const FormAddImageCard({
    super.key,
    this.fileName,
    this.pressView,
    this.pressDelete,
    this.pressNote,
    this.pressToggleInclude,
    this.isIncluded = false,
    this.imagePath,
    this.note,
  });

  final String? fileName;
  final Function()? pressView;
  final Function()? pressDelete;
  final Function()? pressNote;
  final Function()? pressToggleInclude;
  final bool isIncluded;
  final String? imagePath;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          CommonInput(
            topLabelText: 'File Name',
            enabled: false,
            fillColor: Colors.grey[200],
            value: fileName ?? '',
          ),
          if (note != null)
            CommonInput(
              value: note ?? '',
              height: 0.12,
              maxLines: 60,
              enabled: false,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: imagePath ?? '',
                child: TextButton.icon(
                  onPressed: pressView,
                  icon: Icon(
                    Icons.visibility,
                    color: Color(AppColors.primary),
                  ),
                  label: CommonText(
                    'View',
                    style: appTextStyles.h3BoldStyle(),
                  ),
                ),
              ),
              CommonContainer(
                backgroundColor: Colors.grey[400],
                height: 0.03,
                width: 0.005,
              ),
              TextButton.icon(
                onPressed: pressDelete,
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[900],
                ),
                label: CommonText(
                  'Delete',
                  style: appTextStyles.h3BoldStyle(),
                ),
              ),
              CommonContainer(
                backgroundColor: Colors.grey[400],
                height: 0.03,
                width: 0.005,
              ),
              TextButton.icon(
                onPressed: pressNote,
                icon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.orange[700],
                ),
                label: CommonText(
                  'Note',
                  style: appTextStyles.h3BoldStyle(),
                ),
              ),
            ],
          ),
          CommonText(
            'Do Not Include In Pdf',
            rightChild: IconButton(
              onPressed: pressToggleInclude,
              icon: isIncluded
                  ? Icon(
                      Icons.check_box,
                      color: Color(AppColors.primary),
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.grey[400],
                    ),
            ),
            rowMainAxisSize: MainAxisSize.max,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            containerStyle: appContainerStyles.topBottomBorderStyle.copyWith(
              paddingVertical: 0.01,
              marginTop: 0.01,
              marginBottom: 0.02,
              paddingHorizontal: 0,
            ),
          ),
        ],
      ),
    );
  }
}
