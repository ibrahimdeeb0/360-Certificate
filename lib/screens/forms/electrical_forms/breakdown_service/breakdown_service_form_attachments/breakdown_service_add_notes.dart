import '../../../../../general_exports.dart';

class BreakdownServiceAddNote extends StatelessWidget {
  const BreakdownServiceAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakdownServiceAttachmentsController>(
      init: BreakdownServiceAttachmentsController(),
      builder: (BreakdownServiceAttachmentsController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Notes',
            withShadow: true,
            actionItem: ActionItem(
              type: ActionType.save,
            ),
            onPressSave: () {},
          ),
          floatingActionButton: Visibility(
            visible: controller.notesData.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(() => const MinorWriteNote());
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
            child: controller.notesData.isNotEmpty
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
                                    pressDelete: () {
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
                                          controller.notesData
                                              .removeAt(itemIndex);
                                          controller.update();
                                        },
                                        title: '',
                                      );
                                    },
                                    pressView: () {
                                      controller.noteController.text =
                                          item.note!;
                                      controller.update();
                                      Get.to(
                                        () => const MinorWriteNote(
                                          isUpdateNote: true,
                                        ),
                                        arguments: <String, dynamic>{
                                          'index': itemIndex,
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            0.09.boxHeight,
                          ],
                        ),
                      ],
                    ),
                  )
                : Column(
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
                        onPress: () {
                          Get.to(() => const MinorWriteNote());
                        },
                        text: 'Add a Note',
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
