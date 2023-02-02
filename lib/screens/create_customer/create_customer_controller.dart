import 'package:dio/dio.dart';

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

  Map<String, dynamic>? addedSiteContact;

  //* ------

  List<dynamic> allCountries = <dynamic>[];
  List<dynamic>? filterAllCountries;
  List<dynamic>? filterBillingCountries;
  List<dynamic>? filterSiteAddressCountries;

  //* ----- Map

  final Dio _dio = Dio();

  List<dynamic>? listAddress;
  List<dynamic>? searchAllAddress;
  Map<String, dynamic>? specificAddress;
  String? addressType;
  Map<String, dynamic>? addressData;
  Map<String, dynamic>? addressDetails = <String, dynamic>{};

  //*---------------Functions -----------------*//
  List<dynamic> allPaymentTerms = <dynamic>[];

  void onPressNext() {
    if (currentIndex == 3) {
      Get.toNamed(routeForms);
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

  //**---------- *//

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
        consoleLogPretty(response.data, key: 'json_a');
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
          consoleLog(addressType);
          onGetAddressDetails(
            iDTitle: iDTitle,
            publicId: publicId,
            addressType: 'locality',
          );
        }
        break;

      case 'address':
        {
          consoleLog(addressType);
          onGetAddressDetails(
            iDTitle: iDTitle,
            publicId: publicId,
            addressType: 'address',
          );
        }
        break;

      case 'postal_code':
        {
          consoleLog(addressType);
          onGetAddressDetails(
            iDTitle: iDTitle,
            publicId: publicId,
            addressType: 'postal_code',
          );
        }
        break;

      default:
        {
          consoleLog(addressType);
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
        consoleLogPretty(details.data, key: 'postal_code_json');
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
    consoleLog('test fill Address');
    addressData = data;

    data['result']['address_components'].forEach((dynamic item) =>
        addressDetails![item['types'][0]] = item['long_name']);
    update();
    consoleLogPretty(addressData);
    consoleLogPretty(addressDetails);
    consoleLog('Type on fillAddressData: $addressType');
    // consoleLog(data['result']['types'].first);
    // final String typePostal = data['result']['types'].first;
    consoleLog(data['result']['geometry']['location']['lat'].toString());
    consoleLog(data['result']['geometry']['location']['lng'].toString());
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
    consoleLog('0 Set Customer Address Details');
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
    consoleLog('$customerAddressLat , $customerAddressLng');
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
    consoleLog('1 Set Billing Address Details');
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
    consoleLog('2 Set Customer Site Address Details');
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
    consoleLog('$siteAddressAddressLat , $siteAddressAddressLng');
    update();
  }
}
