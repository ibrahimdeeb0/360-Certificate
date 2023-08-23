import '../../general_exports.dart';

class CertificatesController extends GetxController {
  ScrollController scrollController = ScrollController();

  List<dynamic> allCerts = <dynamic>[];
  List<dynamic> filteredCert = <dynamic>[];

  int currentPage = 1;
  int? lastPage;
  bool isLoading = false;
  bool showMessage = true;

  FilterType selectedType = FilterType.all;

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
  void onInit() {
    super.onInit();
    scrollController.addListener(
      () {
        if (scrollController.positions.isNotEmpty) {
          if (scrollController.offset ==
              (scrollController.position.maxScrollExtent)) {
            if (!isLoading) {
              isLoading = true;
              homeController.update();

              if (currentPage < lastPage!) {
                getPaginationCerts(
                    withLoading: false, currentPage: currentPage++);
              } else {
                isLoading = false;
                homeController.update();
              }
            }
          }
        }
      },
    );
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   getAllCert();
  // }

  Map<String, dynamic> filterItem = <String, dynamic>{
    keyTitle: 'All',
    keyType: FilterType.all,
  };

  void onFilterCert(
      {Map<String, dynamic>? certItem, bool disableBack = false}) {
    filterItem = certItem!;
    if (certItem[keyType] == FilterType.all) {
      filteredCert = allCerts;
    } else if (allCerts
        .where(
          (dynamic item) => (item[keyStatus][keyName] == certItem[keyTitle]),
        )
        .isNotEmpty) {
      filteredCert = <dynamic>[
        ...allCerts.where(
          (dynamic item) => (item[keyStatus][keyName] == certItem[keyTitle]),
        ),
      ];
    } else {
      filteredCert = <dynamic>[];
    }

    selectedType = certItem[keyType];

    update();
    homeController.update();

    if (!disableBack) {
      Get.back();
    }
  }

  Future<void> getAllCert() async {
    hideKeyboard();
    startLoading();
    currentPage = 1;

    ApiRequest(
      path: '$formGetAllCertificates?page=$currentPage&perPage=5',
      className: 'CertificatesController/getAllCert',
      requestFunction: getAllCert,
      // withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getAllCert',
          value: data,
        );
        allCerts = data[keyData];
        filteredCert = allCerts;
        onFilterCert(certItem: filterItem, disableBack: true);
        lastPage = data['last_page'] + 1;
        currentPage++;
        isLoading = false;
        if (filteredCert.isEmpty) {
          showMessage = true;
        } else {
          showMessage = false;
        }
        update();
        homeController.update();
        dismissLoading();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getAllCert',
      );
      allCerts = apiData[keyData];
      filteredCert = allCerts;
      onFilterCert(certItem: filterItem, disableBack: true);
      lastPage = apiData['last_page'] + 1;
      currentPage++;
      isLoading = false;
      if (filteredCert.isEmpty) {
        showMessage = true;
      } else {
        showMessage = false;
      }
      update();
      homeController.update();
      dismissLoading();
    }
  }

  Future<void> getPaginationCerts({bool? withLoading, int? currentPage}) async {
    hideKeyboard();

    ApiRequest(
      path: '$formGetAllCertificates?page=$currentPage&perPage=5',
      className: 'CertificatesController/getPaginationCerts',
      requestFunction: getPaginationCerts,
      withLoading: withLoading ?? true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getPaginationCerts',
          value: data,
        );
        allCerts.addAll(data[keyData]);
        filteredCert = allCerts;
        onFilterCert(certItem: filterItem);
        lastPage = data['last_page'] + 1;

        consoleLog(currentPage, key: 'currentPage');
        isLoading = false;

        update();
        homeController.update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getPaginationCerts',
      );
      allCerts.addAll(apiData[keyData]);
      filteredCert = allCerts;
      onFilterCert(certItem: filterItem);
      lastPage = apiData['last_page'] + 1;

      consoleLog(currentPage, key: 'currentPage');
      isLoading = false;

      update();
      homeController.update();
    }
  }
}
