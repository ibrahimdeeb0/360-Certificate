import '../../../../../general_exports.dart';

class MinorImageNote extends StatelessWidget {
  const MinorImageNote({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Notes',
        withShadow: true,
      ),
      body: GetBuilder<MinorAttachmentsController>(
        init: MinorAttachmentsController(),
        builder: (MinorAttachmentsController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Stack(
              children: <Widget>[
                CommonInput(
                  hint: 'note...',
                  maxLines: 150,
                  height: 0.7,
                  marginTop: 0.02,
                  textInputAction: TextInputAction.newline,
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
                          text: 'Cancel',
                          width: 0.45,
                          backgroundColor: Colors.white,
                          fontColor: AppColors.primary,
                          borderWidth: 1,
                          borderColor: AppColors.primary,
                        ),
                        CommonButton(
                          onPress: () {},
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
