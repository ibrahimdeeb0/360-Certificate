import 'package:dio/dio.dart';

import '../../general_exports.dart';

enum SetupStatus {
  start,
  fill,
  end,
}

enum CurrentPage {
  page0,
  page1,
  page2,
  // page3,
}

class CompleteProfileController extends GetxController {
  SetupStatus setupStatus = SetupStatus.start;
  CurrentPage currentPage = CurrentPage.page0;

  TextEditingController registeredCompanyController = TextEditingController();
  TextEditingController tradingNameController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController vATNumberController = TextEditingController();

  TextEditingController searchAddressController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Map<String, String> titleMap = <String, String>{
    CurrentPage.page0.name: 'What the forms you would like to activate',
    CurrentPage.page1.name:
        'Now We Need Your Business Details To Finish Off The Account',
    CurrentPage.page2.name:
        'Now Just Need To Know Your Registered Address For The Business And This Will Be Displayed On All Quotes And Invoices',
  };
  Map<String, double> pagesCircleMap = <String, double>{
    CurrentPage.page0.name: 0.34,
    CurrentPage.page1.name: 0.65,
    CurrentPage.page2.name: 1.0,
  };
  Map<String, String> pagesNumMap = <String, String>{
    CurrentPage.page0.name: '1/3',
    CurrentPage.page1.name: '2/3',
    CurrentPage.page2.name: '3/3',
  };
  Map<String, Widget> pagesContentsMap = <String, Widget>{
    CurrentPage.page0.name: const ContentPart1(),
    CurrentPage.page1.name: const ContentPart2(),
    CurrentPage.page2.name: const ContentPart3(),
  };

  List<Map<String, dynamic>> listAllForms = <Map<String, dynamic>>[
    // <String, dynamic>{
    //   keyId: 1,
    //   keyName: 'Portable Appliance Testing',
    // },
    // <String, dynamic>{
    //   keyId: 3,
    //   keyName: 'Domestic Electrical Installation Certificate'
    // },
    // <String, dynamic>{
    //   keyId: 4,
    //   keyName: 'Electrical Danger Notification',
    // },
    <String, dynamic>{
      keyId: 5,
      keyName: 'Domestic Electrical installation Condition report'
    },
    // <String, dynamic>{
    //   keyId: 9,
    //   keyName: 'Landlord/Homeowner Gas Safety Record',
    // },
  ];

  List<Map<String, dynamic>> unActiveForms = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 1,
      keyName: 'Portable Appliance Testing',
    },
    <String, dynamic>{
      keyId: 3,
      keyName: 'Domestic Electrical Installation Certificate'
    },
    <String, dynamic>{
      keyId: 4,
      keyName: 'Electrical Danger Notification',
    },
    // <String, dynamic>{
    //   keyId: 5,
    //   keyName: 'Domestic Electrical installation Condition report'
    // },
    <String, dynamic>{
      keyId: 9,
      keyName: 'Landlord/Homeowner Gas Safety Record',
    },
  ];
  List<Map<String, dynamic>> selectedForms = <Map<String, dynamic>>[];

  List<dynamic> allCountries = <dynamic>[];

  bool isVatRegistered = false;

  //* ----- Map

  final Dio _dio = Dio();

  List<dynamic>? listAddress;
  List<dynamic>? searchAllAddress;
  Map<String, dynamic>? specificAddress;
  String? addressType;
  Map<String, dynamic>? addressData;
  Map<String, dynamic>? addressDetails = <String, dynamic>{};

  Map<String, dynamic>? selectedCountry;

  @override
  void onReady() {
    super.onReady();
    getCountries();
  }

  void toggleVat() {
    isVatRegistered = !isVatRegistered;
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

  // Map<String, dynamic> nextActionMap = <String, dynamic>{
  //   CurrentPage.page0.name: () => currentPage = CurrentPage.page1,
  //   CurrentPage.page1.name: const ContentPart2(),
  //   CurrentPage.page2.name: const ContentPart3(),
  // };

  String headerTitle() => titleMap[currentPage.name] ?? '';

  double pagesCircleTween() => pagesCircleMap[currentPage.name] ?? 0;

  String pagesNumTween() => pagesNumMap[currentPage.name] ?? '';

  Widget pagesContents() =>
      pagesContentsMap[currentPage.name] ?? const SizedBox();

  void onNext() {
    inputsValidation();
    switch (currentPage) {
      case CurrentPage.page0:
        currentPage = CurrentPage.page1;
        break;
      case CurrentPage.page1:
        {
          if (isValidP1) {
            currentPage = CurrentPage.page2;
          } else {
            showMessage(
              description: 'Please fill all required fields',
              textColor: AppColors.red2,
            );
          }
        }
        break;
      case CurrentPage.page2:
        if (isValidP2) {
          setupStatus = SetupStatus.end;
        } else {
          showMessage(
            description: 'Please fill all required fields',
            textColor: AppColors.red2,
          );
        }

        break;
    }

    update();
  }

  void onBack() {
    switch (currentPage) {
      case CurrentPage.page0:
        setupStatus = SetupStatus.start;
        break;
      case CurrentPage.page1:
        currentPage = CurrentPage.page0;
        break;
      case CurrentPage.page2:
        currentPage = CurrentPage.page1;
        break;
    }

    update();
  }

  void setPageValue(dynamic value) {
    currentPage = value;
  }

  void onSelectForm(Map<String, dynamic> form) {
    if (selectedForms
        .where((Map<String, dynamic> item) => item[keyId] == form[keyId])
        .isNotEmpty) {
      selectedForms.removeWhere(
          (Map<String, dynamic> item) => item[keyId] == form[keyId]);
    } else {
      selectedForms.add(form);
    }
    update();
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
        const SearchFullAddress(),
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

  bool isValidP1 = false;
  bool isValidP2 = false;
  void inputsValidation() {
    if (currentPage == CurrentPage.page1) {
      if (isVatRegistered) {
        isValidP1 = registeredCompanyController.text.isNotEmpty &&
            tradingNameController.text.isNotEmpty &&
            vATNumberController.text.isNotEmpty;
      } else {
        isValidP1 = registeredCompanyController.text.isNotEmpty &&
            tradingNameController.text.isNotEmpty;
      }
    } else if (currentPage == CurrentPage.page2) {
      isValidP2 = streetController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          postcodeController.text.isNotEmpty;
    }
  }

  void onCompleteProfile() {
    ApiRequest(
      method: ApiMethods.post,
      path: keyCompleteProfile,
      className: 'CompleteProfileController/onCompleteProfile',
      requestFunction: onCompleteProfile,
      withLoading: true,
      body: <String, dynamic>{
        'company_name': registeredCompanyController.text.trim(),
        'trading_name': tradingNameController.text.trim(),
        'registration_number': registrationNumberController.text.trim(),
        'has_vat': isVatRegistered ? 'yes' : 'no',
        'vat_number': vATNumberController.text.trim(),
        'registered_address': addressController.text.trim(),
        'postal_code': postcodeController.text.trim(),
        'number_street_name': streetController.text.trim(),
        'city': cityController.text.trim(),
        'country_id': selectedCountry?[keyId],
        'forms_id': selectedForms.map((dynamic item) => item[keyId]).toList(),
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        final dynamic tempUserData = myAppController.userData;
        tempUserData['isProfileComplete'] = true;
        myAppController.onUserUpdated(tempUserData);
        Get.offAllNamed(routeHomeBottomBar);
      },
    );
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
}
