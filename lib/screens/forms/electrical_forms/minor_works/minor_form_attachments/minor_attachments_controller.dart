import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';

class FormImageClass {
  FormImageClass({
    required this.file,
    this.image,
    this.onPress,
    this.isIncluded = false,
  });

  final String? image;
  final XFile file;
  final Function()? onPress;
  bool isIncluded;
}

class MinorAttachmentsController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  List<XFile> imagesFile = <XFile>[];
  List<FormImageClass> imagesData = <FormImageClass>[];

  // List<Map<String, dynamic>> imagesData = <Map<String, dynamic>>[
  //   <String, dynamic>{
  //     'image_file': '',
  //     'note': '',
  //     'is_included': '',
  //   },
  // ];

  Future<void> pickImage() async {
    hideKeyboard();

    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    if (imagesFile.where((XFile img) => img.path == file!.path).isEmpty) {
      consoleLog('inside');
      imagesData.add(
        FormImageClass(
          file: file!,
          onPress: () {
            imagesData
                .removeWhere((FormImageClass element) => element.file == file);

            imagesFile
                .removeWhere((XFile element) => element.path == file.path);
            update();
          },
        ),
      );
      imagesFile.add(file);
    }

    consoleLog(imagesFile, key: 'selected_Images');

    // if (Get.isBottomSheetOpen!) {
    //   Get.back();
    // }
    update();
  }
}
