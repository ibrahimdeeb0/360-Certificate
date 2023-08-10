import '../../../../general_exports.dart';

class EditCertNoteController extends GetxController {
  dynamic noteData;
  int? certId;

  FormNoteClass? noteClass;

  List<String> dropdownItemsClass = <String>[
    'Private Certificate Note',
    'Certificate Note',
  ];

  TextEditingController noteController = TextEditingController();

  @override
  void onInit() {
    noteData = Get.arguments[keyData];
    certId = Get.arguments[keyId];
    onSetNoteData();
    super.onInit();
  }

  void onSetNoteData() {
    noteClass = FormNoteClass(
      id: noteData[keyId],
      note: noteData['note_body'],
      type: noteData['exclude'] == 'yes'
          ? 'Certificate Note'
          : 'Private Certificate Note',
      onPress: () {
        //?-------Delete Attachment from database-------------//
        ApiRequest(
          path: '/certificates/delete/${noteData[keyId]}/attachment',
          method: ApiMethods.post,
          className: 'FormNotesAttachmentsController/onSetFormAttachments',
          requestFunction: onSetNoteData,
          withLoading: true,
          body: <String, dynamic>{},
        ).request(
          onSuccess: (dynamic data, dynamic response) {
            if (Get.isDialogOpen!) {
              Get.back();
            }
            if (Get.isRegistered<CertificateDetailsController>()) {
              Get.find<CertificateDetailsController>().certId = certId!;
              Get.find<CertificateDetailsController>().getCertificateDetails();
            }
            Get.back();
          },
        );
        //-------------------//
      },
    );
  }

  void onUpdateImageAttach() {
    ApiRequest(
      path: '/certificates/attachment/${noteData['id']}/update',
      method: ApiMethods.post,
      className: 'MinorWorksController/pickFormImage',
      requestFunction: onUpdateImageAttach,
      withLoading: true,
      body: <String, dynamic>{
        'certificate_id': certId,
        'exclude': noteClass!.type == 'Certificate Note' ? 'yes' : 'no',
        // 'note_title': '',
        'note_body': noteClass!.note,
        'attachment_type_id': 2,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        if (Get.isRegistered<CertificateDetailsController>()) {
          Get.find<CertificateDetailsController>().certId =
              Get.arguments[keyId];
          Get.find<CertificateDetailsController>().getCertificateDetails();
        }
        Get.back();
      },
    );
  }
}
