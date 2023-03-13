import 'package:image_picker/image_picker.dart';

import '../../../general_exports.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewNotesController>(
      init: AddNewNotesController(),
      builder: (AddNewNotesController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Add New Note',
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: controller.onPressSave,
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                  CommonInput(
                    hint: 'Title',
                    marginBottom: 0.02,
                    controller: controller.titleNote,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                  ),
                  CommonInput(
                    hint: 'Typing...',
                    controller: controller.detailsNote,
                    textInputAction: TextInputAction.newline,
                    maxLines: 14,
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'Add Photo',
                    onPress: () {
                      Get.bottomSheet(
                        PickPhotoBottomSheet(
                          controller: Get.find<AddNewNotesController>(),
                          title: 'Add Photo',
                          onGallery: () => controller.pickImage(
                            fromGallery: true,
                            attachType: AttachType.image,
                          ),
                          onCamera: () => controller.pickImage(
                            fromGallery: false,
                            attachType: AttachType.image,
                          ),
                        ),
                      );
                    },
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rightChild: const Icon(Icons.image_outlined),
                    containerStyle: appContainerStyles.cardStyle,
                  ),

                  // 0.02.ph,
                  if (controller.selectedImages.isNotEmpty)
                    GridView.builder(
                      padding: EdgeInsets.only(
                        bottom: DEVICE_HEIGHT * 0.02,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.selectedImages.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: DEVICE_HEIGHT * 0.17,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final XFile item = controller.selectedImages[index];
                        return AttachContainer(
                          imagePath: item.path,
                          isAddedImage: true,
                          onRemoveImage: () => controller.onRemoveImage(item),
                        );
                      },
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
