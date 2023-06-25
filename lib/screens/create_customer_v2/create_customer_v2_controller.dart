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
  SitePropertyType? customerPropertyType;
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
                if (customerPropertyType != null) {
                  if (customerPropertyType == SitePropertyType.other) {
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
              } else {
                errorMessage = 'Please Specify The Inspection Property Address';
                isValidP2 = false;
              }
            } else {
              if (customerPropertyType != null) {
                if (customerPropertyType == SitePropertyType.other) {
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
          customerPropertyType = value;
          update();
        },
        initialValue: customerPropertyType,
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
            consoleLog('this is last step');
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
    ApiRequest(
      method: ApiMethods.post,
      path: createCustomer,
      className: 'NewJobController/onAddCustomer',
      requestFunction: onAddCustomer,
      withLoading: true,
      body: <String, dynamic>{
        'type_id': customerType == CustomerType.individual ? '1' : '2',
        'last_name': 'doo',
        'first_name': 'amy',
        'address': 'test',
        'street_num': 'alazhar',
        'city': 'Blida',
        'state': 'wahran',
        'postal_code': '8963',
        'country_id': '7',
        'billing_details': 'yes',
        'billing_address': '',
        'billing_street_num': '',
        'billing_city': '',
        'billing_postal_code': '',
        'billing_state': '',
        'billing_country_id': '',
        'credit_limit': '',
        'payment_term_id': '1',
        'send_statement': 'no',
        'client_f_name': 'dolly',
        'client_l_name': 'dolly',
        'client_phone': '597830711',
        'client_email': 'amy3@gmail.com',
        'client_type': 'agent',
        'copy_site_address': 'yes',
        'site_name': 'site3',
        'site_address': '',
        'site_street_num': '',
        'site_city': '',
        'site_state': '',
        'site_postal_code': '',
        'site_country_id': '',
        'copy_contact': 'yes',
        'site_contact_type': 'house',
        'site_contact_f_name': '',
        'site_contact_l_name': '',
        'site_contact_phone': '',
        'site_contact_email': '',
        'country_id': '7'
      },
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
