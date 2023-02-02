import '../../general_exports.dart';

class CreateCustomerController extends GetxController {
  int currentIndex = 0;

  bool isSelectBilling = true;
  bool isSendStatements = false;
  bool radioSiteAddress = false;
  bool radioSiteContact = false;

  List<String> customerType = <String>[
    'Commercial',
    'Individual',
  ];
  List<String> clientType = <String>[
    'Owner',
    'Finance Team',
    'Contract Manager',
    'Site Manager',
  ];
  List<String> contactType = <String>[
    'Owner',
    'Tenant',
    'Service Manager',
    'Other',
  ];

  //* -----------------Add Customer Form Controllers------------------------ */
  TextEditingController searchAddressController = TextEditingController();
  //* --- Customer Inf
  TextEditingController customerNameController = TextEditingController();
  String? selectedCustomerType;

  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerStreetController = TextEditingController();
  TextEditingController customerCityController = TextEditingController();
  TextEditingController customerPostcodeController = TextEditingController();
  TextEditingController searchCustomerCountryController =
      TextEditingController();

  dynamic customerSelectedCountry = <dynamic, dynamic>{
    keyId: 180,
    keyName: 'United Kingdom '
  };

  String? customerAddressLat;
  String? customerAddressLng;

  //* --- Billing Address
  TextEditingController customerBillingAddressController =
      TextEditingController();
  TextEditingController customerBillingStreetController =
      TextEditingController();
  TextEditingController searchCustomerBillingCountryController =
      TextEditingController();
  dynamic billingSelectedCountry = <dynamic, dynamic>{
    keyId: 180,
    keyName: 'United Kingdom '
  };
  TextEditingController customerBillingCityController = TextEditingController();
  TextEditingController customerBillingPostcodeController =
      TextEditingController();
  //* --- Finance Details
  TextEditingController customerFinanceCreditController =
      TextEditingController();
  Map<String, dynamic>? selectedPaymentTerms;

  //* -------------Add ClientContact
  TextEditingController clientContactFirstNameController =
      TextEditingController();
  TextEditingController clientContactLastNameController =
      TextEditingController();
  TextEditingController clientContactPhoneController = TextEditingController();
  TextEditingController clientContactEmailController = TextEditingController();
  String? selectedClientContactType;
  Map<String, dynamic>? addedClientContact;

  //* -------------Add SiteAddress
  TextEditingController siteAddressSiteNameController1 =
      TextEditingController();
  TextEditingController siteAddressSiteNameController2 =
      TextEditingController();
  TextEditingController siteAddressAddressNameController =
      TextEditingController();
  TextEditingController siteAddressStreetController = TextEditingController();
  TextEditingController siteAddressCityController = TextEditingController();
  TextEditingController siteAddressPostcodeController = TextEditingController();
  TextEditingController searchSiteAddressCountryController =
      TextEditingController();

  dynamic siteAddressSelectedCountry = <dynamic, dynamic>{
    'id': 180,
    'name': 'United Kingdom '
  };
  Map<String, dynamic>? addedSiteAddress;
  String? siteAddressAddressLat;
  String? siteAddressAddressLng;
  //* -------------Add SiteContact
  TextEditingController siteContactFirstNameController =
      TextEditingController();
  TextEditingController siteContactLastNameController = TextEditingController();
  TextEditingController siteContactPhoneController = TextEditingController();
  TextEditingController siteContactEmailController = TextEditingController();
  String? selectedClientTypeOnSiteContact;
  String? selectedClientTypeOnSiteContact2;

  Map<String, dynamic>? addedSiteContact;

  //* ------

  List<dynamic> allCountries = <dynamic>[];
  List<dynamic>? filterAllCountries;
  List<dynamic>? filterBillingCountries;
  List<dynamic>? filterSiteAddressCountries;

  //*---------------Functions -----------------*//
  List<dynamic> allPaymentTerms = <dynamic>[];

  void onPressNext() {
    if (currentIndex == 3) {
      showMessage(
        description: 'This Last Screen',
      );
    } else {
      currentIndex = currentIndex + 1;
      update();
      consoleLog(currentIndex);
    }
  }

  void onBackNext() {
    if (currentIndex == 0) {
      Get.back();
    } else {
      currentIndex = currentIndex - 1;
      update();
      consoleLog(currentIndex);
    }
  }

  String titleName() {
    if (currentIndex == 1) {
      return 'Customer Contacts';
    } else if (currentIndex == 2) {
      return 'Site Address';
    } else if (currentIndex == 3) {
      return 'Site Contacts';
    } else {
      return 'Customer Details';
    }
  }

  //*----------------- On Search and Filter Countries ----------------*//
  void onSearchCountries(String searchValue) {
    filterAllCountries = allCountries
        .where((dynamic country) =>
            country['name'].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    update();
  }

  void onSearchBillingCountries(String searchValue) {
    filterBillingCountries = allCountries
        .where((dynamic country) =>
            country['name'].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    update();
  }

  void onSearchSiteAddressCountries(String searchValue) {
    filterSiteAddressCountries = allCountries
        .where((dynamic country) =>
            country['name'].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    update();
  }

  //*---- Functions Request ----*//
  Future<void> getPaymentTerms() async {
    if (allPaymentTerms.isEmpty) {
      ApiRequest(
        path: keyGetPaymentTerms,
        className: 'CreateCustomerController/getPaymentTerms',
        requestFunction: getPaymentTerms,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          myAppController.localStorage.saveToStorage(
            key: 'getPaymentTerms',
            value: data,
          );
          allPaymentTerms = data;
          update();
        },
      );
      if (!myAppController.isInternetConnect) {
        final dynamic apiData =
            await myAppController.localStorage.getFromStorage(
          key: 'getPaymentTerms',
        );
        allPaymentTerms = apiData;
        update();
      }
    }
    hideKeyboard();

    update();
  }

  Future<void> getCountries() async {
    hideKeyboard();
    if (allCountries.isEmpty) {
      ApiRequest(
        path: keyGetCountriesPat,
        className: 'NewJobController/getCountries',
        requestFunction: getCountries,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          myAppController.localStorage.saveToStorage(
            key: 'getCountries',
            value: data,
          );
          allCountries = data;
          filterAllCountries = data;
          filterBillingCountries = data;
          filterSiteAddressCountries = data;
          update();
        },
      );
      if (!myAppController.isInternetConnect) {
        final dynamic apiData =
            await myAppController.localStorage.getFromStorage(
          key: 'getCountries',
        );
        allCountries = apiData;
        filterAllCountries = apiData;
        filterBillingCountries = apiData;
        filterSiteAddressCountries = apiData;
        update();
      }
    }

    update();
  }
}
