import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';

class WarningNoticePage0 extends StatelessWidget {
  const WarningNoticePage0({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WarningNoticeController>(
      init: WarningNoticeController(),
      builder: (WarningNoticeController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              paddingHorizontal: 0.0,
              paddingTop: 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ApplianceSectionTitle(
                    title: 'PART 1: IMPORTANT SAFETY INFORMATION',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          topLabelText: 'Make Model',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart1]
                              [formKeyImportantSafetyMakeModel],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart1,
                                  formKeyImportantSafetyMakeModel, value),
                        ),
                        CommonInput(
                          topLabelText: 'Type',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart1]
                              [formKeyImportantSafetyType],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart1,
                                  formKeyImportantSafetyType, value),
                        ),
                        CommonInput(
                          topLabelText: 'Serial Number',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart1]
                              [formKeyImportantSafetySerialNumber],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart1,
                                  formKeyImportantSafetySerialNumber, value),
                        ),
                        CommonInput(
                          topLabelText: 'Location',
                          marginBottom: 0.012,
                          value: controller.formData[formKeyPart1]
                              [formKeyImportantSafetyLocation],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart1,
                                  formKeyImportantSafetyLocation, value),
                        ),
                        0.025.ph,
                      ],
                    ),
                  ),
                  ApplianceSectionTitle(
                    title: 'PART 2: IMMEDIATELY DANGEROUS BECAUSE',
                    color: Colors.grey[800],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonInput(
                          topLabelText: 'Location',
                          textInputAction: TextInputAction.done,
                          value: controller.formData[formKeyPart2]
                              [formKeyImmediatelyLocation],
                          onChanged: (dynamic value) =>
                              controller.onChangeFormDataValue(formKeyPart2,
                                  formKeyImmediatelyLocation, value),
                        ),
                        const CommonText(
                          'Add a photo of (ID) or (AR) situation to Certificate',
                          fontSize: fontH3,
                          fontWeight: FontWeight.bold,
                          marginTop: 0.02,
                          marginBottom: 0.01,
                          textAlign: TextAlign.start,
                        ),
                        Center(
                          child: AttachContainer(
                            isCamera: true,
                            width: 0.4,
                            height: 0.2,
                            onAddImage: () {
                              controller.pickImage(ImageSource.camera);
                            },
                            onRemoveImage: controller.removeImage,
                            isAddedImage: controller.selectedImage != null,
                            imagePath: controller.selectedImage?.path,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
