import 'package:image_picker/image_picker.dart';

import '../../../../general_exports.dart';

class EditCertDetailsNoteController extends GetxController {
  TextEditingController titleNote = TextEditingController();
  TextEditingController detailsNote = TextEditingController();
  int? certId;
  int? noteId;
  NoteType? status;
  XFile? selectedImages;

  Map<String, dynamic>? noteData;

  int? imgId;
  String? imgUrl;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    certId = Get.arguments[keyId];
    status = Get.arguments[keyStatus];

    noteData = Get.arguments[keyData];

    if (status == NoteType.noteUpdate) {
      titleNote.text = noteData?['note_title'];
      detailsNote.text = noteData?['note_body'];
      if (noteData?['image'] != null) {
        imgId = noteData?['image_id'];
        imgUrl = noteData?['image']['file_url'];
      }
    }

    update();

    super.onInit();
  }

  void onPressSave() {
    hideKeyboard();
    if ((titleNote.text.isNotEmpty) && detailsNote.text.isNotEmpty) {
      onPressSaveNote();
    } else {
      showMessage(
        description: 'Title and details are required for create note',
      );
    }
  }

  Future<void> pickImage(
      {ImageSource imageSource = ImageSource.gallery}) async {
    hideKeyboard();
    final XFile? file = await _picker.pickImage(
      source: imageSource,
      imageQuality: 30,
    );
    if (file != null) {
      selectedImages = file;

      ApiRequest(
        path: '/store-image',
        method: ApiMethods.post,
        className: 'EditCertDetailsNoteController/pickImage',
        requestFunction: pickImage,
        withLoading: true,
        body: await imageAsFormData(
          fileKey: 'image',
          file: selectedImages,
        ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          imgId = data[keyId];
          imgUrl = data['file_url'];
          update();
        },
      );
    } else {
      showMessage(
        description: 'No image has been uploaded',
        textColor: Colors.red[800],
      );
    }

    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    update();
  }

  void onPressSaveNote() {
    ApiRequest(
      method: ApiMethods.post,
      path: status == NoteType.noteNew
          ? '/certificates/create/attachment'
          : '/certificates/attachment/${noteData?['id']}/update',
      className: 'EditCertDetailsNoteController/onSaveNoteCert',
      requestFunction: onPressSaveNote,
      withLoading: true,
      body: <String, dynamic>{
        'certificate_id': certId,
        if (imgId != null) 'image_id': imgId,
        'note_title': titleNote.text.trim(),
        'note_body': detailsNote.text.trim(),
        'attachment_type_id': 3,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        update();
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        if (Get.isRegistered<CertificateDetailsController>()) {
          Get.find<CertificateDetailsController>().getCertificateDetails();
        }
        Get.back();
      },
    );
  }

  void onRemoveImage() {
    ApiRequest(
      path: '/delete-image/$imgId',
      method: ApiMethods.post,
      className: 'MinorWorksController/pickFormImage',
      requestFunction: onRemoveImage,
      withLoading: true,
      body: <String, dynamic>{},
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        imgId = null;
        imgUrl = null;
        update();
        ApiRequest(
          method: ApiMethods.post,
          path: status == NoteType.noteNew
              ? '/certificates/create/attachment'
              : '/certificates/attachment/${noteData?['id']}/update',
          className: 'EditCertDetailsNoteController/onSaveNoteCert',
          requestFunction: onPressSaveNote,
          withLoading: true,
          body: <String, dynamic>{
            'certificate_id': certId,
            if (imgId != null) 'image_id': imgId,
            'note_title': titleNote.text.trim(),
            'note_body': detailsNote.text.trim(),
            'attachment_type_id': 3,
          },
        ).request(
          onSuccess: (dynamic data, dynamic response) {
            update();
          },
        );
      },
    );
  }
}
