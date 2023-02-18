import '../../general_exports.dart';

class UncompletedCertController extends GetxController {
  List<dynamic> allUnCompetedCert = <dynamic>[];
  List<dynamic> unCompetedCerts = <dynamic>[];

  Future<void> getUnCompetedCert() async {
    hideKeyboard();

    ApiRequest(
      path: keyUnCompletedCert,
      className: 'SortCertificateController/getUnCompetedCert',
      requestFunction: getUnCompetedCert,
      withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getCompetedCerts',
          value: data,
        );
        allUnCompetedCert = data;

        sortedCerts();
        update();
        // consoleLogPretty(allCompetedCert, key: 'allCompetedCert');
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getCompetedCerts',
      );
      allUnCompetedCert = apiData;
      update();
    }
  }

  void sortedCerts() {
    unCompetedCerts = <dynamic>[
      ...allUnCompetedCert.where((dynamic item) => item['customer_id'] != null),
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
    getUnCompetedCert();
  }
}
