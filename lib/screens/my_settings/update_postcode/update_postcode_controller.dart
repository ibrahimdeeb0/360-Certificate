import 'package:dio/dio.dart';

import '../../../general_exports.dart';

class UpdatePostcodeController extends GetxController {
  TextEditingController searchAddressController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Map<String, dynamic> userData = <String, dynamic>{};
  Map<String, dynamic>? selectedCountry;

  //* ----- Map

  final Dio _dio = Dio();
  List<dynamic>? listAddress;
  List<dynamic>? searchAllAddress;
  Map<String, dynamic>? specificAddress;
  String? addressType;
  Map<String, dynamic>? addressData;
  Map<String, dynamic>? addressDetails = <String, dynamic>{};

  List<dynamic> allCountries = <dynamic>[];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      userData = Get.arguments[keyData];
      consoleLogPretty(userData);
      addressController.text = userData['registered_address'];
      streetController.text = userData['number_street_name'];
      cityController.text = userData['city'];
      postcodeController.text = userData['postal_code'];
      selectedCountry = userData['country'];
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getCountries();
  }

  //* Searching for Address with Autocomplete *//
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
          .then(
        (dynamic response) {
          listAddress = response.data['localities'];
          update();
        },
      );
    }
  }

  //* on Select Address using  locality, address, postal_code *//
  void onSelectAddress({
    required Map<String, dynamic> address,
  }) {
    final String publicId = address['public_id'];

    addressType = address['type'];
    update();

    switch (addressType) {
      case 'locality':
        {
          onGetAddressDetails(
            publicId: publicId,
            addressType: 'locality',
          );
        }
        break;

      case 'address':
        {
          onGetAddressDetails(
            publicId: publicId,
            addressType: 'address',
          );
        }
        break;

      case 'postal_code':
        {
          onGetAddressDetails(
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
            data: details.data,
            addressType: details.data['result']['types'].first);
        dismissLoading();
      },
    ).onError(
      (Object? error, StackTrace stackTrace) {
        dismissLoading();
      },
    );
  }

  void fillAddressData({
    required dynamic data,
    required String addressType,
  }) {
    addressData = data;

    data['result']['address_components'].forEach((dynamic item) =>
        addressDetails![item['types'][0]] = item['long_name']);
    update();

    final String addressLat =
        data['result']['geometry']['location']['lat'].toString();
    final String addressLng =
        data['result']['geometry']['location']['lng'].toString();

    if (addressType == 'locality' ||
        addressType == 'address' ||
        (addressType == 'postal_code' &&
            data['result']['addresses']['list'].isEmpty)) {
      setUserAddressData(
        addressName: data['result']['formatted_address'] ?? '',
        cityName: addressDetails!['locality'] ?? '',
        countryName: addressDetails!['country'] ?? '',
        postCode: addressDetails!['postal_codes'] ?? '',
        streetName: addressDetails!['route'] ?? '',
        streetNum: addressDetails!['street_number'] ?? '',
        lat: addressLat,
        lng: addressLng,
      );
    } else if (addressType == 'postal_code' &&
        data['result']['addresses']['list'].isNotEmpty) {
      final List<dynamic> postalCodeResult =
          data['result']['addresses']['list'];

      searchAllAddress = postalCodeResult;
      update();
      Get.bottomSheet(
        const SearchFullAddressSetting(),
        isScrollControlled: true,
        elevation: 0.0,
      );
    }
    update();
  }

  //* Set Address Data Functions *//
  bool showAddressFiled = false;
  void setUserAddressData({
    required String addressName,
    required String cityName,
    required String postCode,
    required String countryName,
    required String streetName,
    required String streetNum,
    required String lat,
    required String lng,
  }) {
    addressController.text = addressName;
    cityController.text = cityName;
    postcodeController.text = postCode;
    countryController.text = countryName;

    if (streetName.isNotEmpty && streetNum.isNotEmpty) {
      streetController.text = '$streetNum, $streetName';
    } else if (streetName.isNotEmpty && streetNum.isEmpty) {
      streetController.text = ' , $streetName';
    } else if (streetName.isEmpty && streetNum.isNotEmpty) {
      streetController.text = '$streetNum, ';
    }

    searchForCountryId();

    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    showAddressFiled = true;
    // customerAddressLat = lat;
    // customerAddressLng = lng;
    // consoleLog('$customerAddressLat , $customerAddressLng');
    update();
  }

  void searchForCountryId() {
    if (allCountries
        .where((dynamic e) => e['name'] == countryController.text)
        .isNotEmpty) {
      selectedCountry = allCountries
          .firstWhereOrNull((dynamic e) => e['name'] == countryController.text);
    }

    consoleLog(selectedCountry, key: 'selected_Country');
  }

  Future<void> getCountries() async {
    hideKeyboard();
    if (allCountries.isEmpty) {
      ApiRequest(
        path: keyGetCountries,
        className: 'NewJobController/getCountries',
        requestFunction: getCountries,
      ).request(
        onSuccess: (dynamic data, dynamic response) {
          allCountries = data;

          update();
        },
      );
    }
  }

  void onUpdateSite() {
    hideKeyboard();
    startLoading();
    ApiRequest(
      shouldShowMessage: false,
      method: ApiMethods.put,
      path: '/profile/change-address',
      className: 'RegisterController/onCreateNote',
      requestFunction: onUpdateSite,
      // withLoading: true,
      body: <String, dynamic>{
        'registered_address': addressController.text,
        'number_street_name': cityController.text,
        'city': cityController.text,
        'postal_code': postcodeController.text,
        'country_id': selectedCountry?[keyId],
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        if (Get.isRegistered<MySettingsController>()) {
          Get.find<MySettingsController>().getUserData();
        }
        Get.back();
        // update();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
  }
}
