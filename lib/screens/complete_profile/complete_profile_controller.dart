import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../general_exports.dart';

enum SetupStatus {
  start,
  start2,
  fill,
  end,
}

enum CurrentPage {
  page1,
  page2,
  page3,
  page4,
}

class CompleteProfileController extends GetxController {
  SetupStatus setupStatus = SetupStatus.start;
  CurrentPage currentPage = CurrentPage.page1;

  String? fName;
  String? lName;
  String? email;

  FormCertType? formCertType;

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
  TextEditingController stateController = TextEditingController();
  //
  TextEditingController entrySearchAddressController = TextEditingController();
  TextEditingController entryAddressController = TextEditingController();
  TextEditingController entryStreetController = TextEditingController();
  TextEditingController entryCityController = TextEditingController();
  TextEditingController entryPostcodeController = TextEditingController();
  TextEditingController entryCountryController = TextEditingController();
  TextEditingController entryStateController = TextEditingController();

//formCertType
  String page2Title = '';
  Map<String, String> get titleMap => <String, String>{
        CurrentPage.page1.name: 'Certificate Activation Selection',
        CurrentPage.page2.name: page2Title,
        CurrentPage.page3.name: 'Your Company Details',
        CurrentPage.page4.name: 'Your Company Address',
      };
  Map<String, double> pagesCircleMap = <String, double>{
    CurrentPage.page1.name: 0.25,
    CurrentPage.page2.name: 0.5,
    CurrentPage.page3.name: 0.75,
    CurrentPage.page4.name: 1.0,
  };
  Map<String, String> pagesNumMap = <String, String>{
    CurrentPage.page1.name: '1/4',
    CurrentPage.page2.name: '2/4',
    CurrentPage.page3.name: '3/4',
    CurrentPage.page4.name: '4/4',
  };
  Map<String, Widget> pagesContentsMap = <String, Widget>{
    CurrentPage.page1.name: const ContentPart1(),
    CurrentPage.page2.name: const ContentPart2(),
    CurrentPage.page3.name: const ContentPart3(),
    CurrentPage.page4.name: const ContentPart4(),
  };

  List<Map<String, dynamic>> formSelectionGroup = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 1,
      keyType: FormCertType.electrical,
      keyTitle: 'Electrical Certificate',
      'children': <String>[
        'Portable Appliance Testing (PAT)',
        'Electrical Danger Notice',
        'Domestic EIC',
        'EICR'
      ],
    },
    <String, dynamic>{
      keyId: 2,
      keyType: FormCertType.gas,
      keyTitle: 'Gas Certificates',
      'children': <String>[
        'Landlord/Homeowner Gas Safety Record',
        'Warning Notice',
      ],
    },
  ];

  //
  TextEditingController electricalLicenseController = TextEditingController();
  TextEditingController gasNumberController = TextEditingController();

  bool toggleElectricalHaveLicense = true;
  bool gasRegisterNumber = true;

  List<Map<String, dynamic>> selectedElectricBoard = <Map<String, dynamic>>[];
  List<int> electricBoardId = <int>[];

  List<Map<String, dynamic>> listElectricBoard = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 1,
      keyName: 'ELECSA',
    },
    <String, dynamic>{
      keyId: 2,
      keyName: 'STROMA',
    },
    <String, dynamic>{
      keyId: 3,
      keyName: 'IET (Institution of Engineering and Technology)',
    },
    <String, dynamic>{
      keyId: 4,
      keyName: 'JIB (Joint Industry Board)',
    },
    <String, dynamic>{
      keyId: 5,
      keyName: 'SELECT (Scotland)',
    },
    <String, dynamic>{
      keyId: 6,
      keyName: 'NAPIT',
    },
    <String, dynamic>{
      keyId: 7,
      keyName: 'NICEIC',
    },
  ];

  List<dynamic> allCountries = <dynamic>[];

  bool isVatRegistered = false;

  XFile? compLogoFile;

//* ----- Switch  Manual Address Entry
  bool isManualAddressEntry = false;
  void toggleManualAddressEntry({bool? value}) {
    isManualAddressEntry = value!;
    update();
  }

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
  void onInit() {
    super.onInit();
    // fName = Get.arguments['f_name'];
    // lName = Get.arguments['l_name'];
    // email = Get.arguments[keyEmail];
    fName = myAppController.userData['user']['first_name'];
    lName = myAppController.userData['user']['last_name'];
    email = myAppController.userData['user']['email'];
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   getCountries();
  // }

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

  String headerTitle() => titleMap[currentPage.name] ?? '';

  double pagesCircleTween() => pagesCircleMap[currentPage.name] ?? 0;

  String pagesNumTween() => pagesNumMap[currentPage.name] ?? '';

  Widget pagesContents() =>
      pagesContentsMap[currentPage.name] ?? const SizedBox();

  bool isValidP1 = false;
  bool isValidP2 = false;
  bool? isValidP3;
  bool isValidP4 = false;
  String validationMessage = '';
  void inputsValidation() {
    switch (currentPage) {
      case CurrentPage.page1:
        {
          if (selectedFormGroup.isEmpty) {
            isValidP1 = false;
            validationMessage = 'Please Select at least one Certificate';
          } else {
            isValidP1 = true;
            validationMessage = '';
          }
        }
        break;
      case CurrentPage.page2:
        {
          if (formCertType == FormCertType.electrical) {
            if (selectedElectricBoard.isEmpty) {
              isValidP2 = false;
              validationMessage =
                  'Please select your board for the electrical certificates';
            } else {
              isValidP2 = true;
              validationMessage = '';
              if (electricalLicenseController.text.trim().isEmpty) {
                toggleElectricalHaveLicense = false;
              } else {
                toggleElectricalHaveLicense = true;
              }
            }
          } else if (formCertType == FormCertType.gas) {
            isValidP2 = true;
            validationMessage = '';
            if (gasNumberController.text.trim().isEmpty) {
              gasRegisterNumber = false;
            } else {
              gasRegisterNumber = true;
            }
          } else if (formCertType == FormCertType.electricalAndGas) {
            if (selectedElectricBoard.isEmpty) {
              isValidP2 = false;
              validationMessage =
                  'Please select your board for the electrical certificates';
            } else {
              isValidP2 = true;
              validationMessage = '';
              if (gasNumberController.text.trim().isEmpty) {
                gasRegisterNumber = false;
              } else {
                gasRegisterNumber = true;
              }
              if (electricalLicenseController.text.trim().isEmpty) {
                toggleElectricalHaveLicense = false;
              } else {
                toggleElectricalHaveLicense = true;
              }
            }
          }
        }
        break;
      case CurrentPage.page3:
        {
          if (registeredCompanyController.text.trim().isEmpty) {
            isValidP3 = false;
          } else {
            isValidP3 = true;
          }
        }
        break;
      case CurrentPage.page4:
        {
          if (addressController.text.trim().isEmpty &&
              !(isManualAddressEntry)) {
            isValidP4 = false;
            validationMessage = 'Please enters your company address';
            flushBarMessage();
          } else if (isManualAddressEntry) {
            final bool isSuccess = entryCityController.text.isNotEmpty &&
                entryPostcodeController.text.isNotEmpty &&
                entryCountryController.text.isNotEmpty &&
                entryStateController.text.isNotEmpty &&
                entryStreetController.text.isNotEmpty;

            if (addressController.text.trim().isEmpty) {
              if (entryStreetController.text.isNotEmpty &&
                  entryPostcodeController.text.isNotEmpty) {
                addressController.text =
                    '${entryStreetController.text}, ${entryStateController.text}, ${entryPostcodeController.text}';
              }
            }

            /*   showBottomSheetMessage(
              isSuccess: isSuccess,
            ); */

            isValidP4 = isSuccess;
          } else {
            isValidP4 = true;
            validationMessage = '';
          }
        }
        break;
    }

    update();
  }

  void onNext() {
    inputsValidation();
    switch (currentPage) {
      case CurrentPage.page1:
        {
          if (isValidP1) {
            currentPage = CurrentPage.page2;
          } else {
            flushBarMessage();
          }
        }

        break;
      case CurrentPage.page2:
        {
          if (isValidP2) {
            currentPage = CurrentPage.page3;
          } else {
            flushBarMessage();
          }
        }
        break;
      case CurrentPage.page3:
        if (isValidP3!) {
          currentPage = CurrentPage.page4;
        }

        break;

      case CurrentPage.page4:
        {
          if (isValidP4) {
            //
            onCompleteProfile();
          }
        }
        break;
    }

    update();
  }

  void onBack() {
    switch (currentPage) {
      case CurrentPage.page1:
        setupStatus = SetupStatus.start;
        break;
      case CurrentPage.page2:
        currentPage = CurrentPage.page1;
        break;
      case CurrentPage.page3:
        currentPage = CurrentPage.page2;
        break;
      case CurrentPage.page4:
        currentPage = CurrentPage.page3;
        break;
    }

    update();
  }

  void setPageValue(dynamic value) {
    currentPage = value;
  }

  List<Map<String, dynamic>> selectedFormGroup = <Map<String, dynamic>>[];
  List<int> selectFormGroupId = <int>[];

  void onSelectFormGroup(Map<String, dynamic> item) {
    if (selectedFormGroup
        .where((Map<String, dynamic> element) => element[keyId] == item[keyId])
        .isNotEmpty) {
      selectedFormGroup.remove(item);
    } else {
      selectedFormGroup.add(item);
    }

    if (selectedFormGroup.length == 2) {
      formCertType = FormCertType.electricalAndGas;
      page2Title = 'For Both Electric and Gas';
    } else if (selectedFormGroup.length == 1) {
      formCertType = selectedFormGroup.first[keyType];
      if (selectedFormGroup.first[keyType] == FormCertType.electrical) {
        formCertType = FormCertType.electrical;
        page2Title = 'For Electrical Certificates';
      } else {
        formCertType = FormCertType.gas;
        page2Title = 'For Gas Certificates';
      }
    }

    selectFormGroupId = <int>[];
    for (Map<String, dynamic> prop in selectedFormGroup) {
      selectFormGroupId.add(prop[keyId]);
    }
    consoleLog(selectFormGroupId, key: 'selectFormGroupId');

    update();
  }

  // electricBoardId
  void onSelectElectricBoard(Map<String, dynamic> item) {
    final String itemId = item[keyId].toString();

    if (selectedElectricBoard.isEmpty ||
        selectedElectricBoard[0][keyId] != itemId) {
      selectedElectricBoard.clear();
      selectedElectricBoard.add(item);

      electricBoardId = <int>[int.parse(itemId)];
    } else {
      selectedElectricBoard.clear();
      electricBoardId.clear();
    }

    consoleLog(electricBoardId, key: 'electricBoardId');

    update();
  }

  //* Searching for Address with Autocomplete *//
  DateTime? lastDateTime;
  void onSearchingAddress(String value) {
    if (value == '') {
      listAddress = <dynamic>[];
    } else {
      lastDateTime = DateTime.now();
      Future<dynamic>.delayed(
        const Duration(milliseconds: 1500),
        () {
          if (DateTime.now().difference(lastDateTime!) >=
                  const Duration(milliseconds: 1500) &&
              value == searchAddressController.text) {
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
      //!------------
      consoleLogPretty(addressDetails, key: 'addressDetails');
      setUserAddressData(
        addressName: data['result']['formatted_address'] ?? '',
        cityName: addressDetails!['locality'] ?? '',
        stateName: addressDetails!['administrative_area_level_1'] ?? '',
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
    required String stateName,
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
    stateController.text = stateName;

    if (streetName.isNotEmpty && streetNum.isNotEmpty) {
      streetController.text = '$streetNum $streetName';
    } else if (streetName.isNotEmpty && streetNum.isEmpty) {
      streetController.text = '  $streetName';
    } else if (streetName.isEmpty && streetNum.isNotEmpty) {
      streetController.text = '$streetNum, ';
    }

    searchForCountryId();

    if (Get.isBottomSheetOpen!) {
      Get.back();
    }
    showAddressFiled = true;

    // final bool isSuccess = addressController.text.isNotEmpty &&
    //     cityController.text.isNotEmpty &&
    //     postcodeController.text.isNotEmpty &&
    //     countryController.text.isNotEmpty &&
    //     stateController.text.isNotEmpty &&
    //     streetController.text.isNotEmpty;

    // showBottomSheetMessage(
    //   isSuccess: isSuccess,
    // );

    update();
  }

  Future<void> onCompleteProfile() async {
    final Map<String, dynamic> bodyJson = <String, dynamic>{
      'categories_id': selectFormGroupId,
      'electric_board_id': electricBoardId,
      'gas_register_number': gasNumberController.text.trim(),
      'license_number': electricalLicenseController.text.trim(),
      'company_name': registeredCompanyController.text.trim(),
      'trading_name': tradingNameController.text.trim(),
      'registration_number': registrationNumberController.text.trim(),
      'has_vat': vATNumberController.text.trim().isEmpty ? 'no' : 'yes',
      'vat_number': vATNumberController.text.trim(),
      //
      'registered_address': isManualAddressEntry
          ? entryAddressController.text.trim()
          : addressController.text.trim(),

      'postal_code': isManualAddressEntry
          ? entryPostcodeController.text.trim()
          : postcodeController.text.trim(),

      'number_street_name': isManualAddressEntry
          ? entryStreetController.text.trim()
          : streetController.text.trim(),

      'city': isManualAddressEntry
          ? entryCityController.text.trim()
          : cityController.text.trim(),

      'country_id': '218',

      'state': isManualAddressEntry
          ? entryStateController.text.trim()
          : stateController.text.trim(),
    };
    ApiRequest(
      method: ApiMethods.post,
      path: keyCompleteProfile,
      className: 'CompleteProfileController/onCompleteProfile',
      requestFunction: onCompleteProfile,
      withLoading: true,
      body: compLogoFile == null
          ? bodyJson
          : await addFormDataToJson(
              jsonObject: bodyJson,
              fileKey: 'logo',
              file: compLogoFile,
            ),
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        final dynamic tempUserData = myAppController.userData;
        tempUserData['isProfileComplete'] = true;
        myAppController.onUserUpdated(tempUserData);
        //
        setupStatus = SetupStatus.end;
        update();
      },
    );
  }

  void pressDone() {
    myAppController = Get.put(MyAppController());
    homeBottomBarController = Get.put(HomeBottomBarController());
    profileController = Get.put(ProfileController());
    homeController = Get.put(HomeController());
    certificatesController = Get.put(CertificatesController());
    //
    Get.offAllNamed(routeHomeBottomBar);
  }

  // Future<void> getCountries() async {
  //   hideKeyboard();
  //   if (allCountries.isEmpty) {
  //     ApiRequest(
  //       path: keyGetCountries,
  //       className: 'CompleteProfileController/getCountries',
  //       requestFunction: getCountries,
  //     ).request(
  //       onSuccess: (dynamic data, dynamic response) {
  //         allCountries = data;

  //         update();
  //       },
  //     );
  //   }
  // }

  Future<dynamic> pickerImage(ImageSource source) async {
    hideKeyboard();
    await ImagePicker()
        .pickImage(
      source: source,
      imageQuality: 30,
    )
        .then(
      (XFile? value) {
        compLogoFile = value;
        update();
        Get.back();
        return null;
      },
    );
    update();
  }

  Future<void> flushBarMessage() async {
    if (Get.isSnackbarOpen) {
      Get.back();
    } else {
      showMessage(
        description: validationMessage,
        textColor: AppColors.redBold,
        fontSize: fontTitle,
        backgroundColor: Colors.grey.withOpacity(0.3),
      );
    }
  }

  // void showBottomSheetMessage({bool isSuccess = true}) {
  //   Get.bottomSheet(
  //     BottomSheetContainer(
  //       responsiveContent: true,
  //       child: SingleChildScrollView(
  //         child: Center(
  //           child: Column(
  //             children: <Widget>[
  //               0.03.boxHeight,
  //               Icon(
  //                 isSuccess ? Icons.task_alt : Icons.cancel_outlined,
  //                 color: isSuccess ? Colors.green : Colors.red[800],
  //                 size: 0.1.flexAll,
  //               ),
  //               CommonText(
  //                 isSuccess
  //                     ? 'Address Successfully Added'
  //                     : 'The Address Could Not Be Verified',
  //                 marginTop: 0.02,
  //               ),
  //               0.04.boxHeight,
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
