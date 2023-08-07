import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';

class FormImageClass {
  FormImageClass({
    required this.id,
    required this.file,
    this.image,
    this.onPress,
    this.isIncluded = false,
    this.note,
  });

  final int id;
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

  String selectedNoteType = 'Private Certificate Note';

  @override
  void onReady() {
    imagesData = Get.find<MinorWorksController>().imagesData;
    notesData = Get.find<MinorWorksController>().notesData;
    update();
    super.onReady();
  }

  Future<void> pickImage() async {
    hideKeyboard();

    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    consoleLog(file!.path);

    if (imagesFile.where((XFile img) => img.path == file.path).isEmpty) {
      int? idValue;
      if (imagesData.isNotEmpty) {
        idValue = imagesData.first.id + 1;
      } else {
        idValue = imagesData.length + 1;
      }

      consoleLog('inside');
      imagesData.insert(
        0,
        FormImageClass(
          id: idValue,
          file: file,
          onPress: () {
            imagesData
                .removeWhere((FormImageClass element) => element.file == file);

            imagesFile
                .removeWhere((XFile element) => element.path == file.path);
            update();
          },
          image: file.path,
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

  List<String> dropdownItemsClass = <String>[
    'Private Certificate Note',
    'Certificate Note',
  ];

  @override
  void onClose() {
    Get.find<MinorWorksController>().imagesData = imagesData;
    Get.find<MinorWorksController>().notesData = notesData;
    super.onClose();
  }
}
