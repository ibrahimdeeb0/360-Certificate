import '../../../general_exports.dart';

class CretificatesValidateController extends GetxController {
  final CretificatesValidateList list = CretificatesValidateList();

  List<Map<String, dynamic>> get forms => <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 9,
          keyTitle: 'Landlord/Homeowner Gas Safety Record',
          keyOnPress: () {
            formsDialog(
                title: 'warning',
                description: 'The gas certificate is valid for only one year.');
          },
          keyType: FormCertType.gas,
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 11,
          keyTitle: 'Warning Notice',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              //   CretificatesValidateBTSheet(
              //     listTitles: const <String>[],
              //     controller: MinorWorksController(),
              //     keyOfValue: formKeyOvercurrentBSEN,
              //     keyOfBSType: formKeyOvercurrentType,
              //   ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 31,
          keyTitle: 'Breakdown Service',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 15,
          keyTitle: 'Maintenance Service',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 13,
          keyTitle: 'Gas Test & Purge',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 1,
          keyTitle: 'Portable Appliance Testing (PAT)',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 3,
          keyTitle: 'Domestic Electrical Installation Certificate',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 4,
          keyTitle: 'Electrical Danger Notice',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 5,
          keyTitle: 'EICR',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 2,
          keyTitle: 'Minor Works',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 32,
          keyTitle: 'Electrical Isolation',
          keyOnPress: () {
            Get.bottomSheet(
              const SelectValidateBTSheet(),
              isScrollControlled: true,
            );
          },
        },
      ];

  List<dynamic> allYear = <dynamic>[];
  List<String> selectedYear = <String>[];
  List<String> selectedTempYears = <String>[];

  List<Map<String, dynamic>> filtterForm = <Map<String, dynamic>>[];
  TextEditingController seachController = TextEditingController();
  void onSearch(String searchValue) {
    filtterForm = forms
        .where((dynamic item) =>
            item[keyTitle].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    consoleLog(filtterForm);

    update();
  }

  void onSelectTempYears(String item) {
    if (selectedTempYears.isEmpty) {
      selectedTempYears.add(item);
    } else {
      if (selectedTempYears
          .where((String element) => element == item)
          .isNotEmpty) {
        selectedTempYears.removeWhere((String element) => element == item);
      }
    }
    update();
  }

  void onSelectYear() {
    hideKeyboard();
    selectedYear = <String>[];
    selectedYear = selectedTempYears;
    update();
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
  }

  Future<void> getAllYears(int id) async {
    hideKeyboard();
    ApiRequest(
      path: '/certificates/get-years/form/$id',
      className: 'CretificatesValidateController/allYear',
      requestFunction: getAllYears,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        allYear = data;
        update();
      },
    );
    update();
  }

  void onCreatValidYear() {
    hideKeyboard();
    ApiRequest(
      className: 'CretificatesValidateController/allYear',
      requestFunction: onCreatValidYear,
      formatResponse: true,
      method: ApiMethods.post,
      path: '/certificates/form-valid/create',
      body: <dynamic, dynamic>{
        // 'form_id':
        // 'years':
      },
      withLoading: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {},
    );
  }

  @override
  void onReady() {
    filtterForm = forms;
    update();
    const int id = 123;
    getAllYears(id);
    update();

    super.onReady();
  }
}
