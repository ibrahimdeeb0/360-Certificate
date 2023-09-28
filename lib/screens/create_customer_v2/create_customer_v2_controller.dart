import '../../general_exports.dart';

class CreateCustomerV2Controller extends GetxController {
  int index = 0;
  bool enableButton = true;
  CustomerType? customerType;

  ScrollController scrollController = ScrollController();

  SearchWithWoozController customerIfoAddress = SearchWithWoozController();
  SearchWithWoozController customerSiteAddress = SearchWithWoozController();
  SearchWithWoozController companyIfoAddress = SearchWithWoozController();

  TextEditingController siteNameController = TextEditingController();
  TextEditingController propertyTypeOtherController = TextEditingController();

  TextEditingController customerInfoNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController customerInfoPhoneController = TextEditingController();
  TextEditingController customerInfoEmailController = TextEditingController();
  TextEditingController siteDetailsNameController = TextEditingController();
  TextEditingController siteDetailsPhoneController = TextEditingController();
  TextEditingController siteDetailsEmailController = TextEditingController();
  bool isSiteAddSameInfo = false;
  bool isAnotherSiteInfo = false;
  //
  CustomerContactType? customerContactType;
  CompanyContactType? companyContactType;
  SitePropertyType? sitePropertyType;
  SiteContactType? siteContactType;
  String? customerContactTypeValue;
  String? companyContactTypeValue;
  String? sitePropertyTypeValue;
  String? siteContactTypeValue;
  //
  void onWriteSiteName(String? value) {
    customerSiteAddress.siteNameController.text = value ?? '';
  }

  bool isShowLess = false;
  void toggleShowLess() {
    isShowLess = !isShowLess;
    update();
  }

  List<CustomerContactType> listCustomerContactType =
      const <CustomerContactType>[
    CustomerContactType.landlord,
    CustomerContactType.agent,
  ];
  List<CompanyContactType> listCompanyContactType = const <CompanyContactType>[
    CompanyContactType.director,
    CompanyContactType.agent,
    CompanyContactType.siteManager,
  ];
  List<SitePropertyType> listPropertyType = <SitePropertyType>[
    SitePropertyType.flat,
    SitePropertyType.studio,
    SitePropertyType.house,
    SitePropertyType.office,
    SitePropertyType.warehouse,
    SitePropertyType.other,
  ];
  List<SiteContactType> listSiteContactType = <SiteContactType>[
    SiteContactType.agent,
    SiteContactType.tenant,
    SiteContactType.landlord,
    SiteContactType.director,
    SiteContactType.siteManager,
    SiteContactType.financeManager,
  ];

  bool showIndividualInputs = false;
  bool showCompanyInputs = false;

  void onSelectType(CustomerType type) {
    // no pressing on the same type
    if (type != customerType) {
      showIndividualInputs = false;
      showCompanyInputs = false;
      update();
    }
    customerType = type;
    update();
  }

  void onEndExpanded() {
    if (customerType == CustomerType.individual) {
      showIndividualInputs = true;
    } else {
      showCompanyInputs = true;
    }

    update();
  }

  List<Widget> get stepsWidgets => <Widget>[
        const ChooseCustomerType(),
        if (customerType == CustomerType.individual)
          const CreateCustomerIndividualStep1()
        else
          const CreateCustomerCompanyStep1(),
        const CreateCustomerIndividualStep2(),
      ];

  // *--------Copy Postcode to Site Name-----------------*//
  void copyPostCode() {
    if (customerType == CustomerType.individual) {
      siteNameController.text =
          customerIfoAddress.listAddressData.first.postcode ?? '';
    } else if (customerType == CustomerType.company) {
      siteNameController.text =
          companyIfoAddress.listAddressData.first.postcode ?? '';
    }
    update();
  }

  // *-----------------------------------*//
  bool isValidP0 = false;
  bool isValidP1 = false;
  bool isValidP2 = false;

  String errorMessage = 'please Fill All Data';

  void validationFillData() {
    switch (index) {
      case 0:
        {
          if (customerType != null) {
            switch (customerType) {
              case CustomerType.individual:
                if (customerInfoNameController.text.trim().isNotEmpty) {
                  isValidP0 = true;
                } else {
                  errorMessage = 'Please Enter Customer Name';
                  isValidP0 = false;
                }
                break;

              case CustomerType.company:
                {
                  if (customerInfoNameController.text.trim().isNotEmpty) {
                    if (companyIfoAddress.listAddressData.isNotEmpty) {
                      isValidP0 = true;
                    } else {
                      errorMessage = 'Please Specify The Address';
                      isValidP0 = false;
                    }
                  } else {
                    errorMessage = 'Please Enter Company Name';
                    isValidP0 = false;
                  }
                }
                break;

              default:
            }
          } else {
            errorMessage = 'Please Select Customer Type';
            isValidP0 = false;
          }
        }
        break;

      case 1:
        {
          switch (customerType) {
            case CustomerType.individual:
              {
                //!------------------------
                if (customerIfoAddress.listAddressData.isNotEmpty) {
                  final bool tempValid = customerInfoPhoneController.text
                          .trim()
                          .isNotEmpty &&
                      // customerInfoEmailController.text.trim().isNotEmpty &&
                      customerContactType != null;
                  if (tempValid) {
                    isValidP1 = true;
                  } else {
                    errorMessage = 'Please Fill All Data';
                    isValidP1 = false;
                  }
                } else {
                  errorMessage =
                      'Please Specify The Inspection Property Address';
                  isValidP1 = false;
                }
              }
              break;

            case CustomerType.company:
              {
                final bool tempValid =
                    customerInfoPhoneController.text.trim().isNotEmpty &&
                        // customerInfoEmailController.text.trim().isNotEmpty &&
                        companyContactType != null;
                if (tempValid) {
                  isValidP1 = true;
                } else {
                  errorMessage = 'Please Fill All Data';
                  isValidP1 = false;
                }
              }
              break;

            default:
          }
        }
        break;
      case 2:
        {
          final bool tempValid =
              siteDetailsNameController.text.trim().isNotEmpty &&
                  siteDetailsPhoneController.text.trim().isNotEmpty &&
                  // siteDetailsEmailController.text.trim().isNotEmpty &&
                  siteContactType != null;

          if (siteNameController.text.trim().isNotEmpty) {
            // if Site Address --Not Same as Customer/Company Address
            if (!isSiteAddSameInfo) {
              if (customerSiteAddress.listAddressData.isNotEmpty) {
                if (sitePropertyType != null) {
                  if (sitePropertyType == SitePropertyType.other) {
                    if (propertyTypeOtherController.text.trim().isNotEmpty) {
                      if (tempValid) {
                        isValidP2 = true;
                      } else {
                        errorMessage = 'Please Fill All Data';
                        isValidP2 = false;
                      }
                    } else {
                      errorMessage = 'Please Type Property  Type';
                      isValidP2 = false;
                    }
                  } else {
                    if (tempValid) {
                      isValidP2 = true;
                    } else {
                      errorMessage = 'Please Fill All Data';
                      isValidP2 = false;
                    }
                  }
                } else {
                  errorMessage = 'Please Specify Property Type';
                  isValidP2 = false;
                }
              } else {
                errorMessage = 'Please Specify The Inspection Property Address';
                isValidP2 = false;
              }
            } else {
              if (sitePropertyType != null) {
                if (sitePropertyType == SitePropertyType.other) {
                  if (propertyTypeOtherController.text.trim().isNotEmpty) {
                    if (tempValid) {
                      isValidP2 = true;
                    } else {
                      errorMessage = 'Please Fill All Data';
                      isValidP2 = false;
                    }
                  } else {
                    errorMessage = 'Please Type Property  Type]';
                    isValidP2 = false;
                  }
                } else {
                  if (tempValid) {
                    isValidP2 = true;
                  } else {
                    errorMessage = 'Please Fill All Data';
                    isValidP2 = false;
                  }
                }
              } else {
                errorMessage = 'Please Specify Property Type';
                isValidP2 = false;
              }
            }
          } else {
            errorMessage = 'Please Type The Site Name';
            isValidP2 = false;
          }
        }
        break;

      default:
    }
  }

  void selectCustomerContactType() {
    Get.bottomSheet(
      RadioSelectionSheet(
        items: listCustomerContactType,
        onSelectItem: (dynamic value) {
          customerContactType = value;
          customerContactTypeValue =
              (value as Enum).name.contains(capitalLetterPattern)
                  ? addSpaceBeforeCapitalLetter((value).name).capitalize
                  : (value).name.capitalize;
          update();
          consoleLog(customerContactTypeValue, key: 'customerContactType');
        },
        initialValue: customerContactType,
      ),
    );
  }

  void selectCompanyContactType() {
    Get.bottomSheet(
      RadioSelectionSheet(
        items: listCompanyContactType,
        onSelectItem: (dynamic value) {
          companyContactType = value;
          companyContactTypeValue =
              (value as Enum).name.contains(capitalLetterPattern)
                  ? addSpaceBeforeCapitalLetter((value).name).capitalize
                  : (value).name.capitalize;
          update();
          consoleLog(companyContactTypeValue, key: 'customerContactType');
        },
        initialValue: companyContactType,
      ),
    );
  }

  void selectSiteContactType() {
    Get.bottomSheet(
      RadioSelectionSheet(
        items: listSiteContactType,
        onSelectItem: (dynamic value) {
          siteContactType = value;
          siteContactTypeValue =
              (value as Enum).name.contains(capitalLetterPattern)
                  ? addSpaceBeforeCapitalLetter((value).name).capitalize
                  : (value).name.capitalize;
          update();
          consoleLog(siteContactTypeValue, key: 'siteContactType');
        },
        initialValue: siteContactType,
      ),
      isScrollControlled: true,
    );
  }

  void selectCustomerPropertyType() {
    Get.bottomSheet(
      RadioSelectionSheet(
        items: listPropertyType,
        onSelectItem: (dynamic value) {
          sitePropertyType = value;
          sitePropertyTypeValue =
              (value as Enum).name.contains(capitalLetterPattern)
                  ? addSpaceBeforeCapitalLetter((value).name).capitalize
                  : (value).name.capitalize;
          update();
          consoleLog(sitePropertyTypeValue, key: 'siteContactType');
        },
        initialValue: sitePropertyType,
      ),
    );
  }

  void toggleSameSitePostcode({bool value = false}) {
    isSiteAddSameInfo = value;
    update();
    consoleLog(isSiteAddSameInfo, key: 'isSiteAddSameInfo');
  }

  void toggleSameSiteDetails({bool? value}) {
    isAnotherSiteInfo = value!;
    // if true == yes
    if (isAnotherSiteInfo) {
      siteDetailsNameController.clear();
      siteDetailsPhoneController.clear();
      siteDetailsEmailController.clear();
      siteContactType = SiteContactType.tenant;
      siteContactTypeValue = SiteContactType.tenant.name;
    } else {
      siteDetailsNameController.text = customerInfoNameController.text;
      siteDetailsPhoneController.text = customerInfoPhoneController.text;
      siteDetailsEmailController.text = customerInfoEmailController.text;

      if (customerType == CustomerType.individual) {
        switch (customerContactType) {
          case CustomerContactType.landlord:
            siteContactType = SiteContactType.landlord;
            break;
          case CustomerContactType.agent:
            siteContactType = SiteContactType.agent;
            break;

          default:
            siteContactType = null;
        }
      } else {
        switch (companyContactType) {
          case CompanyContactType.director:
            siteContactType = SiteContactType.landlord;
            break;
          case CompanyContactType.agent:
            siteContactType = SiteContactType.agent;
            break;
          case CompanyContactType.siteManager:
            siteContactType = SiteContactType.siteManager;
            break;

          default:
            siteContactType = null;
        }
      }

      siteContactTypeValue =
          (siteContactType as Enum).name.contains(capitalLetterPattern)
              ? addSpaceBeforeCapitalLetter((siteContactType as Enum).name)
                  .capitalize
              : (siteContactType as Enum).name.capitalize;

      consoleLog(siteContactTypeValue, key: 'siteContactTypeValue');
    }
    update();
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

  void onScrollUp() {
    if (scrollController.positions.isNotEmpty) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  FocusNode email1FocusNode = FocusNode();
  FocusNode email2FocusNode = FocusNode();
  void onPressNext() {
    hideKeyboard();

    validationFillData();

    switch (index) {
      case 0:
        {
          if (isValidP0) {
            index = index + 1;
          } else {
            flushbarMessage();
          }

          onScrollUp();
        }
        break;
      case 1:
        {
          if (isValidP1) {
            if (customerInfoEmailController.text.trim().isEmpty) {
              //
              Get.bottomSheet(
                ShowEmailMessageSheet(
                  pressNo: () {
                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }
                    FocusScope.of(Get.context!).requestFocus(email1FocusNode);
                  },
                  pressYes: () {
                    index = index + 1;
                    consoleLog('test', key: 'test');
                    if (index == 2) {
                      if (customerType == CustomerType.individual) {
                        toggleSameSitePostcode(value: true);
                      } else {
                        toggleSameSitePostcode();
                      }
                      toggleSameSiteDetails(value: isAnotherSiteInfo);
                      copyPostCode();
                    }
                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }
                    update();

                    onScrollUp();
                  },
                ),
              );
            } else {
              if (RegExp(validationEmail)
                  .hasMatch(customerInfoEmailController.text.trim())) {
                index = index + 1;
                if (index == 2) {
                  if (customerType == CustomerType.individual) {
                    toggleSameSitePostcode(value: true);
                  } else {
                    toggleSameSitePostcode();
                  }
                  toggleSameSiteDetails(value: isAnotherSiteInfo);
                  copyPostCode();
                }

                onScrollUp();
              } else {
                showMessage(
                    description: 'Please Enter a valid email',
                    textColor: COMMON_RED_COLOR);

                FocusScope.of(Get.context!).requestFocus(email1FocusNode);
              }
            }
          } else {
            flushbarMessage();
          }
        }
        break;

      case 2:
        {
          if (isValidP2) {
            if (siteDetailsEmailController.text.trim().isEmpty) {
              //
              Get.bottomSheet(
                ShowEmailMessageSheet(
                  pressNo: () {
                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }
                    FocusScope.of(Get.context!).requestFocus(email2FocusNode);
                  },
                  pressYes: () {
                    if (Get.isBottomSheetOpen!) {
                      Get.back();
                    }
                    onAddCustomer();
                  },
                ),
              );
            } else {
              if (RegExp(validationEmail)
                  .hasMatch(siteDetailsEmailController.text.trim())) {
                onAddCustomer();
              } else {
                showMessage(
                    description: 'Please Enter a valid email',
                    textColor: COMMON_RED_COLOR);

                FocusScope.of(Get.context!).requestFocus(email2FocusNode);
              }
            }
          } else {
            flushbarMessage();
          }
        }
        break;

      // default:
    }

    update();
  }

  void onPressBack() {
    hideKeyboard();
    if (index == 0) {
      consoleLog('close screen');
      Get.bottomSheet(
        CancelAddCustomerSheet(
          onPressFirstBtn: () {
            hideKeyboard();
            Get
              ..back()
              ..back();
          },
        ),
        isScrollControlled: true,
      );
    } else {
      index = index - 1;
      update();
    }

    if (scrollController.positions.isNotEmpty) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  //?============= Add customers API ==============*/

  Future<void> onAddCustomer() async {
    hideKeyboard();
    // startLoading();

    final Map<String, dynamic> individualAddress = <String, dynamic>{
      'address': customerIfoAddress.listAddressData.isNotEmpty
          ? customerIfoAddress.listAddressData.first.address
          : '',
      'street_num': customerIfoAddress.listAddressData.isNotEmpty
          ? customerIfoAddress.listAddressData.first.street
          : '',
      'city': customerIfoAddress.listAddressData.isNotEmpty
          ? customerIfoAddress.listAddressData.first.city
          : '',
      'state': customerIfoAddress.listAddressData.isNotEmpty
          ? customerIfoAddress.listAddressData.first.state
          : '',
      'postal_code': customerIfoAddress.listAddressData.isNotEmpty
          ? customerIfoAddress.listAddressData.first.postcode
          : '',
      'country_id': customerIfoAddress.listAddressData.isNotEmpty
          ? customerIfoAddress.listAddressData.first.countryId
          : '',
    };

    final Map<String, dynamic> companyAddress = <String, dynamic>{
      'address': companyIfoAddress.listAddressData.isNotEmpty
          ? companyIfoAddress.listAddressData.first.address
          : '',
      'street_num': companyIfoAddress.listAddressData.isNotEmpty
          ? companyIfoAddress.listAddressData.first.street
          : '',
      'city': companyIfoAddress.listAddressData.isNotEmpty
          ? companyIfoAddress.listAddressData.first.city
          : '',
      'state': companyIfoAddress.listAddressData.isNotEmpty
          ? companyIfoAddress.listAddressData.first.state
          : '',
      'postal_code': companyIfoAddress.listAddressData.isNotEmpty
          ? companyIfoAddress.listAddressData.first.postcode
          : '',
      'country_id': companyIfoAddress.listAddressData.isNotEmpty
          ? companyIfoAddress.listAddressData.first.countryId
          : '',
    };

    final Map<String, dynamic> siteAddress = <String, dynamic>{
      'site_address': customerSiteAddress.listAddressData.isNotEmpty
          ? customerSiteAddress.listAddressData.first.address
          : '',
      'site_street_num': customerSiteAddress.listAddressData.isNotEmpty
          ? customerSiteAddress.listAddressData.first.street
          : '',
      'site_city': customerSiteAddress.listAddressData.isNotEmpty
          ? customerSiteAddress.listAddressData.first.city
          : '',
      'site_state': customerSiteAddress.listAddressData.isNotEmpty
          ? customerSiteAddress.listAddressData.first.state
          : '',
      'site_postal_code': customerSiteAddress.listAddressData.isNotEmpty
          ? customerSiteAddress.listAddressData.first.postcode
          : '',
      'site_country_id': customerSiteAddress.listAddressData.isNotEmpty
          ? customerSiteAddress.listAddressData.first.countryId
          : '',
    };

    final Map<String, dynamic> bodyData = <String, dynamic>{
      'type_id': customerType == CustomerType.individual ? '1' : '2',
      'name': customerInfoNameController.text.trim(),
      'last_name': 'test',
      'first_name': customerInfoNameController.text.trim(),
      if (customerType == CustomerType.individual) ...individualAddress,
      if (customerType == CustomerType.company) ...companyAddress,
      'client_l_name': 'test',
      'client_f_name': customerInfoNameController.text.trim(),
      'client_phone': '+44${customerInfoPhoneController.text.trim()}',
      'client_email': customerInfoEmailController.text.trim(),
      //companyContactType
      'client_type': customerType == CustomerType.individual
          ? customerContactType!.name
          : companyContactType!.name,
      'copy_site_address': isSiteAddSameInfo ? 'yes' : 'no',
      'site_name': siteNameController.text.trim(),
      if (!isSiteAddSameInfo) ...siteAddress,
      'property_type': sitePropertyType!.name,
      // true ?
      'copy_contact': isAnotherSiteInfo ? 'no' : 'yes',
      'site_contact_type': siteContactType!.name,
      'site_contact_f_name': siteDetailsNameController.text.trim(),
      // 'site_contact_l_name': '',
      'site_contact_phone': '+44${siteDetailsPhoneController.text.trim()}',
      'site_contact_email': siteDetailsEmailController.text.trim(),
      //
      'other_value': propertyTypeOtherController.text.trim(),
      // 'site_other_value' : '',
    };

    consoleLogPretty(bodyData);
    ApiRequest(
      method: ApiMethods.post,
      path: createCustomer,
      className: 'NewJobController/onAddCustomer',
      requestFunction: onAddCustomer,
      withLoading: true,
      formatResponse: true,
      body: bodyData,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        myAppController.certFormInfo[keyCustomerId] = data[keyId];
        myAppController.certFormInfo[keySiteId] = data['sites'][0][keyId];

        consoleLog(myAppController.certFormInfo);

        //* first back for close create customer screen
        //* second  back for close search screen
        //* fist back for close select form screen

        Get
          ..back()
          ..back()
          ..back()
          ..toNamed(
            myAppController.certFormInfo[keyFormRoute],
            arguments: <String, dynamic>{
              formKeyFromCertificate: false,
            },
          );
      },
    );
    update();
  }

  @override
  void onClose() {
    email1FocusNode.dispose();
    email2FocusNode.dispose();
    super.onClose();
  }
}
