import '../../general_exports.dart';

class CreateCustomerV2Controller extends GetxController {
  int index = 0;
  bool enableButton = true;
  CustomerType? customerType;

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
  bool isSiteAddSameInfo = true;
  bool isAnotherSiteInfo = false;
  CustomerContactType? customerContactType;
  CompanyContactType? companyContactType;
  SitePropertyType? sitePropertyType;
  SiteContactType? siteContactType;
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
  List<SiteContactType> listSitePropertyType = <SiteContactType>[
    SiteContactType.landlord,
    SiteContactType.director,
    SiteContactType.agent,
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
                  if (companyNameController.text.trim().isNotEmpty) {
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
                if (customerIfoAddress.listAddressData.isNotEmpty) {
                  final bool tempValid =
                      customerInfoPhoneController.text.trim().isNotEmpty &&
                          customerInfoEmailController.text.trim().isNotEmpty &&
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
                    customerInfoNameController.text.trim().isNotEmpty &&
                        customerInfoPhoneController.text.trim().isNotEmpty &&
                        customerInfoEmailController.text.trim().isNotEmpty &&
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
                  siteDetailsEmailController.text.trim().isNotEmpty &&
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
          update();
          consoleLog(customerContactType, key: 'customerContactType');
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
          update();
          // consoleLog(companyContactType, key: 'customerContactType');
        },
        initialValue: companyContactType,
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

  void toggleSameSiteDetails({bool? value}) {
    isAnotherSiteInfo = value!;
    if (isAnotherSiteInfo) {
      siteDetailsNameController.clear();
      siteDetailsPhoneController.clear();
      siteDetailsEmailController.clear();
      siteContactType = null;
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

    // Flushbar<dynamic>(
    //   message: errorMessage,
    //   icon: Icon(
    //     Icons.info_outline,
    //     size: 30.0,
    //     color: Colors.orange[900],
    //   ),
    //   duration: const Duration(seconds: 3),
    //   // leftBarIndicatorColor: Colors.red[700],
    //   messageSize: fontTitle,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   flushbarStyle: FlushbarStyle.GROUNDED,
    // ).show(Get.context!);
  }

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
        }
        break;
      case 1:
        {
          if (isValidP1) {
            index = index + 1;
            if (index == 2) {
              toggleSameSiteDetails(value: isAnotherSiteInfo);
            }
          } else {
            flushbarMessage();
          }
        }
        break;

      case 2:
        {
          if (isValidP2) {
            // consoleLog('this is last step');
            // consoleLog(siteContactType!.name);
            onAddCustomer();
            // consoleLog(companyIfoAddress.listAddressData);
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
      'client_f_name':customerInfoNameController.text.trim(),
      'client_phone': customerInfoPhoneController.text.trim(),
      'client_email': customerInfoEmailController.text.trim(),
      'client_type': customerContactType!.name,
      'copy_site_address': isSiteAddSameInfo ? 'yes' : 'no',
      'site_name': siteNameController.text.trim(),
      if (!isSiteAddSameInfo) ...siteAddress,
      'property_type': sitePropertyType!.name,
      'copy_contact': !isAnotherSiteInfo ? 'yes' : 'no',
      'site_contact_type': siteContactType!.name,
      'site_contact_f_name': siteDetailsNameController.text.trim(),
      'site_contact_l_name': '',
      'site_contact_phone': siteDetailsPhoneController.text.trim(),
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
      body: bodyData,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        // myAppController.certFormInfo[keyCustomerId] = addedCustomerData[keyId];

        // Get
        //   ..back()
        //   ..back()
        //   ..toNamed(
        //     myAppController.certFormInfo[keyFormRoute],
        //     arguments: <String, dynamic>{
        //       formKeyFromCertificate: false,
        //     },
        //   );
      },
    );
    update();
  }
}
