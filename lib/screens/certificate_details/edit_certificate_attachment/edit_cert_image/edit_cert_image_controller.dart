import '../../../../general_exports.dart';

class EditCertImageController extends GetxController {
  dynamic imageData;
  FormImageClass? imageClass;

  TextEditingController noteController = TextEditingController();

  @override
  void onInit() {
    imageData = Get.arguments[keyData];

    consoleLogPretty(imageData);

    onSetFormAttachments();

    super.onInit();
  }

  Future<void> onSetFormAttachments() async {
    imageClass = FormImageClass(
      imageId: imageData['image']['id'],
      imageName: imageData['image']['image'],
      imageURL: imageData['image']['file_url'],
      isIncluded: !(imageData['exclude'] == 'yes'),
      note: imageData['note_body'] ?? '',
      onPress: () {
        startLoading();
        //*-------Delete Image from database-------------//
        // API for delete image
        ApiRequest(
          path: '/delete-image/${imageData['image']['id']}',
          method: ApiMethods.post,
          className: 'MinorWorksController/pickFormImage',
          requestFunction: onSetFormAttachments,
          // withLoading: true,
          body: <String, dynamic>{},
        ).request(
          onSuccess: (dynamic data, dynamic response) {
            //?-------Delete Attachment from database-------------//
            ApiRequest(
              path: '/certificates/delete/${imageData[keyId]}/attachment',
              method: ApiMethods.post,
              className: 'MinorWorksController/pickFormImage',
              requestFunction: onSetFormAttachments,
              withLoading: true,
              body: <String, dynamic>{},
            ).request(
              onSuccess: (dynamic data, dynamic response) {
                if (Get.isDialogOpen!) {
                  Get.back();
                }
                if (Get.isRegistered<CertificateDetailsController>()) {
                  Get.find<CertificateDetailsController>().certId =
                      Get.arguments[keyId];
                  Get.find<CertificateDetailsController>()
                      .getCertificateDetails();
                }
                Get.back();
              },
            );
            //-------------------//
          },
        );
      },
    );
    update();
  }

  void onUpdateImageAttach() {
    ApiRequest(
      path: '/certificates/attachment/${imageData['id']}/update',
      method: ApiMethods.post,
      className: 'MinorWorksController/pickFormImage',
      requestFunction: onUpdateImageAttach,
      withLoading: true,
      body: <String, dynamic>{
        'certificate_id': Get.arguments[keyId],
        'image_id': imageClass!.imageId,
        // true included ? no exclude : yes exclude
        'exclude': imageClass!.isIncluded ? 'no' : 'yes',
        // 'note_title': '',
        if (imageClass!.note != null) 'note_body': imageClass!.note,
        'attachment_type_id': 1
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
