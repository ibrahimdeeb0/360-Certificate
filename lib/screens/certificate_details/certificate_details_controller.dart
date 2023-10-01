import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

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
    const NotesTab(),
    // const InvoiceTab(),
  ];

  // Email test =

  Map<dynamic, dynamic> certDetails = <dynamic, dynamic>{};
  List<dynamic> certAttachments = <dynamic>[];
  String certStatus = 'Pending';
  int statusId = 1;
  int certId = 0;
  int certNum = 0;
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

    certNum = Get.arguments['num_cert'] ?? Get.arguments[keyId];
    certId = Get.arguments[keyId];
    getCertificateDetails();
  }

  String? pdfFilePath;
  Future<void> getCertificateDetails() async {
    hideKeyboard();
    startLoading();

    ApiRequest(
      path:
          '$formGetCertificate/${Get.arguments['num_cert'] ?? Get.arguments[keyId]}/view',
      className: 'CertificateDetailsController/getCertDetails',
      requestFunction: getCertificateDetails,
      // withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        myAppController.localStorage.saveToStorage(
          key: 'getCompetedCerts',
          value: data,
        );
        certDetails = data;
        certStatus = data[keyFormData]['status']['name'];
        statusId = data[keyFormData]['status_id'];
        certNum = data[keyFormData]['num_cert'] ?? data[keyFormData][keyId];
        certId = data[keyFormData][keyId];
        certAttachments = data[keyFormData]['certificate_attachments'];
        // formBody = data[formData];

        // consoleLog(data['form_data']['form_id'], key: 'form_id');
        // consoleLog(data['form_data']['id'], key: 'cert_id');

        update();
        dismissLoading();
        // getCertAttachments();
      },
      // onError: (dynamic onError) {
      //   dismissLoading();
      // },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getCompetedCerts',
      );
      certDetails = apiData;
      update();
      dismissLoading();
      // getCertAttachments();
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
    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/certificates/${certDetails['form_data'][keyId]}/update-status',
      className: 'CertificateDetailsController/onCancelCertificate',
      requestFunction: onCancelCertificate,
      // withLoading: true,
      body: <dynamic, dynamic>{
        'status_id': 5,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        Get.offAllNamed(routeHomeBottomBar);
        homeController.getCertCount();
        certificatesController.getAllCert();

        update();
      },
    );
  }

  void onEditCert() {
    // consoleLogPretty(certDetails['form_data']['data']);
    myAppController.certFormInfo[keyFormDataStatus] = FormDataStatus.editCert;
    myAppController.certFormInfo[keyCertId] = certDetails['form_data'][keyId];
    myAppController.certFormInfo[keyCustomerId] =
        certDetails['form_data']['customer']['id'];
    //
    myAppController.certFormInfo[keySiteId] =
        certDetails['form_data']['site_id'];
    //
    myAppController.certFormInfo[keyFormId] =
        certDetails['form_data']['form_id'];
    //
    myAppController.certFormInfo[keyTemplateData] =
        certDetails['form_data']['data'];
    //
    if (certDetails['form_data']['form_id'] == 5) {
      Get.toNamed(
        routeFormEICR,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 9) {
      Get.toNamed(
        routeFormLandlord,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 4) {
      Get.toNamed(
        routeFormDangerNotice,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 11) {
      Get.toNamed(
        routeFormWarningNotice,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 3) {
      Get.toNamed(
        routeFormDomesticEic,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 1) {
      Get.toNamed(
        routeFormPortableTest,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 2) {
      Get.toNamed(
        routeFormMinorWorks,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 31) {
      Get.toNamed(
        routeFormBreakdownService,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 13) {
      Get.toNamed(
        routeFormGasTestPurge,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 26) {
      Get.toNamed(
        routeFormLeisureIndustry,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 15) {
      Get.toNamed(
        routeFormMaintenanceService,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 32) {
      Get.toNamed(
        routeFormElectricalIsolation,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    } else if (certDetails['form_data']['form_id'] == 26) {
      Get.toNamed(
        routeFormLeisureIndustry,
        arguments: <String, dynamic>{
          formKeyFromCertificate: true,
        },
      );
    }
  }

  late PDFDocument pdf;
  Future<void> onOpenPdf() async {
    // Load the pdf file from the internet
    // pdf = await PDFDocument.fromURL(
    //     'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf');

    try {
      await launchUrl(
        Uri.parse(pdfFilePath!),
        mode: LaunchMode.inAppWebView,
      );
    } on PlatformException catch (error) {
      // Handle the exception here, for example by showing an error message to the user.
      consoleLog('Error launching URL: $error', key: 'error');
    }
  }

  Future<void> getPdfPath() async {
    hideKeyboard();

    ApiRequest(
      path: '/certificates/$certId/pdf',
      className: 'CertificateDetailsController/getPdfPath',
      requestFunction: getPdfPath,
      withLoading: true,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        pdfFilePath = data[keyUrl];

        await launchUrl(
          Uri.parse(pdfFilePath!),
          mode: Platform.isAndroid
              ? LaunchMode.externalNonBrowserApplication
              : LaunchMode.inAppWebView,
        );

        // onOpenPdf();
        // await OpenFilex.open(
        //   pdfFilePath,
        // );
        // Load the pdf file from the internet
        // pdf = await PDFDocument.fromURL(pdfFilePath!);
        // pdf = await PDFDocument.fromURL(
        //         'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf')
        //     .then((PDFDocument value) {
        //   Get.to(() => const ShowPdf());
        //   return value;
        // });

        update();
      },
    );
  }

  Future<void> onSendViaEmail() async {
    ApiRequest(
      method: ApiMethods.post,
      path: '/certificates/send-email/${certDetails['form_data']['id']}',
      className: 'CertificateDetailsController/onSendViaEmail',
      requestFunction: onCancelCertificate,
      withLoading: true,
      body: <dynamic, dynamic>{},
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        showMessage(
          description: '${response['message']}',
          // textColor: AppColors.deepGreen,
        );
      },
    );
  }

  // Future<void> getCertAttachments() async {
  //   hideKeyboard();

  //   ApiRequest(
  //     path: '/certificates/$certId/get-attachments',
  //     className: 'CertificateDetailsController/getCertAttachments',
  //     requestFunction: getCertAttachments,
  //     withLoading: true,
  //     formatResponse: true,
  //   ).request(
  //     onSuccess: (dynamic data, dynamic response) async {
  //       certAttachments = data;
  //       update();
  //     },
  //   );
  // }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
