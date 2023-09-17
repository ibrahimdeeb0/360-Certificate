import 'dart:math';

import '../../../../../general_exports.dart';

class FormNotesWriteNote extends StatelessWidget {
  const FormNotesWriteNote({
    required this.formNotesAttachmentsController,
    this.index,
    this.isUpdateNote = false,
    super.key,
  });

  final FormNotesAttachmentsController formNotesAttachmentsController;
  final bool isUpdateNote;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: 'Notes',
        withShadow: true,
      ),
      body: GetBuilder<FormNotesAttachmentsController>(
        init: formNotesAttachmentsController,
        builder: (FormNotesAttachmentsController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Stack(
              children: <Widget>[
                CommonInput(
                  hint: 'note...',
                  maxLines: 60,
                  height: 0.7,
                  marginTop: 0.02,
                  // textInputAction: TextInputAction.newline,
                  controller: controller.noteController,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CommonContainer(
                    paddingBottom: 0.02,
                    paddingTop: 0.01,
                    width: 1,
                    backgroundColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CommonButton(
                          onPress: Get.back,
                          text: 'Cancel',
                          width: 0.45,
                          backgroundColor: Colors.white,
                          fontColor: AppColors.primary,
                          borderWidth: 1,
                          borderColor: AppColors.primary,
                        ),
                        CommonButton(
                          onPress: () {
                            hideKeyboard();

                            if (isUpdateNote) {
                              controller.notesData[index!].note =
                                  controller.noteController.text.trim();
                              controller.noteController.clear();
                              controller.update();
                              Get.back();
                            } else if (controller.noteController.text
                                .trim()
                                .isNotEmpty) {
                              final Random random = Random();
                              final int randomNumber = random.nextInt(1000000);
                              controller.notesData.insert(
                                0,
                                FormNoteClass(
                                  id: randomNumber,
                                  note: controller.noteController.text.trim(),
                                  type: 'Certificate Note',
                                  onPress: () {
                                    controller.notesData.removeWhere(
                                      (FormNoteClass element) =>
                                          element.id == randomNumber,
                                    );
                                  },
                                ),
                              );

                              controller.noteController.clear();
                              controller.update();
                              Get.back();
                            } else {
                              Get.back();
                            }
                          },
                          text: 'Save',
                          width: 0.45,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
