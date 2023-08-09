import 'package:image_picker/image_picker.dart';

import '../../../../general_exports.dart';

class FormImageClass {
  FormImageClass({
    required this.imageId,
    this.imageName,
    this.imageURL,
    this.onPress,
    this.isIncluded = false,
    this.note,
  });

  final int imageId;
  final String? imageName;
  final String? imageURL;

  final Function()? onPress;
  bool isIncluded;
  String? note;
}

class FormImagesAttachmentsController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  int? certId;

  List<FormImageClass> imagesData = <FormImageClass>[];
  TextEditingController noteController = TextEditingController();

  //
  List<dynamic> certAttachments = <dynamic>[];
  // List<dynamic> formNotes = <dynamic>[];

  bool isAttachmentsAdding = false;

  @override
  void onInit() {
    consoleLog(certId, key: 'certId');
    if (!isAttachmentsAdding) {
      getCertAttachments();
    }

    super.onInit();
  }

  Future<void> pickFormImage(
      {ImageSource imageSource = ImageSource.gallery}) async {
    hideKeyboard();

    final XFile? file = await _picker.pickImage(
      source: imageSource,
      imageQuality: 30,
    );

    int? imgId;
    String? imgName;
    String? imgUrl;
    if (file != null) {
      ApiRequest(
        path: '/store-image',
        method: ApiMethods.post,
        className: 'MinorWorksController/pickFormImage',
        requestFunction: pickFormImage,
        withLoading: true,
        body: await imageAsFormData(
          fileKey: 'image',
          file: file,
        ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          imgId = data[keyId];
          imgName = data['image'];
          imgUrl = data['file_url'];

          imagesData.insert(
            0,
            FormImageClass(
              imageId: imgId!,
              imageName: imgName != null ? '$imgName' : '',
              imageURL: imgUrl,
              onPress: () {
                // API for delete image
                ApiRequest(
                  path: '/delete-image/$imgId',
                  method: ApiMethods.post,
                  className: 'MinorWorksController/pickFormImage',
                  requestFunction: pickFormImage,
                  withLoading: true,
                  body: <String, dynamic>{},
                ).request(
                  onSuccess: (dynamic data, dynamic response) {
                    imagesData.removeWhere(
                      (FormImageClass item) => item.imageId == imgId,
                    );
                    update();
                  },
                );
              },
            ),
          );

          consoleLog(imagesData, key: 'test_insert_imagesData');

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
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }

    update();
  }

  // **************  Get Form Attachments From Certificate Details ********//
  Future<void> onSetFormAttachments() async {
    // consoleLog('store Images Attachments');
    hideKeyboard();
    imagesData.clear();
    if (certAttachments.isNotEmpty) {
      for (Map<String, dynamic> item in certAttachments) {
        if (item['attachment_type_id'] == 1) {
          imagesData.insert(
            0,
            FormImageClass(
              imageId: item['image']['id'],
              imageName: item['image']['image'],
              imageURL: item['image']['file_url'],
              onPress: () {
                // API for delete image
                ApiRequest(
                  path: '/delete-image/${item['image']['id']}',
                  method: ApiMethods.post,
                  className: 'MinorWorksController/pickFormImage',
                  requestFunction: pickFormImage,
                  withLoading: true,
                  body: <String, dynamic>{},
                ).request(
                  onSuccess: (dynamic data, dynamic response) {
                    imagesData.removeWhere(
                      (FormImageClass element) =>
                          element.imageId == item['image']['id'],
                    );
                    update();
                  },
                );
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
      className: 'FormImagesAttachmentsController/getCertAttachments',
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
