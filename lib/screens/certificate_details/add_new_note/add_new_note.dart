import 'package:flutter_svg/svg.dart';
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
                  if (controller.images.isNotEmpty)
                    GridView.builder(
                      padding: EdgeInsets.only(
                        bottom: DEVICE_HEIGHT * 0.02,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.images.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: DEVICE_HEIGHT * 0.17,
                        // crossAxisSpacing: DEVICE_HEIGHT * 0.01,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            CommonContainer(
                              borderRadius: 0.02,
                              backgroundColor: Colors.black12,
                              marginTop: 0.015,
                              marginHorizontal: 0.02,
                              width: 0.25,
                              height: 0.15,
                              marginBottom: 0.02,
                              clipBehavior: Clip.hardEdge,
                              marginRight: 0.02,
                              child: CachedImage(
                                image: '${controller.images[index]['url']}',
                                withPlaceHolder: true,
                                fit: BoxFit.cover,
                                width: 1.flexWidth,
                                height: 1.flexHeight,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: CommonContainer(
                                onPress: () {
                                  // consoleLogPretty(controller.images);
                                  controller
                                      .onDeleteImage(controller.images[index]);
                                },
                                touchEffect: TouchableEffect(
                                    type: TouchTypes.scaleAndFade),
                                child: SvgPicture.asset(
                                  iconDelete,
                                  height: DEVICE_HEIGHT * 0.03,
                                  width: DEVICE_WIDTH * 0.043,
                                ),
                              ),
                            ),
                          ],
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
