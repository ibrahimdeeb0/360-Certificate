import '../../../general_exports.dart';

class AddNewNotesController extends GetxController {
  TextEditingController titleNote = TextEditingController();
  TextEditingController detailsNote = TextEditingController();
  int? certId;

  @override
  void onInit() {
    super.onInit();
    certId = Get.arguments[keyId];
  }

  void onPressSave() {
    validationInputs();

    if (Get.arguments[keyId] == NoteType.noteNew) {
      validationInputs();
    } else if (Get.arguments[keyId] == NoteType.noteUpdate) {
      onCreateNote();
    }
  }

  void validationInputs() {
    if ((titleNote.text.isNotEmpty) && detailsNote.text.isNotEmpty) {
      onCreateNote();
    } else {
      showMessage(
        description: 'Title and details are required for create notes',
      );
    }
  }

  void onCreateNote() {
    hideKeyboard();
    startLoading();
    ApiRequest(
      shouldShowMessage: false,
      method: ApiMethods.post,
      path: '/certificates/$certId/notes/create',
      className: 'RegisterController/onCreateNote',
      requestFunction: onCreateNote,
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
