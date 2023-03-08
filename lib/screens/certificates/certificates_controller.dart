import '../../general_exports.dart';

enum FilterType {
  pending,
  inProgress,
  completed,
  canceled,
  all,
}

class CertificatesController extends GetxController {
  List<dynamic> allCerts = <dynamic>[];
  List<dynamic> listCert = <dynamic>[];
  List<dynamic> filteredCert = <dynamic>[];

  List<Map<String, dynamic>> filterItems = <Map<String, dynamic>>[
    <String, dynamic>{
      keyTitle: 'All',
      keyType: FilterType.all,
    },
    <String, dynamic>{
      keyTitle: 'Pending',
      keyType: FilterType.pending,
    },
    <String, dynamic>{
      keyTitle: 'In Progress',
      keyType: FilterType.inProgress,
    },
    <String, dynamic>{
      keyTitle: 'Completed',
      keyType: FilterType.completed,
    },
    <String, dynamic>{
      keyTitle: 'Canceled',
      keyType: FilterType.canceled,
    },
  ];

  @override
  void onReady() {
    super.onReady();
    getAllCert();
  }

  void sortedCerts() {
    listCert = <dynamic>[
      ...allCerts.where((dynamic item) =>
          (item['customer_id'] != null) && (item['status_id'] != null)),
    ];
    filteredCert = listCert;
    update();
  }

  FilterType selectedType = FilterType.all;
  void onFilterCert(Map<String, dynamic> certItem) {
    if (certItem[keyType] == FilterType.all) {
      filteredCert = listCert;
    } else if (listCert
        .where(
          (dynamic item) => (item['status']['status'] == certItem[keyTitle]),
        )
        .isNotEmpty) {
      filteredCert = <dynamic>[
        ...listCert.where(
          (dynamic item) => (item['status']['status'] == certItem[keyTitle]),
        ),
      ];
    } else {
      filteredCert = <dynamic>[];
    }

    selectedType = certItem[keyType];

    update();
    Get.back();
  }

  Future<void> getAllCert() async {
    hideKeyboard();

    ApiRequest(
      path: formGetAllCertificates,
      className: 'CertificatesController/getAllCert',
      requestFunction: getAllCert,
      withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getAllCert',
          value: data,
        );
        allCerts = data;
        sortedCerts();
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getAllCert',
      );
      allCerts = apiData;
      update();
    }
  }
}
