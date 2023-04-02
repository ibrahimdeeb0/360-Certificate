import '../../../../general_exports.dart';

class LandlordSafetyController extends GetxController {
  bool? isTemplate;

  int selectedId = 0;
  ScrollController scrollController = ScrollController();

  Map<String, dynamic> formData = <String, dynamic>{
    formKeyPart1: <String, dynamic>{
      formKeyNameP1: '',
      formKeyAddress1P1: '',
      formKeyAddress2P1: '',
      formKeyPostcodeP1: '',
    },
    formKeyPart2: <String, dynamic>{
      formKeyAddress1P2: '',
      formKeyAddress2P2: '',
      formKeyPostcodeP2: '',
    },
    formKeyPart3: <String, dynamic>{
      formKeyDetailsOfWorkP3: '',
    },
    formKeyPart4: <String, dynamic>{
      formKeyPipeworkVisualP4: 'N/A',
      formKeyPipeworkOutcomeSupplyP4: 'N/A',
      formKeyPipeworkEmergencyP4: 'N/A',
      formKeyPipeworkOutcomeTightnessP4: 'N/A',
      formKeyPipeworkProtectiveP4: 'N/A',
    },
    formKeyPart5: <String, dynamic>{
      formKeyDefectsIdentified1: '',
      formKeyDefectsIdentified2: '',
      formKeyDefectsIdentified3: '',
      formKeyDefectsIdentified4: '',
      formKeyDefectsIdentified5: '',
      //
      formKeyWarningNotice1: 'N/A',
      formKeyWarningNotice2: 'N/A',
      formKeyWarningNotice3: 'N/A',
      formKeyWarningNotice4: 'N/A',
      formKeyWarningNotice5: 'N/A',
    },
    formKeyPart6: <String, dynamic>{
      formKeyRecordRemedialAction: '',
    },
    formKeyPart7: <String, dynamic>{
      formKeyNextSafetyCheckBy: '',
    },
  };

  DateTime? selectedDate;
  void onSelectDate(String? part, String? key, DateTime value) {
    formData[part!][key!] = '$value'.split(' ')[0];
    update();
    selectedDate = value;
  }

  Map<String, dynamic> formBody = <String, dynamic>{
    'form_id': '',
    formKeyFormData: <String, dynamic>{},
  };

  List<Widget> get listFormSections => <Widget>[
        // controller: Get.put(LandlordSafetyController())
        const LandlordPage1(),
        const LandlordPage2(),
        const LandlordPage3(),
        const LandlordPage4(),
        const LandlordPage5(),
      ];

  //* Circuit - Page Numbers *//
  String pagesNum() {
    if (selectedId == listFormSections.length) {
      return '${listFormSections.length}/${listFormSections.length}';
    } else {
      return '${selectedId + 1}/${listFormSections.length}';
    }
  }

  void onChangeFormDataValue(String? part, String? key, dynamic value) {
    formData[part!][key!] = value;
    update();
  }

  void onNext() {
    if (listFormSections.length - 1 == selectedId) {
      consoleLog('Last Pages');
    } else {
      selectedId = selectedId + 1;
      update();
    }
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void onPressBack() {
    if (selectedId > 0) {
      selectedId = selectedId - 1;
      update();
    } else {
      Get.back();
    }

    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  String finalPageButton() {
    if (selectedId < listFormSections.length - 1) {
      return 'Next';
    } else {
      return 'Complete';
    }
    // if (isTemplate!) {
    //   if (selectedId == 21) {
    //     return 'Save';
    //   } else {
    //     return 'Next';
    //   }
    // } else {
    //    if (selectedId < listFormSections.length - 1) {
    //     return 'Next';
    //   } else {
    //     return 'Complete';
    //   }
    // }
  }

  @override
  void onInit() {
    super.onInit();
    consoleLog('onInit');
  }
}
