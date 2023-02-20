import 'package:open_filex/open_filex.dart';

import '../../general_exports.dart';

class CertificateDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool isPDFLoading = false;
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  int tabIndex = 0;

  List<dynamic> tabItems = <dynamic>[
    <String, dynamic>{
      keyId: 0,
      'text': 'Cert Details',
    },
    <String, dynamic>{
      keyId: 1,
      'text': 'Customer Details',
    },
    <String, dynamic>{
      keyId: 2,
      'text': 'Notes',
    },
    // <String, dynamic>{
    //   keyId: 3,
    //   'text': 'Invoice',
    // },
  ];
  List<dynamic> tabViewItems = <dynamic>[
    const CertTab(),
    const CustomerDetailsTab(),
    const InvoiceTab(),
    // const NotesTab(),
  ];

  // Email test =

  Map<dynamic, dynamic> certDetails = <dynamic, dynamic>{};
  String certStatus = 'Pending';
  int certId = 0;
  dynamic formBody;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
    consoleLog(Get.arguments, key: 'arguments');
  }

  void onSelectTab(int index) {
    tabIndex = index;
    update();
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  void onReady() {
    super.onReady();
    getCompetedCert();
  }

  String? pdfFilePath;
  Future<void> getCompetedCert() async {
    hideKeyboard();
    startLoading();

    ApiRequest(
      path:
          '${formGetCertificate}customer_id=${Get.arguments['customer_id']}&id=${Get.arguments[keyId]}',
      className: 'SortCertificateController/getAllCertificates',
      requestFunction: getCompetedCert,
      // withLoading: true,
      formatResponse: true,
    ).request(onSuccess: (dynamic data, dynamic response) async {
      myAppController.localStorage.saveToStorage(
        key: 'getCompetedCerts',
        value: data,
      );
      certDetails = data;
      certStatus = data['form_data']['status']['status'];
      certId = data['form_data'][keyId];
      formBody = data['form_data'];

      // consoleLog(data['form_data']['form_id'], key: 'form_id');
      // consoleLog(data['form_data']['id'], key: 'cert_id');

      update();
      dismissLoading();
    }, onError: (dynamic onError) {
      dismissLoading();
    });
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getCompetedCerts',
      );
      certDetails = apiData;
      update();
      dismissLoading();
    }
  }

  Future<void> preparePDF() async {
    if (pdfFilePath == null) {
      isPDFLoading = true;
      update();
      pdfFilePath = await onPressDownloadPdf(
        htmlContent: certDetails['html_content'],
        pdfTitle:
            'form${certDetails['form_id']}certificate${certDetails['form_data']['id']}',
      );
      update();
      consoleLog(pdfFilePath, key: 'pdfFilePath');
      isPDFLoading = false;
      update();
      await OpenFilex.open(
        pdfFilePath,
      );
    } else {
      await OpenFilex.open(
        pdfFilePath,
      );
    }
  }

  Future<void> onCancelCertificate() async {
    final Map<String, dynamic> certData = <String, dynamic>{
      ...formBody,
      'customer_id': myAppController.selectedCustomer?[keyId],
      'status_id': 6,
      // 'st'
    };
    ApiRequest(
      method: ApiMethods.post,
      path: '/certificate-form/$certId/update',
      className: 'CertificateDetailsController/onCancelCertificate',
      requestFunction: onCancelCertificate,
      withLoading: true,
      body: certData,
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        myAppController.clearFormAndTemp();
        Get.back();
        update();
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
