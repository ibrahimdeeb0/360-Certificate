import '../../general_exports.dart';

class CustomerProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  int tabIndex = 0;
  bool billingSame = false;

  Map<dynamic, dynamic> customerData = <dynamic, dynamic>{};
  List<dynamic> certData = <dynamic>[];
  List<dynamic> siteData = <dynamic>[];
  List<dynamic> contactData = <dynamic>[];

  List<dynamic> tabItems = <dynamic>[
    <String, dynamic>{
      keyId: 0,
      keyText: 'Details',
    },
    <String, dynamic>{
      keyId: 1,
      keyText: 'Sites',
    },
    <String, dynamic>{
      keyId: 2,
      keyText: 'Certs',
    },
    // <String, dynamic>{
    //   keyId: 3,
    //   'text': 'Invoice',
    // },
  ];
  List<dynamic> tabViewItems = <dynamic>[
    const DetailsTab(),
    const SitesTab(),
    const CertsTab(),
    // const InvoiceTab(),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabItems.length, vsync: this);
    consoleLog(Get.arguments, key: 'customer_arguments');
  }

  @override
  void onReady() {
    super.onReady();
    onGeCustomerDetails();
  }

  List<Map<String, dynamic>> get mapDetails => <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: 'Customer/ Company Name',
          keyValue: customerData[keyName] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Customer Type',
          keyValue: customerData[keyType] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Street No & Name',
          keyValue: customerData['street_num'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'City',
          keyValue: customerData['city'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Postcode',
          keyValue: customerData['postal_code'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Country',
          keyValue: '${customerData['country_id']}',
        },
      ];

  List<Map<String, dynamic>> get mapContactDetails => <Map<String, dynamic>>[
        <String, dynamic>{
          keyTitle: 'First Name',
          keyValue: contactData[0]['f_name'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Last Name',
          keyValue: contactData[0]['l_name'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Phone',
          keyValue: contactData[0]['phone'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Email',
          keyValue: contactData[0]['email'] ?? '',
        },
        <String, dynamic>{
          keyTitle: 'Type',
          keyValue: contactData[0]['type'] ?? '',
        },
      ];

  void onSelectTab(int index) {
    tabIndex = index;
    update();
    // scrollController.animateTo(
    //   0.0,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.linear,
    // );
  }

  Future<void> onGeCustomerDetails() async {
    hideKeyboard();
    ApiRequest(
      path: '/customers/1001/customer',
      className: 'CustomerProfileController/onGeCustomerDetails',
      requestFunction: onGeCustomerDetails,
      withLoading: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'onGeCustomerDetails',
          value: data,
        );
        //dismissLoading();
        customerData = data;
        certData = data['certificates'];
        siteData = data['sites'];
        contactData = data['contacts'];
        billingSame = data['billing_details'] == 'yes';

        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'onGeCustomerDetails',
      );
      customerData = apiData;
      certData = apiData['sites'];
      siteData = apiData['certificates'];
      contactData = apiData['contacts'];
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
