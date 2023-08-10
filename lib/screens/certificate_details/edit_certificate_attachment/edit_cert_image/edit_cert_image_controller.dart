import '../../../../general_exports.dart';

class EditCertImageController extends GetxController {
  dynamic imageData;
  FormImageClass? imageClass;

  @override
  void onInit() {
    imageData = Get.arguments[keyData];

    super.onInit();
  }

  Future<void> onSetFormAttachments() async {
    FormImageClass(
      imageId: imageData['image']['id'],
      imageName: imageData['image']['image'],
      imageURL: imageData['image']['file_url'],
      onPress: () {
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
                  Get.find<CertificateDetailsController>().getCertificateDetails();
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
}
