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
  int? certId;

  List<FormImageClass> imagesData = <FormImageClass>[];
  TextEditingController noteController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    consoleLog(certId, key: 'certId');
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
}
