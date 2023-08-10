import '../../../../general_exports.dart';

class EditCertImage extends StatelessWidget {
  const EditCertImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCertImageController>(
      init: EditCertImageController(),
      builder: (EditCertImageController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Edit Image',
            withShadow: true,
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: () {
                controller.onUpdateImageAttach();
              },
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            paddingTop: 0.02,
            child: Column(
              children: <Widget>[
                FormAddImageCard(
                  fileName: controller.imageClass?.imageName!.split('/').last,
                  isIncluded: controller.imageClass!.isIncluded,
                  note: controller.imageClass?.note,
                  pressToggleInclude: () => pressToggleInclude(
                    controller: controller,
                  ),
                  pressView: () => pressView(
                      controller: controller, item: controller.imageClass!),
                  pressDelete: () => pressDelete(
                      controller: controller, item: controller.imageClass!),
                  pressNote: () => pressNote(
                      controller: controller, item: controller.imageClass!),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void pressToggleInclude({
    required EditCertImageController controller,
  }) {
    controller.imageClass!.isIncluded = !(controller.imageClass!.isIncluded);
    controller.update();
  }

  //
  void pressView({
    required EditCertImageController controller,
    required FormImageClass item,
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
    required EditCertImageController controller,
    required FormImageClass item,
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
    required EditCertImageController controller,
    required FormImageClass item,
  }) {
    if (item.note != null) {
      controller.noteController.text = item.note!;
    }
    Get.to(
      () => EditCertImageWriteNote(
        editCertImageController: controller,
      ),
    );
  }
}
