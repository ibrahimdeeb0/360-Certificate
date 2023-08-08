import '../../../../general_exports.dart';

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

class FormNotesAttachmentsController extends GetxController {
  int? certId;

  List<FormNoteClass> notesData = <FormNoteClass>[];
  TextEditingController noteController = TextEditingController();

  // String selectedNoteType = 'Private Certificate Note';
  List<String> dropdownItemsClass = <String>[
    'Private Certificate Note',
    'Certificate Note',
  ];

  @override
  void onInit() {
    consoleLog(certId, key: 'certId');
    super.onInit();
  }
}
