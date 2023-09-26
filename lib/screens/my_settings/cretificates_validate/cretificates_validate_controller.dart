import '../../../general_exports.dart';

class CretificatesValidateController extends GetxController {
  final CretificatesValidateList list = CretificatesValidateList();

  // List<Map<String, dynamic>> filtterForm = <Map<String, dynamic>>[];
  TextEditingController seachController = TextEditingController();
  void onSearch(String searchValue) {
    fillterdForms2 = fillterdForms
        .where((dynamic item) =>
            item[keyName].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    consoleLog(fillterdForms);

    update();
  }

  String? selectedYear;

  void onSelectRadio(String? value) {
    if (selectedYear != value) {
      selectedYear = value;
    }
    update();
    // consoleLog(selectedYear);
  }

  List<dynamic> allForms = <String>[];
  List<Map<String, dynamic>> fillterdForms = <Map<String, dynamic>>[];
  List<Map<String, dynamic>> fillterdForms2 = <Map<String, dynamic>>[];
  List<int> availbleId = <int>[
    9,
    11,
    31,
    15,
    13,
    1,
    3,
    4,
    5,
    2,
    32,
  ];

  int? extractedId;
  Future<void> getAllForms() async {
    hideKeyboard();
    ApiRequest(
      path: '/certificates/get-forms',
      className: 'CretificatesValidateController/allForms',
      requestFunction: getAllForms,
      formatResponse: true,
      withLoading: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        allForms = data;

        fillterdForms = <Map<String, dynamic>>[
          ...allForms.where(
            (dynamic element) => (availbleId.contains(element[keyId])),
          ),
        ];
        fillterdForms2 = fillterdForms;
        consoleLogPretty(fillterdForms, key: 'fillterd_Forms');

        update();
      },
    );
    update();
  }

  void onCreatValidYear({required int formId, required String years}) {
    hideKeyboard();
    startLoading();
    ApiRequest(
      className: 'CretificatesValidateController/allYear',
      requestFunction: onCreatValidYear,
      formatResponse: true,
      method: ApiMethods.post,
      path: '/certificates/form-valid/create',
      body: <dynamic, dynamic>{
        'form_id': formId,
        'years': years,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        getAllForms();
        // Get.back();
      },
    );
  }

  @override
  void onReady() {
    update();

    getAllForms();
    update();

    super.onReady();
  }
}
