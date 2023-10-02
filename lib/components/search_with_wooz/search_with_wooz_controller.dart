import 'dart:async';

import 'package:dio/dio.dart';

import '../../general_exports.dart';

class AddressData {
  AddressData.fromMap(Map<String, dynamic> data) {
    siteName = data[keySiteName];
    address = data[keyAddress];
    street = data[keyStreet];
    city = data[keyCity];
    state = data[keyState];
    postcode = data[keyPostcode];
    country = data[keyCountry];
    countryId = data[keyCountryId];
  }
  AddressData(
    this.siteName,
    this.address,
    this.street,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.countryId,
  );
  String? siteName;
  String? address;
  String? street;
  String? city;
  String? state;
  String? postcode;
  String? country;
  int? countryId;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      keySiteName: siteName ?? '',
      keyAddress: address ?? '',
      keyStreet: street ?? '',
      keyCity: city ?? '',
      keyState: state ?? '',
      keyPostcode: postcode ?? '',
      keyCountry: country ?? '',
      keyCountryId: countryId ?? '',
    };
  }
}

class SearchWithWoozController extends GetxController {
  TextEditingController addressController = TextEditingController();
  TextEditingController addressMoreController = TextEditingController();
  TextEditingController siteNameController = TextEditingController();

  bool isExpandedDetails = false;

  List<AddressData> listAddressData = <AddressData>[];

  // Map<String, dynamic> bodyData = <String, dynamic>{
  //   keyAddress: '',
  //   keyStreet: '',
  //   keyCity: '',
  //   keyState: '',
  //   keyPostcode: '',
  //   keyCountry: '',
  //   keyCountryId: '',
  // };

  //* ----- Map

  final Dio _dio = Dio();

  List<dynamic>? listAddress;
  List<dynamic>? searchAllAddress;
  Map<String, dynamic>? specificAddress;
  String? addressType;
  Map<String, dynamic>? addressData;
  Map<String, dynamic>? addressDetails = <String, dynamic>{};

  List<dynamic> allCountries = <dynamic>[];
  Map<String, dynamic>? selectedCountry;

  DateTime? lastDateTime;
  Future<dynamic>? myFunction;

  @override
  void onReady() {
    getCountries();
    super.onReady();
  }

  //* Searching for Address using Autocomplete *//
  void onSearchingAddress({String? value, bool isClicked = false}) {
    consoleLog('value2');
    if (value == '') {
      listAddress = <dynamic>[];
      update();
    } else {
      lastDateTime = DateTime.now();

      Future<dynamic>.delayed(
        Duration(milliseconds: isClicked ? 0 : 1500),
        () {
          if ((DateTime.now().difference(lastDateTime!) >=
                  Duration(milliseconds: isClicked ? 0 : 1500) &&
              value == addressController.text)) {
            consoleLog('value');
            startLoading();
            getAutocompleteData(value);
          }
        },
      );
    }
  }

  void getAutocompleteData(String? value) {
    try {
      _dio
          .get(
        urlAutocomplete,
        queryParameters: <String, dynamic>{
          'key': publicKey,
          'input': value,
          'language': language,
          'types': 'address',
          'components': components,
        },
        options: Options(
          headers: <String, dynamic>{
            'referer': 'http://360connect.app',
          },
        ),
      )
          .then(
        (dynamic response) {
          listAddress = response.data['localities'];
          consoleLogPretty(listAddress, key: 'list_Address_api_log');
          update();
          dismissLoading();
        },
      );
    } on Exception catch (error) {
      consoleLog(error, key: 'Exception_Error');
      dismissLoading();
    }
  }

  //* on Select Address using  locality, address, postal_code *//
  void onSelectAddress({
    required Map<String, dynamic> address,
    required SearchWithWoozController controller,
  }) {
    hideKeyboard();
    final String publicId = address['public_id'];

    addressType = address['type'];
    update();

    switch (addressType) {
      case 'locality':
        {
          onGetAddressDetails(
            publicId: publicId,
            addressType: 'locality',
            controller: controller,
          );
        }
        break;

      case 'address':
        {
          onGetAddressDetails(
            publicId: publicId,
            addressType: 'address',
            controller: controller,
          );
        }
        break;

      case 'postal_code':
        {
          onGetAddressDetails(
            publicId: publicId,
            addressType: 'postal_code',
            controller: controller,
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
    required String publicId,
    required String addressType,
    required SearchWithWoozController controller,
  }) {
    startLoading();
    consoleLog(publicId, key: 'publicId');
    _dio
        .get(
      'https://api.woosmap.com/address/details/json',
      queryParameters: <String, dynamic>{
        'public_id': publicId,
        'key': publicKey,
        'language': language,
      },
      options: Options(
        headers: <String, dynamic>{
          'referer': 'http://360connect.app',
        },
      ),
    )
        .then(
      (dynamic details) async {
        // consoleLog(details);
        consoleLogPretty(details.data,
            key: 'onGetAddressDetails_api_log'); // address/details/json?
        hideKeyboard();

        setAddressData(
          data: details.data,
          addressType: details.data['result']['types'].first,
          controller: controller,
        );
        dismissLoading();
      },
    ).onError(
      (Object? error, StackTrace stackTrace) {
        consoleLog(error, key: 'onError');
        dismissLoading();
      },
    );
  }

  void setAddressData({
    required dynamic data,
    required String addressType,
    required SearchWithWoozController controller,
  }) {
    addressData = data;

    consoleLogPretty(addressType, key: 'addressType');
    consoleLogPretty(addressData, key: 'data');

    data['result']['address_components'].forEach((dynamic item) =>
        addressDetails![item['types'][0]] = item['long_name']);
    final Map<String, dynamic> address = <String, dynamic>{
      'formatted_address': data['result']['formatted_address']
    };
    addressDetails?.addEntries(address.entries);
    consoleLogPretty(addressDetails, key: 'Details_data');
    // consoleLogPretty(data, key: 'more_Details_data');
    update();

    saveAddressData(
      data: addressDetails ?? <String, dynamic>{},
      location: data['result']['geometry']['location'],
    );

    update();
  }

  bool? isIndividualSite;
  void saveAddressData({
    required Map<String, dynamic> data,
    required Map<String, dynamic> location,
  }) {
    final Map<String, dynamic> addressData = <String, dynamic>{};

    addressData[keySiteName] = siteNameController.text.trim();
    addressData[keyAddress] = data['formatted_address'];
    addressData[keyCity] = data['locality'];
    addressData[keyState] = data['state'];
    addressData[keyPostcode] = data['postal_code'];
    addressData[keyCountry] = data['country'];

    // if founded street_Number and street_Name
    if (data.containsKey('route') && data.containsKey('street_number')) {
      addressData[keyStreet] = '${data['street_number']} ${data['route']}';
    }
    // if founded Just street_Name
    else if (data.containsKey('route')) {
      addressData[keyStreet] = '${data['route']}';
    }
    // if founded Just street_Number
    else if (data.containsKey('street_number')) {
      addressData[keyStreet] = '${data['street_number']}';
    }

    siteNameController.clear();

    if (allCountries
        .where((dynamic e) => e['name'] == addressData[keyCountry])
        .isNotEmpty) {
      selectedCountry = allCountries.firstWhereOrNull(
          (dynamic e) => e['name'] == addressData[keyCountry]);
      if (selectedCountry != null) {
        addressData[keyCountryId] = selectedCountry?[keyId];
      }
    }

    final AddressData address = AddressData.fromMap(addressData);

    if (isIndividualSite != null && isIndividualSite!) {
      listAddressData.clear();
      listAddressData.add(address);
    } else {
      listAddressData.add(address);
    }

    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    if (Get.isBottomSheetOpen!) {
      Get.back();
    }

    isExpandedDetails = true;

    update();
  }

  Future<void> getCountries() async {
    hideKeyboard();
    if (allCountries.isEmpty) {
      ApiRequest(
        path: keyGetCountries,
        className: 'SearchWithWoozController/getCountries',
        requestFunction: getCountries,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          allCountries = data;

          update();
        },
      );
    }
  }

  // @override
  // void onClose() {
  //   focusNode1.dispose();
  //   focusNode2.dispose();
  //   super.onClose();
  // }
}
