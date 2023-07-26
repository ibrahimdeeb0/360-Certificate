import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';

class FormImageClass {
  FormImageClass({
    required this.file,
    this.image,
    this.onPress,
    this.isIncluded = false,
    this.note,
  });

  final String? image;
  final XFile file;
  final Function()? onPress;
  bool isIncluded;
  String? note;
}

class FormNoteClass {
  FormNoteClass({
    this.note,
    this.type,
    this.onPress,
  });

  String? note;
  String? type;
  final Function()? onPress;
}

class MinorAttachmentsController extends GetxController {
  TextEditingController noteController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<XFile> imagesFile = <XFile>[];
  List<FormImageClass> imagesData = <FormImageClass>[];
  List<FormNoteClass> notesData = <FormNoteClass>[];

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
      imagesData.insert(
        0,
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
      // imagesData.add(
      //   FormImageClass(
      //     file: file!,
      //     onPress: () {
      //       imagesData
      //           .removeWhere((FormImageClass element) => element.file == file);

      //       imagesFile
      //           .removeWhere((XFile element) => element.path == file.path);
      //       update();
      //     },
      //   ),
      // );
      // imagesFile.add(file);
      imagesFile.insert(0, file);
    }

    consoleLog(imagesFile, key: 'selected_Images');

    // if (Get.isBottomSheetOpen!) {
    //   Get.back();
    // }
    update();
  }
}
