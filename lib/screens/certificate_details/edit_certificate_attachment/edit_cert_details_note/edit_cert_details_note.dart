import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../general_exports.dart';

class EditCertDetailsNote extends StatelessWidget {
  const EditCertDetailsNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCertDetailsNoteController>(
      init: EditCertDetailsNoteController(),
      builder: (EditCertDetailsNoteController controller) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      consoleLog(controller.imgUrl);
                      Get.bottomSheet(
                        PickPhotoBottomSheet(
                          title: 'Add Photo',
                          onGallery: () => controller.pickImage(),
                          onCamera: () => controller.pickImage(
                            imageSource: ImageSource.camera,
                          ),
                        ),
                      );
                    },
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rightChild: const Icon(Icons.image_outlined),
                    containerStyle: appContainerStyles.cardStyle,
                  ),
                  if (controller.imgUrl != null)
                    Stack(
                      children: <Widget>[
                        CommonContainer(
                          marginBottom: 0.02,
                          marginTop: 0.02,
                          marginLeft: 0.04,
                          width: 0.25,
                          height: 0.15,
                          borderRadius: 0.015,
                          clipBehavior: Clip.hardEdge,
                          child: CachedImage(
                            image: '${controller.imgUrl}',
                            withPlaceHolder: true,
                            fit: BoxFit.cover,
                            width: 1.flexWidth,
                            height: 1.flexHeight,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.onRemoveImage();
                          },
                          icon: SvgPicture.asset(
                            iconDelete,
                            height: DEVICE_HEIGHT * 0.03,
                            width: DEVICE_WIDTH * 0.043,
                          ),
                        ),
                      ],
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
