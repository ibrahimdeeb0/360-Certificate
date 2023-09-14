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
  void onSearchingAddress(String value) {
    if (value == '') {
      // consoleLog('inside Empty', key: 'Inside_Empty');

      listAddress = <dynamic>[];
      update();
    } else {
      lastDateTime = DateTime.now();
      // startLoading();
      Future<dynamic>.delayed(
        const Duration(seconds: 2),
        () {
          if (DateTime.now().difference(lastDateTime!) >=
                  const Duration(seconds: 1) &&
              value == addressController.text) {
            // dismissLoading();
            //*-------------------- Function Body  ---------------------//
            // consoleLog('inside Function Body', key: 'Inside_Function_Body');
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
                .then(
              (dynamic response) {
                listAddress = response.data['localities'];
                consoleLogPretty(listAddress, key: 'list_Address');
                update();
              },
            );
          }
        },
      );
      //*--------------------   ---------------------//
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
    // consoleLog(addressType, key: 'addressType');
    // consoleLog(address, key: 'address');

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
        consoleLogPretty(details.data, key: 'onGetAddressDetails');
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

    // consoleLogPretty(addressData, key: 'addressData_aa');

    data['result']['address_components'].forEach((dynamic item) =>
        addressDetails![item['types'][0]] = item['long_name']);

    consoleLogPretty(addressDetails, key: 'json_Details');
    update();

    final String addressLat =
        data['result']['geometry']['location']['lat'].toString();
    final String addressLng =
        data['result']['geometry']['location']['lng'].toString();

    if (addressType == 'locality' ||
        addressType == 'address' ||
        (addressType == 'postal_code' &&
            data['result']['addresses']['list'].isEmpty)) {
      saveAddressData(
        addressName: data['result']['formatted_address'] ?? '',
        stateName: addressDetails!['administrative_area_level_1'] ?? '',
        cityName: addressDetails!['locality'] ?? '',
        countryName: addressDetails!['country'] ?? '',
        postCode: addressDetails!['postal_codes'] ?? '',
        streetName: addressDetails!['route'] ?? '',
        streetNumber: addressDetails!['street_number'] ?? '',
        lat: addressLat,
        lng: addressLng,
      );
    } else if (addressType == 'postal_code' &&
        data['result']['addresses']['list'].isNotEmpty) {
      final List<dynamic> postalCodeResult =
          data['result']['addresses']['list'];

      searchAllAddress = postalCodeResult;
      update();
      hideKeyboard();
      Get.bottomSheet(
        SearchingFullAddress(
          searchWithWoozController: controller,
        ),
        isScrollControlled: true,
        elevation: 0.0,
      );
    }
    update();
  }

  bool? isIndividualSite;
  void saveAddressData({
    required String addressName,
    required String stateName,
    required String cityName,
    required String postCode,
    required String countryName,
    required String streetName,
    required String streetNumber,
    required String lat,
    required String lng,
  }) {
    final Map<String, dynamic> addressData = <String, dynamic>{};

    addressData[keySiteName] = siteNameController.text.trim();
    addressData[keyAddress] = addressName;
    addressData[keyCity] = cityName;
    addressData[keyState] = stateName;
    addressData[keyPostcode] = postCode;
    addressData[keyCountry] = countryName;

    if (streetName.isNotEmpty && streetNumber.isNotEmpty) {
      addressData[keyStreet] = '$streetNumber $streetName';
    } else if (streetName.isNotEmpty && streetNumber.isEmpty) {
      addressData[keyStreet] = ' $streetName';
    } else if (streetName.isEmpty && streetNumber.isNotEmpty) {
      addressData[keyStreet] = '$streetNumber ';
    }

    consoleLog(addressData, key: 'addressData');

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

    // consoleLogPretty(addressData, key: 'saved_addressData');

    // addressController.clear();
    // addressMoreController.clear();

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
