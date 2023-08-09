import '../../../../general_exports.dart';

class FormNoteClass {
  FormNoteClass({
    required this.id,
    this.note,
    this.type,
    this.onPress,
  });

  int id;
  String? note;
  String? type;
  final Function()? onPress;
}

class FormNotesAttachmentsController extends GetxController {
  int? certId;

  List<FormNoteClass> notesData = <FormNoteClass>[];
  List<FormNoteClass> tempMotesData = <FormNoteClass>[];
  TextEditingController noteController = TextEditingController();

  // String selectedNoteType = 'Private Certificate Note';
  List<String> dropdownItemsClass = <String>[
    'Private Certificate Note',
    'Certificate Note',
  ];

  List<dynamic> certAttachments = <dynamic>[];
  bool isAttachmentsAdding = false;

  @override
  void onInit() {
    consoleLog(certId, key: 'certId');
    if (!isAttachmentsAdding) {
      getCertAttachments();
    }
    super.onInit();
  }

  // **************  Get Form Attachments From Certificate Details ********//
  Future<void> onSetFormAttachments() async {
    hideKeyboard();
    // notesData.clear();
    if (certAttachments.isNotEmpty) {
      for (Map<String, dynamic> item in certAttachments) {
        if (item['attachment_type_id'] == 2) {
          tempMotesData.insert(
            0,
            FormNoteClass(
              id: item[keyId],
              note: item['note_body'],
              type: item['exclude'] == 'yes'
                  ? 'Certificate Note'
                  : 'Private Certificate Note',
              onPress: () {
                //?-------Delete Attachment from database-------------//
                ApiRequest(
                  path: '/certificates/delete/${item[keyId]}/attachment',
                  method: ApiMethods.post,
                  className:
                      'FormNotesAttachmentsController/onSetFormAttachments',
                  requestFunction: onSetFormAttachments,
                  withLoading: true,
                  body: <String, dynamic>{},
                ).request(
                  onSuccess: (dynamic data, dynamic response) {
                    tempMotesData.removeWhere(
                      (FormNoteClass element) =>
                          element.note == item['note_body'],
                    );
                    update();
                  },
                );
                //-------------------//
              },
            ),
          );
        } else {
          continue;
        }
      }
    }
  }

  Future<void> getCertAttachments() async {
    hideKeyboard();

    ApiRequest(
      path: '/certificates/$certId/get-attachments',
      className: 'FormNotesAttachmentsController/getCertAttachments',
      requestFunction: getCertAttachments,
      withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        certAttachments = data;
        isAttachmentsAdding = true;
        onSetFormAttachments();
        update();
      },
    );
  }
}
