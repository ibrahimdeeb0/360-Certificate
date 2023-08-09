import '../../../../../general_exports.dart';

class FormNotesAttachments extends StatelessWidget {
  const FormNotesAttachments({
    required this.formNotesAttachmentsController,
    super.key,
  });

  final FormNotesAttachmentsController formNotesAttachmentsController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormNotesAttachmentsController>(
      init: formNotesAttachmentsController,
      global: false,
      builder: (FormNotesAttachmentsController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Notes',
            withShadow: true,
            // actionItem: ActionItem(
            //   type: ActionType.save,
            // ),
            // onPressSave: () {
            //   Get.back();
            // },
          ),
          floatingActionButton: Visibility(
            visible: controller.notesData.isNotEmpty ||
                controller.tempMotesData.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(
                  () => FormNotesWriteNote(
                    formNotesAttachmentsController: controller,
                  ),
                );
                // Get.to(() => const MinorWriteNote());
                // consoleLog(controller.notesData);
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
            child: (controller.notesData.isNotEmpty ||
                    controller.tempMotesData.isNotEmpty)
                ? SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            CommonText(
                              'Add a Notes',
                              fontColor: AppColors.primary,
                              fontSize: fontH2,
                              marginBottom: 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            if (controller.notesData.isNotEmpty)
                              ...controller.notesData.map(
                                (FormNoteClass item) {
                                  final int itemIndex =
                                      controller.notesData.indexOf(item);
                                  return FormAddNoteCard(
                                    note: item.note,
                                    dropdownMenu: DropdownButton<String>(
                                      isExpanded: true,
                                      value: item.type,
                                      dropdownColor: Colors.white,
                                      onChanged: (String? newValue) {
                                        item.type = newValue;
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
                                      itemIndex: itemIndex,
                                      item: item,
                                    ),
                                    pressDelete: () => pressDelete(
                                      controller: controller,
                                      itemIndex: itemIndex,
                                      item: item,
                                    ),
                                  );
                                },
                              ),
                            if (controller.tempMotesData.isNotEmpty)
                              ...controller.tempMotesData.map(
                                (FormNoteClass item) {
                                  final int itemIndex =
                                      controller.tempMotesData.indexOf(item);
                                  return FormAddNoteCard(
                                    note: item.note,
                                    dropdownMenu: DropdownButton<String>(
                                      isExpanded: true,
                                      value: item.type,
                                      dropdownColor: Colors.white,
                                      onChanged: (String? newValue) {
                                        item.type = newValue;
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
                                      itemIndex: itemIndex,
                                      item: item,
                                    ),
                                    pressDelete: () => pressDelete(
                                      controller: controller,
                                      itemIndex: itemIndex,
                                      item: item,
                                    ),
                                  );
                                },
                              ),
                            0.09.boxHeight,
                          ],
                        ),
                      ],
                    ),
                  )
                : NotesEmptyMessage(
                    onPress: () {
                      Get.to(
                        () => FormNotesWriteNote(
                          formNotesAttachmentsController: controller,
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }

  void pressView({
    required FormNotesAttachmentsController controller,
    required FormNoteClass item,
    required int itemIndex,
  }) {
    controller.noteController.text = item.note!;
    controller.update();

    Get.to(
      () => FormNotesWriteNote(
        formNotesAttachmentsController: controller,
        index: itemIndex,
        isUpdateNote: true,
      ),
    );
  }

  void pressDelete({
    required FormNotesAttachmentsController controller,
    required FormNoteClass item,
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
}

class NotesEmptyMessage extends StatelessWidget {
  const NotesEmptyMessage({
    super.key,
    this.onPress,
  });
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        0.02.boxHeight,
        CommonText(
          'Add a Notes',
          fontColor: AppColors.primary,
          fontSize: fontH2,
          marginBottom: 0.02,
        ),
        CommonText(
          'No Notes are added. Add your first note',
          fontColor: Colors.grey[700],
          marginBottom: 0.1,
        ),
        CommonButton(
          onPress: onPress,
          text: 'Add a Note',
        ),
      ],
    );
  }
}

class FormAddNoteCard extends StatelessWidget {
  const FormAddNoteCard({
    super.key,
    this.note,
    this.type,
    this.pressView,
    this.pressType,
    this.pressDelete,
    this.dropdownMenu,
  });
  final String? note;
  final String? type;
  final Function()? pressView;
  final Function()? pressDelete;
  final Function()? pressType;
  final Widget? dropdownMenu;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderBottomWidth: 2,
      borderBottomColor: Colors.grey[300],
      marginBottom: 0.02,
      paddingBottom: 0.02,
      child: Column(
        children: <Widget>[
          dropdownMenu ?? const SizedBox(),
          CommonInput(
            topLabelText: 'Note:',
            maxLines: 6,
            value: note ?? '',
            enabled: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ],
          ),
        ],
      ),
    );
  }
}
