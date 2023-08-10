import '../../../../../general_exports.dart';

class FormCertWriteNote extends StatelessWidget {
  const FormCertWriteNote({
    required this.editCertNoteController,
    this.index,
    this.isUpdateNote = false,
    super.key,
  });

  final EditCertNoteController editCertNoteController;
  final bool isUpdateNote;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Notes',
        withShadow: true,
      ),
      body: GetBuilder<EditCertNoteController>(
        init: editCertNoteController,
        builder: (EditCertNoteController controller) {
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

                            if (controller.noteController.text
                                .trim()
                                .isNotEmpty) {
                              if (isUpdateNote) {
                                controller.noteClass!.note =
                                    controller.noteController.text.trim();
                              }

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
