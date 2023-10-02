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

  SearchWithWoozController mapController = SearchWithWoozController();

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

  @override
  void onInit() {
    super.onInit();

    fName = myAppController.userData['user']['first_name'];
    lName = myAppController.userData['user']['last_name'];
    email = myAppController.userData['user']['email'];
  }

  void toggleVat() {
    isVatRegistered = !isVatRegistered;
    update();
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
          if (mapController.listAddressData.isEmpty) {
            isValidP4 = false;
            validationMessage = 'Please enters your company address';
            flushBarMessage();
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

  Future<void> onCompleteProfile() async {
    final Map<String, dynamic> bodyJson = <String, dynamic>{
      'categories_id': selectFormGroupId,
      'electric_board_id': electricBoardId.first,
      'gas_register_number': gasNumberController.text.trim(),
      'license_number': electricalLicenseController.text.trim(),
      'company_name': registeredCompanyController.text.trim(),
      'trading_name': tradingNameController.text.trim(),
      'registration_number': registrationNumberController.text.trim(),
      'has_vat': vATNumberController.text.trim().isEmpty ? 'no' : 'yes',
      'vat_number': vATNumberController.text.trim(),
      //
      'registered_address': mapController.listAddressData.first.address,

      'postal_code': mapController.listAddressData.first.postcode,

      'number_street_name': mapController.listAddressData.first.street,

      'city': mapController.listAddressData.first.city,

      'state': mapController.listAddressData.first.state,

      'country_id': '218',
    };
    // consoleLog(bodyJson);
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
}
