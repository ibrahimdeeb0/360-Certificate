import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';




class MinorAttachmentsController extends GetxController {
  TextEditingController noteController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  // List<XFile> imagesFile = <XFile>[];
  List<FormImageClass> imagesData = <FormImageClass>[];
  List<FormNoteClass> notesData = <FormNoteClass>[];

  String selectedNoteType = 'Private Certificate Note';

  int? certId;

  @override
  void onInit() {
    certId = Get.arguments['cert_id'];
    consoleLog(certId, key: 'certId');
    update();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   imagesData = Get.find<MinorWorksController>().imagesData;
  //   notesData = Get.find<MinorWorksController>().notesData;
  //   update();
  //   super.onReady();
  // }

  Future<void> pickFormImage() async {
    hideKeyboard();

    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    if (file != null) {
      int? imgId;
      String imgName = '';
      ApiRequest(
        path: '/store-image',
        method: ApiMethods.post,
        className: 'MinorWorksController/pickFormImage',
        requestFunction: pickFormImage,
        withLoading: true,
        body: await addFormDataToJson(
          jsonObject: <String, dynamic>{
            'type': 'form',
            'type_id': certId,
          },
          file: file,
          fileKey: 'image',
        ),
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          imgId = data[keyId];
          imgName = data['image'];
          update();
        },
      );

      imagesData.insert(
        0,
        FormImageClass(
          imageId: imgId!,
          imageName: imgName,
          onPress: () {
            // API for delete image
            ApiRequest(
              path: '/delete-image/imgId',
              method: ApiMethods.post,
              className: 'MinorWorksController/pickFormImage',
              requestFunction: pickFormImage,
              body: <String, dynamic>{},
            ).request(
              onSuccess: (dynamic data, dynamic response) {
                update();
              },
            );
          },
        ),
      );
    } else {
      showMessage(
        description: 'No image has been uploaded',
        textColor: Colors.red[800],
      );
    }

    update();
  }

  List<String> dropdownItemsClass = <String>[
    'Private Certificate Note',
    'Certificate Note',
  ];

  @override
  void onClose() {
    // Get.find<controller>().imagesData = imagesData;
    // Get.find<controller>().notesData = notesData;
    super.onClose();
  }
}
