import 'package:image_picker/image_picker.dart';

import '../../../general_exports.dart';

class AddNewNotesController extends GetxController {
  TextEditingController titleNote = TextEditingController();
  TextEditingController detailsNote = TextEditingController();
  int? certId;
  int? noteId;

  NoteType? status;

  List<AttachImageClass>? attachmentImages;
  List<XFile> selectedImages = <XFile>[];
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    status = Get.arguments[keyStatus];
    if (status == NoteType.noteNew) {
      certId = Get.arguments[keyId];
    } else if (status == NoteType.noteUpdate) {
      noteId = Get.arguments['id_note'];
    }

    update();
  }

  void onPressSave() {
    validationInputs();

    if (Get.arguments[keyId] == NoteType.noteNew) {
      validationInputs();
    } else if (Get.arguments[keyId] == NoteType.noteUpdate) {
      onSave();
    }
  }

  void validationInputs() {
    if ((titleNote.text.isNotEmpty) && detailsNote.text.isNotEmpty) {
      onSave();
    } else {
      showMessage(
        description: 'Title and details are required for create notes',
      );
    }
  }

  Future<void> onSave() async {
    hideKeyboard();
    startLoading();
    final Map<String, dynamic> bodyObject = <String, dynamic>{
      keyTitle: titleNote.text.trim(),
      'body': detailsNote.text.trim(),
    };
    if (status == NoteType.noteNew) {
      ApiRequest(
              shouldShowMessage: false,
              method: ApiMethods.post,
              path: '/certificates/$certId/notes/create',
              className: 'RegisterController/onCreateNote',
              requestFunction: onSave,
              // withLoading: true,
              body: selectedImages.isEmpty
                  ? bodyObject
                  : await customerServiceFormData(
                      jsonObject: bodyObject,
                      files: selectedImages,
                      fileKey: 'note_files',
                    )
              // await addFormDataToJson(
              //     file: selectedImages,
              //     jsonObject: bodyObject,
              //     fileKey: 'note_files',
              //   ),
              )
          .request(
        onSuccess: (dynamic data, dynamic response) {
          if (Get.isRegistered<CertificateDetailsController>()) {
            Get.find<CertificateDetailsController>().getCompetedCert();
          }
          Get.back();
          // update();
        },
        onError: (dynamic error) {
          dismissLoading();
        },
      );
    } else if (status == NoteType.noteNew) {
      ApiRequest(
        shouldShowMessage: false,
        method: ApiMethods.post,
        path: '/certificates/$certId/notes/create',
        className: 'RegisterController/onCreateNote',
        requestFunction: onSave,
        // withLoading: true,
        body: <String, dynamic>{
          keyTitle: titleNote.text.trim(),
          'body': detailsNote.text.trim(),
          'note_files': '',
        },
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          if (Get.isRegistered<CertificateDetailsController>()) {
            Get.find<CertificateDetailsController>().getCompetedCert();
          }
          Get.back();
          // update();
        },
        onError: (dynamic error) {
          dismissLoading();
        },
      );
    }
  }

  Future<void> pickImage({dynamic fromGallery, AttachType? attachType}) async {
    hideKeyboard();
    XFile? file;
    if (attachType == AttachType.image) {
      file = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 30,
      );
    } else if (attachType == AttachType.video) {
      file = await _picker.pickVideo(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
        maxDuration: const Duration(
          minutes: 1,
        ),
      );
    }

    consoleLog(file!.path, key: 'picked_Image');
    selectedImages.add(file);

    if (selectedImages.where((XFile img) => img.path == file?.path).isEmpty) {
      attachmentImages!.add(
        AttachImageClass(
          file: file,
          onPress: () {
            attachmentImages!.removeWhere(
                (AttachImageClass element) => element.file == file);
            selectedImages
                .removeWhere((XFile element) => element.path == file?.path);
            update();
            consoleLog(selectedImages, key: 'selectedImages');
          },
        ),
      );
      selectedImages.add(file);
    }

    consoleLog(selectedImages, key: 'selected_Images');
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    update();
  }

  void onRemoveImage(XFile file) {
    if (selectedImages.where((XFile img) => img.path == file.path).isNotEmpty) {
      selectedImages.removeWhere((XFile element) => element.path == file.path);
      update();
      consoleLog(selectedImages, key: 'selectedImages');
    }
  }
}
