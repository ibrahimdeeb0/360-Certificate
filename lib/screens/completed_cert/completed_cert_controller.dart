import '../../general_exports.dart';

class CompletedCertController extends GetxController {
  List<dynamic> allCompetedCert = <dynamic>[];
  List<dynamic> competedCerts = <dynamic>[];

  Future<void> getCompetedCert() async {
    hideKeyboard();

    ApiRequest(
      path: keyCompletedCert,
      className: 'SortCertificateController/getCompetedCert',
      requestFunction: getCompetedCert,
      withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getCompetedCerts',
          value: data,
        );
        allCompetedCert = data;

        sortedCerts();
        update();
        // consoleLogPretty(allCompetedCert, key: 'allCompetedCert');
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getCompetedCerts',
      );
      allCompetedCert = apiData;
      update();
    }
  }

  void sortedCerts() {
    competedCerts = <dynamic>[
      ...allCompetedCert.where((dynamic item) => item['customer_id'] != null),
    ];

    // consoleLogPretty(competedCerts, key: 'sortedCerts');
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    getCompetedCert();
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
