import '../../../../general_exports.dart';

class EditCertNote extends StatelessWidget {
  const EditCertNote({
    super.key,
    this.noteData,
  });
  final dynamic noteData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCertNoteController>(
      init: EditCertNoteController(),
      builder: (EditCertNoteController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Edit Note',
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
                FormAddNoteCard(
                  note: controller.noteClass!.note,
                  dropdownMenu: DropdownButton<String>(
                    isExpanded: true,
                    value: controller.noteClass!.type,
                    dropdownColor: Colors.white,
                    onChanged: (String? newValue) {
                      controller.noteClass!.type = newValue;
                      controller.update();
                    },
                    items: controller.dropdownItemsClass
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: CommonText(
                            value,
                            fontColor: Colors.grey[800],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  pressView: () => pressView(
                    controller: controller,
                    item: controller.noteClass!,
                  ),
                  pressDelete: () => pressDelete(
                    controller: controller,
                    item: controller.noteClass!,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void pressView({
    required EditCertNoteController controller,
    required FormNoteClass item,
  }) {
    controller.noteController.text = item.note!;
    controller.update();

    /* Get.to(
      () => FormNotesWriteNote(
        formNotesAttachmentsController: controller,
        index: itemIndex,
        isUpdateNote: true,
      ),
    ); */
  }

  void pressDelete({
    required EditCertNoteController controller,
    required FormNoteClass item,
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
}
