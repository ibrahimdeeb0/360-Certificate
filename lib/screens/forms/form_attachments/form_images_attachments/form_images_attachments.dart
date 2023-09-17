import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';

class FormImagesAttachments extends StatelessWidget {
  const FormImagesAttachments({
    required this.formImagesAttachmentsController,
    super.key,
  });

  final FormImagesAttachmentsController formImagesAttachmentsController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormImagesAttachmentsController>(
      init: formImagesAttachmentsController,
      global: false,
      builder: (FormImagesAttachmentsController controller) {
        return Scaffold(
          appBar: const Header(
            title: 'Images & Notes',
            withShadow: true,
            // actionItem: ActionItem(type: ActionType.save),
            // onPressSave: () {
            //   Get.back();
            // },
          ),
          floatingActionButton: Visibility(
            visible: controller.imagesData.isNotEmpty ||
                controller.tempImagesData.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Get.bottomSheet(
                  PickPhotoBottomSheet(
                    title: 'Select',
                    onCamera: () => controller.pickFormImage(
                        imageSource: ImageSource.camera),
                    onGallery: () => controller.pickFormImage(),
                  ),
                );
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
            child: controller.imagesData.isNotEmpty ||
                    controller.tempImagesData.isNotEmpty
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
                                    fileName: item.imageName!.split('/').last,
                                    isIncluded: item.isNotIncluded,
                                    note: item.note,
                                    onTap: () => pressNote(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                    pressToggleInclude: () =>
                                        pressToggleInclude(
                                            controller: controller,
                                            itemIndex: itemIndex,
                                            item: item),
                                    pressView: () => pressView(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                    pressDelete: () => pressDelete(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                    pressNote: () => pressNote(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                  );
                                },
                              ),
                            if (controller.tempImagesData.isNotEmpty)
                              ...controller.tempImagesData.map(
                                (FormImageClass item) {
                                  final int itemIndex =
                                      controller.tempImagesData.indexOf(item);

                                  return FormAddImageCard(
                                    fileName: item.imageName!.split('/').last,
                                    isIncluded: item.isNotIncluded,
                                    note: item.note,
                                    onTap: () => pressNote(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                    pressToggleInclude: () =>
                                        pressToggleInclude(
                                            controller: controller,
                                            itemIndex: itemIndex,
                                            item: item),
                                    pressView: () => pressView(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                    pressDelete: () => pressDelete(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                    pressNote: () => pressNote(
                                        controller: controller,
                                        itemIndex: itemIndex,
                                        item: item),
                                  );
                                },
                              ),
                          ],
                        ),
                        0.1.boxHeight
                      ],
                    ),
                  )
                : ImagesEmptyMessage(
                    onPress: () {
                      Get.bottomSheet(
                        PickPhotoBottomSheet(
                          title: 'Select',
                          onCamera: () => controller.pickFormImage(
                              imageSource: ImageSource.camera),
                          onGallery: () => controller.pickFormImage(),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }

  void pressToggleInclude({
    required FormImagesAttachmentsController controller,
    required FormImageClass item,
    required int itemIndex,
  }) {
    controller.imagesData[itemIndex].isNotIncluded = !item.isNotIncluded;
    controller.update();
  }

  //
  void pressView({
    required FormImagesAttachmentsController controller,
    required FormImageClass item,
    required int itemIndex,
  }) {
    Get.dialog(
      ViewImageContainer(
        imagePath: item.imageURL,
        // isFullScreen: true,
      ),
    );
  }

  //
  void pressDelete({
    required FormImagesAttachmentsController controller,
    required FormImageClass item,
    required int itemIndex,
  }) {
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
        controller.update();
      },
      title: '',
    );
  }

  //
  void pressNote({
    required FormImagesAttachmentsController controller,
    required FormImageClass item,
    required int itemIndex,
  }) {
    // controller.noteController.clear();
    if (item.note != null) {
      controller.noteController.text = item.note!;
    }
    Get.to(
      () => FormImagesWriteNote(
        formImagesAttachmentsController: controller,
        index: itemIndex,
      ),
    );
  }
}

class ImagesEmptyMessage extends StatelessWidget {
  const ImagesEmptyMessage({
    super.key,
    this.onPress,
  });
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          onPress: onPress,
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
    this.note,
    this.onTap,
  });

  final String? fileName;
  final Function()? pressView;
  final Function()? pressDelete;
  final Function()? pressNote;
  final Function()? pressToggleInclude;
  final bool isIncluded;
  final String? note;
  final dynamic Function()? onTap;
  @override
  Widget build(BuildContext context) {
    // consoleLog(note, key: 'note');
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
              value: note,
              height: 0.12,
              maxLines: 60,
              enabled: false,
              onTap: onTap,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
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
