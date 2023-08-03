import 'package:image_picker/image_picker.dart';

import '../../../general_exports.dart';

class AddNewNotesController extends GetxController {
  TextEditingController titleNote = TextEditingController();
  TextEditingController detailsNote = TextEditingController();
  int? certId;
  int? noteId;
  List<dynamic> images = <dynamic>[];

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
      titleNote.text = Get.arguments[keyTitle];
      detailsNote.text = Get.arguments[keyDetails];
      images = Get.arguments['images'];
      consoleLogPretty(images, key: 'images');
    }
    consoleLog('certId: $certId || noteId: $noteId || ${Get.arguments}',
        key: 'arguments');
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
      'note_type_id': 0, // 1 type for private
      keyTitle: titleNote.text.trim(),
      'body': detailsNote.text.trim(),
      'files_id': deletedImages,
      'exclude': 'no',
    };
    consoleLog(deletedImages, key: 'deletedImages');
    if (status == NoteType.noteNew) {
      ApiRequest(
        // shouldShowMessage: false,
        method: ApiMethods.post,
        path: '/certificates/$certId/notes/create',
        className: 'RegisterController/onCreateNote',
        requestFunction: onSave,
        formatResponse: true,
        body: selectedImages.isEmpty
            ? bodyObject
            : await uploadArrayToFormData(
                jsonObject: bodyObject,
                imagesArray: selectedImages,
              ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          if (Get.isRegistered<CertificateDetailsController>()) {
            Get.find<CertificateDetailsController>().getCertificateDetails();
          }
          Get.back();
          update();
        },
        onError: (dynamic error) {
          dismissLoading();
        },
      );
    } else if (status == NoteType.noteUpdate) {
      consoleLogPretty(bodyObject);
      ApiRequest(
        // shouldShowMessage: false,
        method: ApiMethods.post,
        path: '/certificates/$noteId/notes/update',
        className: 'RegisterController/onCreateNote',
        requestFunction: onSave,
        withLoading: true,
        formatResponse: true,
        body: selectedImages.isEmpty
            ? bodyObject
            : await uploadArrayToFormData(
                jsonObject: <String, dynamic>{
                  'note_type_id': 0, // 1 type for private
                  keyTitle: titleNote.text.trim(),
                  'body': detailsNote.text.trim(),
                  'exclude': 'no',
                  // 'note_files': <dynamic>[],
                  'files_id[]': deletedImages,
                },
                imagesArray: selectedImages,
              ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          dismissLoading();
          if (Get.isRegistered<CertificateDetailsController>()) {
            Get.find<CertificateDetailsController>().getCertificateDetails();
          }
          Get.back();
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

  List<int> deletedImages = <int>[];
  void onDeleteImage(Map<String, dynamic> image) {
    hideKeyboard();
    // consoleLog(deletedImages.contains(image['id']));
    if (!deletedImages.contains(image['id'])) {
      deletedImages.add(image['id']);
    }
    consoleLog(deletedImages);
    images.removeWhere((dynamic item) => item[keyId] == image[keyId]);
    update();
  }
}
