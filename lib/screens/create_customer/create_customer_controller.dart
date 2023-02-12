import 'package:dio/dio.dart';

import '../../general_exports.dart';

class CreateCustomerController extends GetxController {
  List<dynamic> allCustomers = <dynamic>[];
  List<dynamic>? filterAllCustomers;
  int? selectedCustomerId;

  Map<String, dynamic> customerData = <String, dynamic>{};
  Map<String, dynamic> addedCustomerData = <String, dynamic>{};

  int currentIndex = 0;

  bool isSelectBilling = true;
  bool isSendStatements = false;
  bool radioSiteAddress = true;
  bool radioSiteContact = true;

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

  //* -------------Add SiteAddress
  TextEditingController siteAddressSiteNameController1 =
      TextEditingController();
  // TextEditingController siteAddressSiteNameController2 =
  //     TextEditingController();
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
  String? siteAddressAddressLat;
  String? siteAddressAddressLng;
  //* -------------Add SiteContact
  TextEditingController siteContactFirstNameController =
      TextEditingController();
  TextEditingController siteContactLastNameController = TextEditingController();
  TextEditingController siteContactPhoneController = TextEditingController();
  TextEditingController siteContactEmailController = TextEditingController();
  String? selectedClientTypeOnSiteContact;

  //* ------

  List<dynamic> allCountries = <dynamic>[];
  List<dynamic>? filterAllCountries;
  List<dynamic>? filterBillingCountries;
  List<dynamic>? filterSiteAddressCountries;

  List<dynamic> allPaymentTerms = <dynamic>[];

  String? selectedPaymentTermsValue;
  String? countryOnPage1;
  String? countryOnPage1Billing;
  String? countryOnPage3;
  String? paymentTerm;

  //* ----- Map

  final Dio _dio = Dio();

  List<dynamic>? listAddress;
  List<dynamic>? searchAllAddress;
  Map<String, dynamic>? specificAddress;
  String? addressType;
  Map<String, dynamic>? addressData;
  Map<String, dynamic>? addressDetails = <String, dynamic>{};

  //*---------------Functions -----------------*//
  @override
  void onReady() {
    getAllCustomers();
    getPaymentTerms();
    super.onReady();
  }

  bool validValue = false;

  void onPressNext() {
    screensValidation();

    if (validValue) {
      if (currentIndex == 3) {
        if (isAutoFillCust == true) {
          myAppController.selectedCustomer = customerData;
          Get.offNamed(
            myAppController.selectedForm?['form_route'],
            arguments: {
              'tempData': myAppController.selectedTemplate,
            },
          );
        } else {
          onAddCustomer();
        }
      } else {
        currentIndex = currentIndex + 1;
        update();
      }
    } else {
      showMessage(
        description: 'Please fill all required fields',
      );
    }
  }

  void onPressBack() {
    if (currentIndex == 0) {
      Get.back();
    } else {
      currentIndex = currentIndex - 1;
      update();
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

  bool screensValidation() {
    if (currentIndex == 0) {
      validValue = isSelectBilling
          // If Yes
          ? customerNameController.text.isNotEmpty &&
              selectedCustomerType != null &&
              customerStreetController.text.isNotEmpty &&
              customerCityController.text.isNotEmpty &&
              customerPostcodeController.text.isNotEmpty
          // selectedPaymentTerms != null
          // If No
          : customerNameController.text.isNotEmpty &&
              selectedCustomerType != null &&
              customerStreetController.text.isNotEmpty &&
              customerCityController.text.isNotEmpty &&
              customerPostcodeController.text.isNotEmpty &&
              // (selectedPaymentTerms != null || paymentTerm != null) &&
              customerBillingStreetController.text.isNotEmpty &&
              customerBillingCityController.text.isNotEmpty &&
              customerBillingPostcodeController.text.isNotEmpty;

      return validValue;
    } else if (currentIndex == 1) {
      validValue = clientContactFirstNameController.text.isNotEmpty &&
          clientContactLastNameController.text.isNotEmpty &&
          clientContactPhoneController.text.isNotEmpty &&
          clientContactEmailController.text.isNotEmpty &&
          selectedClientContactType != null;

      return validValue;
    } else if (currentIndex == 2) {
      validValue = radioSiteAddress
          // If Yes
          ? siteAddressSiteNameController1.text.isNotEmpty
          // If No
          : siteAddressSiteNameController1.text.isNotEmpty &&
              siteAddressStreetController.text.isNotEmpty &&
              siteAddressCityController.text.isNotEmpty &&
              siteAddressPostcodeController.text.isNotEmpty;

      return validValue;
    } else {
      validValue = radioSiteContact
          // If Yes
          ? selectedClientTypeOnSiteContact != null
          // If No
          : selectedClientTypeOnSiteContact != null &&
              siteContactFirstNameController.text.isNotEmpty &&
              siteContactLastNameController.text.isNotEmpty &&
              siteContactPhoneController.text.isNotEmpty &&
              siteContactEmailController.text.isNotEmpty;

      return validValue;
    }
  }

  //*-----  Select Founded Customer -----*//
  bool isAutoFillCust = false;
  void onSelectCustomer(int id) {
    hideKeyboard();
    selectedCustomerId = id;
    filterAllCustomers = null;
    isAutoFillCust = true;
    getCustomerData();
  }

  //*----------------- On Search and Filter Functions ----------------*//

  void onSearchForCustomer(String searchValue) {
    filterAllCustomers = allCustomers
        .where((dynamic customer) =>
            customer[keyName].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    update();
  }

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

  //* ---------- *//

  //* Searching for Address using Autocomplete *//
  void onSearchingAddress(String value) {
    if (value == '') {
      listAddress = <dynamic>[];
    } else {
      _dio
          .get(
        urlAutocomplete,
        queryParameters: <String, dynamic>{
          'key': publicKey,
          'input': value,
          'language': language,
          'types': types,
          'components': components,
        },
        options: Options(
          headers: <String, dynamic>{
            'referer': 'http://360connect.app',
          },
        ),
      )
          .then((dynamic response) {
        listAddress = response.data['localities'];
        update();
      });
    }
  }

  //* on Select Address using  locality, address, postal_code *//
  void onSelectAddress({
    required int iDTitle,
    required Map<String, dynamic> address,
  }) {
    final String publicId = address['public_id'];

    addressType = address['type'];
    update();

    switch (addressType) {
      case 'locality':
        {
          onGetAddressDetails(
            iDTitle: iDTitle,
            publicId: publicId,
            addressType: 'locality',
          );
        }
        break;

      case 'address':
        {
          onGetAddressDetails(
            iDTitle: iDTitle,
            publicId: publicId,
            addressType: 'address',
          );
        }
        break;

      case 'postal_code':
        {
          onGetAddressDetails(
            iDTitle: iDTitle,
            publicId: publicId,
            addressType: 'postal_code',
          );
        }
        break;

      default:
        {
          showMessage(
            description:
                'the only search type is: Locality or Address or Postcode',
            textColor: COMMON_RED_COLOR,
          );
        }
        break;
    }
    update();
  }

  //* Get Address Details Using public Id  *//
  void onGetAddressDetails({
    required int iDTitle,
    required String publicId,
    required String addressType,
  }) {
    startLoading();
    _dio
        .get(
      urlDetails,
      queryParameters: <String, dynamic>{
        'key': publicKey,
        'public_id': publicId,
      },
      options: Options(
        headers: <String, dynamic>{
          'referer': 'http://360connect.app',
        },
      ),
    )
        .then(
      (dynamic details) async {
        fillAddressData(
            iDTitle: iDTitle,
            data: details.data,
            addressType: details.data['result']['types'].first);
        dismissLoading();
      },
    ).onError((Object? error, StackTrace stackTrace) {
      dismissLoading();
    });
  }

  //* Set Address Data  *//
  void fillAddressData({
    required int iDTitle,
    required dynamic data,
    required String addressType,
  }) {
    addressData = data;

    data['result']['address_components'].forEach((dynamic item) =>
        addressDetails![item['types'][0]] = item['long_name']);
    update();
    // consoleLog(data['result']['types'].first);
    // final String typePostal = data['result']['types'].first;
    // consoleLog(data['result']['geometry']['location']['lat'].toString());
    // consoleLog(data['result']['geometry']['location']['lng'].toString());
    final String addressLat =
        data['result']['geometry']['location']['lat'].toString();
    final String addressLng =
        data['result']['geometry']['location']['lng'].toString();

    if (addressType == 'locality' ||
        addressType == 'address' ||
        (addressType == 'postal_code' &&
            data['result']['addresses']['list'].isEmpty)) {
      switch (iDTitle) {
        case 0:
          {
            setCustomerAddressData(
              addressName: data['result']['formatted_address'] ?? '',
              cityName: addressDetails!['locality'] ?? '',
              countryName: addressDetails!['country'] ?? '',
              postCode: addressDetails!['postal_codes'] ?? '',
              streetName: addressDetails!['route'] ?? '',
              streetNum: addressDetails!['street_number'] ?? '',
              lat: addressLat,
              lng: addressLng,
            );
            // Auto Fill Billing Address
            setCustomerBillingAddressData(
              addressName: data['result']['formatted_address'] ?? '',
              cityName: addressDetails!['locality'] ?? '',
              countryName: addressDetails!['country'] ?? '',
              postCode: addressDetails!['postal_codes'] ?? '',
              streetName: addressDetails!['route'] ?? '',
              streetNum: addressDetails!['street_number'] ?? '',
            );
            // Auto Fill Site Address
            setCustomerSiteAddressData(
              addressName: data['result']['formatted_address'] ?? '',
              cityName: addressDetails!['locality'] ?? '',
              countryName: addressDetails!['country'] ?? '',
              postCode: addressDetails!['postal_codes'] ?? '',
              streetName: addressDetails!['route'] ?? '',
              streetNum: addressDetails!['street_number'] ?? '',
              lat: addressLat,
              lng: addressLng,
            );
            hideKeyboard();
            Get.back();
          }
          break;

        case 1:
          {
            setCustomerBillingAddressData(
              addressName: data['result']['formatted_address'] ?? '',
              cityName: addressDetails!['locality'] ?? '',
              countryName: addressDetails!['country'] ?? '',
              postCode: addressDetails!['postal_codes'] ?? '',
              streetName: addressDetails!['route'] ?? '',
              streetNum: addressDetails!['street_number'] ?? '',
            );
            // Auto Fill Site Address
            setCustomerSiteAddressData(
              addressName: data['result']['formatted_address'] ?? '',
              cityName: addressDetails!['locality'] ?? '',
              countryName: addressDetails!['country'] ?? '',
              postCode: addressDetails!['postal_codes'] ?? '',
              streetName: addressDetails!['route'] ?? '',
              streetNum: addressDetails!['street_number'] ?? '',
              lat: addressLat,
              lng: addressLng,
            );
            hideKeyboard();
            Get.back();
          }
          break;

        case 2:
          {
            setCustomerSiteAddressData(
              addressName: data['result']['formatted_address'] ?? '',
              cityName: addressDetails!['locality'] ?? '',
              countryName: addressDetails!['country'] ?? '',
              postCode: addressDetails!['postal_codes'] ?? '',
              streetName: addressDetails!['route'] ?? '',
              streetNum: addressDetails!['street_number'] ?? '',
              lat: addressLat,
              lng: addressLng,
            );
            hideKeyboard();
            Get.back();
          }
          break;
      }
    } else if (addressType == 'postal_code' &&
        data['result']['addresses']['list'].isNotEmpty) {
      final List<dynamic> postalCodeResult =
          data['result']['addresses']['list'];

      searchAllAddress = postalCodeResult;
      update();
      Get.bottomSheet(
        SearchFullAddressBottomSheet(
          iDTitle: iDTitle,
        ),
        isScrollControlled: true,
        elevation: 0.0,
      );
    }

    update();
  }

  //* Set Address Data Functions *//
  void setCustomerAddressData({
    required String addressName,
    required String cityName,
    required String postCode,
    required String countryName,
    required String streetName,
    required String streetNum,
    required String lat,
    required String lng,
  }) {
    customerAddressController.text = addressName;
    customerCityController.text = cityName;
    customerPostcodeController.text = postCode;
    customerSelectedCountry['name'] = countryName;

    if (streetName.isNotEmpty && streetNum.isNotEmpty) {
      customerStreetController.text = '$streetNum, $streetName';
    } else if (streetName.isNotEmpty && streetNum.isEmpty) {
      customerStreetController.text = ' , $streetName';
    } else if (streetName.isEmpty && streetNum.isNotEmpty) {
      customerStreetController.text = '$streetNum, ';
    }
    customerAddressLat = lat;
    customerAddressLng = lng;
    // consoleLog('$customerAddressLat , $customerAddressLng');
    update();
  }

  void setCustomerBillingAddressData({
    required String addressName,
    required String cityName,
    required String postCode,
    required String countryName,
    required String streetName,
    required String streetNum,
  }) {
    // consoleLog('1 Set Billing Address Details');
    customerBillingAddressController.text = addressName;
    customerBillingCityController.text = cityName;
    customerBillingPostcodeController.text = postCode;
    billingSelectedCountry['name'] = countryName;

    if (streetName.isNotEmpty && streetNum.isNotEmpty) {
      customerBillingStreetController.text = '$streetNum, $streetName';
    } else if (streetName.isNotEmpty && streetNum.isEmpty) {
      customerBillingStreetController.text = ' , $streetName';
    } else if (streetName.isEmpty && streetNum.isNotEmpty) {
      customerBillingStreetController.text = '$streetNum, ';
    }
    update();
  }

  void setCustomerSiteAddressData({
    required String addressName,
    required String cityName,
    required String postCode,
    required String countryName,
    required String streetName,
    required String streetNum,
    required String lat,
    required String lng,
  }) {
    // consoleLog('2 Set Customer Site Address Details');
    siteAddressAddressNameController.text = addressName;
    siteAddressCityController.text = cityName;
    siteAddressPostcodeController.text = postCode;
    siteAddressSelectedCountry['name'] = countryName;

    if (streetName.isNotEmpty && streetNum.isNotEmpty) {
      siteAddressStreetController.text = '$streetNum, $streetName';
    } else if (streetName.isNotEmpty && streetNum.isEmpty) {
      siteAddressStreetController.text = ' , $streetName';
    } else if (streetName.isEmpty && streetNum.isNotEmpty) {
      siteAddressStreetController.text = '$streetNum, ';
    }
    siteAddressAddressLat = lat;
    siteAddressAddressLng = lng;
    // consoleLog('$siteAddressAddressLat , $siteAddressAddressLng');
    update();
  }

  //?============= Add customers API ==============*/

  Future<void> onAddCustomer() async {
    hideKeyboard();
    // startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: createCustomer,
      className: 'NewJobController/onAddCustomer',
      requestFunction: onAddCustomer,
      withLoading: true,
      body: <String, dynamic>{
        'name': customerNameController.text,
        'type_id': selectedCustomerType == 'Individual' ? 1 : 2,
        'address': customerAddressController.text,
        'street_num': customerStreetController.text,
        'city': customerCityController.text,
        'postal_code': customerPostcodeController.text,
        'country_id': customerSelectedCountry[keyId],
        //
        'billing_details': isSelectBilling ? 'yes' : 'no',
        'billing_address': customerBillingAddressController.text,
        'billing_street_num': customerBillingStreetController.text,
        'billing_city': customerBillingCityController.text,
        'billing_postal_code': customerBillingPostcodeController.text,
        'billing_country_id': billingSelectedCountry[keyId],
        'credit_limit': customerFinanceCreditController.text,
        'payment_terms': selectedPaymentTerms![keyId],
        'send_statement': isSendStatements ? 'yes' : 'no',
        //*------------------------------------*//
        'client_f_name': clientContactFirstNameController.text,
        'client_l_name': clientContactLastNameController.text,
        'client_phone': clientContactPhoneController.text,
        'client_email': clientContactEmailController.text,
        'client_type': selectedClientContactType,
        //
        'copy_site_address': radioSiteAddress ? 'yes' : 'no',
        'site_name': siteAddressSiteNameController1.text,
        'site_address': siteAddressAddressNameController.text,
        'site_street_num': siteAddressStreetController.text,
        'site_city': siteAddressCityController.text,
        'site_postal_code': siteAddressPostcodeController.text,
        'site_country_id': siteAddressSelectedCountry[keyId],
        //
        'copy_contact': radioSiteContact ? 'yes' : 'no',
        'site_contact_type': selectedClientTypeOnSiteContact,
        'site_contact_f_name': siteContactFirstNameController.text,
        'site_contact_l_name': siteContactLastNameController.text,
        'site_contact_phone': siteContactPhoneController.text,
        'site_contact_email': siteContactEmailController.text,
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        addedCustomerData = data;
        consoleLogPretty(addedCustomerData[keyId], key: 'customer_Id');
        myAppController.selectedCustomer = data;
        // Get.toNamed(routeForms);
        Get.offNamed(
          myAppController.selectedForm?['form_route'],
          arguments: {
            'tempData': myAppController.selectedTemplate,
          },
        );
      },
    );
    update();
  }

  //?============= Get All Customers ==============*/

  Future<void> getAllCustomers() async {
    hideKeyboard();

    ApiRequest(
      path: keyGetAllCustomers,
      className: 'CreateNewCustomerController/getAllCustomers',
      requestFunction: getAllCustomers,
      withLoading: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.localStorage.saveToStorage(
          key: 'getAllCustomers',
          value: data,
        );
        allCustomers = data;
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getAllCustomers',
      );
      allCustomers = apiData;
      update();
    }

    update();
  }

  Future<void> getCustomerData() async {
    hideKeyboard();
    startLoading();

    ApiRequest(
      path: '/customers/$selectedCustomerId/customer',
      className: 'CreateNewCustomerController/getCustomerData',
      requestFunction: getCustomerData,
      // withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) async {
        myAppController.localStorage.saveToStorage(
          key: 'getCustomerData',
          value: data,
        );
        customerData = data;
        await setCustomerData();
        update();
        // consoleLogPretty(customerData, key: 'customerData');
      },
    );
    if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getCustomerData',
      );
      customerData = apiData;

      update();
      dismissLoading();
    }

    update();
  }

  // TextEditingController custCountry = TextEditingController();

  Future<void> setCustomerData() async {
    customerNameController.text = customerData['name'];
    selectedCustomerType = customerData['type'];
    customerAddressController.text = customerData['address'];
    customerAddressController.text = customerData['address'] ?? '';
    customerStreetController.text = customerData['street_num'];
    customerCityController.text = customerData['city'];
    customerPostcodeController.text = customerData['postal_code'];
    // customerAddressController = customerData['country_id'];
    isSelectBilling = customerData['billing_details'] == 'yes';

    customerBillingAddressController.text =
        customerData['billing_info']['address'] ?? '';
    customerBillingStreetController.text =
        customerData['billing_info']['street_num'];
    customerBillingCityController.text = customerData['billing_info']['city'];
    customerBillingPostcodeController.text =
        customerData['billing_info']['postal_code'];

    customerFinanceCreditController.text =
        customerData['billing_info']['credit_limit'] ?? '';
    paymentTerm = customerData['billing_info']['payment_term']['name'];
    isSendStatements = customerData['billing_info']['send_statement'] == 'yes';

    clientContactFirstNameController.text =
        customerData['contacts'][0]['f_name'];
    clientContactLastNameController.text =
        customerData['contacts'][0]['l_name'];
    clientContactPhoneController.text = customerData['contacts'][0]['phone'];
    clientContactEmailController.text = customerData['contacts'][0]['email'];
    selectedClientContactType = customerData['contacts'][0]['type'];

    //
    siteAddressSiteNameController1.text = customerData['sites'][0]['name'];
    siteAddressAddressNameController.text =
        customerData['sites'][0]['address'] ?? '';
    siteAddressStreetController.text = customerData['sites'][0]['street_num'];
    siteAddressCityController.text = customerData['sites'][0]['city'];
    siteAddressPostcodeController.text =
        customerData['sites'][0]['postal_code'];
    countryOnPage3 = customerData['sites'][0]['country'];

    //
    siteContactFirstNameController.text =
        customerData['sites'][0]['site_contact']['f_name'];

    siteContactLastNameController.text =
        customerData['sites'][0]['site_contact']['l_name'] ?? '';

    siteContactPhoneController.text =
        customerData['sites'][0]['site_contact']['phone'];

    siteContactEmailController.text =
        customerData['sites'][0]['site_contact']['email'];

    selectedClientTypeOnSiteContact =
        customerData['sites'][0]['site_contact']['type'];

    update();
    dismissLoading();
    consoleLog('Success');
  }

  @override
  void onInit() {
    // if (Get.arguments != null) {}
    super.onInit();
  }
}
