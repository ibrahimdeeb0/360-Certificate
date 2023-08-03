import '../../../general_exports.dart';

class AddNewSiteController extends GetxController {
  SearchWithWoozController addressControllerMap = SearchWithWoozController();

  TextEditingController siteNameController = TextEditingController();

  TextEditingController siteDetailsNameController = TextEditingController();
  TextEditingController siteDetailsPhoneController = TextEditingController();
  TextEditingController siteDetailsEmailController = TextEditingController();

  SiteContactType siteContactType = SiteContactType.talent;
  SitePropertyType? sitePropertyType;
  TextEditingController propertyTypeOtherController = TextEditingController();
  List<SitePropertyType> listPropertyType = <SitePropertyType>[
    SitePropertyType.flat,
    SitePropertyType.studio,
    SitePropertyType.house,
    SitePropertyType.office,
    SitePropertyType.warehouse,
    SitePropertyType.other,
  ];

  List<SiteContactType> listSitePropertyType = <SiteContactType>[
    SiteContactType.agent,
    SiteContactType.talent,
    SiteContactType.landlord,
    SiteContactType.director,
    SiteContactType.siteManager,
    SiteContactType.financeManager,
  ];

  int? customerId;

  @override
  void onInit() {
    customerId = Get.arguments[keyId];
    consoleLog(customerId, key: 'customerId');
    super.onInit();
  }

  bool isAnotherSiteInfo = false;
  void toggleSameSiteDetails({bool? value}) {
    isAnotherSiteInfo = value!;
    update();
  }

  void selectCustomerPropertyType() {
    Get.bottomSheet(
      RadioSelectionSheet(
        items: listPropertyType,
        onSelectItem: (dynamic value) {
          sitePropertyType = value;
          update();
        },
        initialValue: sitePropertyType,
      ),
    );
  }

  void selectSiteContactType() {
    Get.bottomSheet(
      RadioSelectionSheet(
        items: listSitePropertyType,
        onSelectItem: (dynamic value) {
          siteContactType = value;
          update();
          consoleLog(siteContactType, key: 'siteContactType');
        },
        initialValue: siteContactType,
      ),
    );
  }

  bool isValid = false;
  String errorMessage = 'please Fill All Data';

  void validation() {
    {
      // if AnotherSite true then inputs should filled
      final bool tempValid = !(isAnotherSiteInfo) || validateFields();

      if (siteNameController.text.trim().isNotEmpty) {
        if (addressControllerMap.listAddressData.isNotEmpty) {
          if (sitePropertyType != null) {
            if (sitePropertyType == SitePropertyType.other) {
              if (propertyTypeOtherController.text.trim().isNotEmpty) {
                if (tempValid) {
                  isValid = true;
                } else {
                  errorMessage = 'Please Fill All Data';
                  isValid = false;
                }
              } else {
                errorMessage = 'Please Type Property  Type';
                isValid = false;
              }
            } else {
              if (tempValid) {
                isValid = true;
              } else {
                errorMessage = 'Please Fill All Data';
                isValid = false;
              }
            }
          } else {
            errorMessage = 'Please Specify Property Type';
            isValid = false;
          }
        } else {
          errorMessage = 'Please Specify The Inspection Property Address';
          isValid = false;
        }
      } else {
        errorMessage = 'Please Type The Site Name';
        isValid = false;
      }
    }
    update();
  }

  bool validateFields() {
    final bool nameNotEmpty = siteDetailsNameController.text.trim().isNotEmpty;
    final bool phoneNotEmpty =
        siteDetailsPhoneController.text.trim().isNotEmpty;
    // final bool emailNotEmpty =
    //     siteDetailsEmailController.text.trim().isNotEmpty;
    final bool contactTypeNotNull = siteContactType != null;

    return nameNotEmpty && phoneNotEmpty && contactTypeNotNull;
  }

  Future<void> flushbarMessage() async {
    if (Get.isSnackbarOpen) {
      Get.back();
    } else {
      showMessage(
        description: errorMessage,
        textColor: AppColors.redBold,
        fontSize: fontTitle,
        backgroundColor: Colors.grey.withOpacity(0.3),
      );
    }
  }

  void onPressAdd() {
    hideKeyboard();
    validation();

    if (isValid) {
      addNewSite();
    } else {
      flushbarMessage();
    }
    update();
  }

  void addNewSite() {
    hideKeyboard();
    ApiRequest(
      method: ApiMethods.post,
      path: createSite,
      className: 'AddNewSiteController/addNewSite',
      requestFunction: addNewSite,
      withLoading: true,
      body: <String, dynamic>{
        'customer_id': customerId,
        // 'user_id': '2',
        'name': siteNameController.text.trim(),
        'address': addressControllerMap.listAddressData.isNotEmpty
            ? addressControllerMap.listAddressData.first.address
            : '',
        'street_num': addressControllerMap.listAddressData.isNotEmpty
            ? addressControllerMap.listAddressData.first.street
            : '',
        'city': addressControllerMap.listAddressData.isNotEmpty
            ? addressControllerMap.listAddressData.first.city
            : '',
        'postal_code': addressControllerMap.listAddressData.isNotEmpty
            ? addressControllerMap.listAddressData.first.postcode
            : '',
        'country_id': addressControllerMap.listAddressData.isNotEmpty
            ? addressControllerMap.listAddressData.first.countryId
            : '',
        'state': addressControllerMap.listAddressData.isNotEmpty
            ? addressControllerMap.listAddressData.first.state
            : '',
        'copy_contact': isAnotherSiteInfo ? 'no' : 'yes',
        'type': siteContactType != null ? siteContactType.name : '',
        'f_name': siteDetailsNameController.text.trim(),
        'email': siteDetailsPhoneController.text.trim(),
        'phone': siteDetailsEmailController.text.trim(),
        'property_type': sitePropertyType!.name,
        'other_value': propertyTypeOtherController.text.trim(),
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        Get.find<SearchForCustomerController>().onSearching(
            Get.find<SearchForCustomerController>()
                .searchController
                .text
                .trim());
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
        Get.back();
      },
    );
    update();
  }
}
