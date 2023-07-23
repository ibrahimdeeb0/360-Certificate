import '../../general_exports.dart';

class HomeController extends GetxController {
  List<dynamic> formsData = <dynamic>[];
  Map<String, dynamic> trialDetails = <String, dynamic>{};
  // Map<String, dynamic> plansDetails = <String, dynamic>{};

  dynamic certCountData;
  int countCompleteCert = 0;
  int countUnCompleteCert = 0;

  bool showFreeAlert = false;

  @override
  void onReady() {
    super.onReady();
    getAllUserData();
    // getPlansDetails();
    // getCertCount();
  }

  Future<void> getFormsData() async {
    ApiRequest(
      path: keyForms,
      className: 'HomeController/getFormsData',
      requestFunction: getFormsData,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        formsData = data;
        myAppController.localStorage.saveToStorage(
          key: 'formsData',
          value: data,
        );
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      formsData = await myAppController.localStorage.getFromStorage(
        key: 'formsData',
      );
      update();
      dismissLoading();
    }
  }

  void getTrialDetails() {
    ApiRequest(
      path: '/getTrialDetails',
      className: 'HomeController/getTrialDetails',
      requestFunction: getTrialDetails,
      // formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        trialDetails = data;

        update();
      },
    );
  }

  // SubscriptionModel? subscriptionModel;
  // void getPlansDetails() {
  //   ApiRequest(
  //     path: '/show-interval-plans',
  //     className: 'HomeController/getPlansDetails',
  //     requestFunction: getPlansDetails,
  //     // formatResponse: true,
  //   ).request(
  //     onSuccess: (dynamic data, dynamic response) {
  //       consoleLogPretty(data, key: 'show_interval_plans');
  //       subscriptionModel = SubscriptionModel.fromJson(data);
  //       plansDetails = data;
  //       // consoleLog(subscriptionModel, key: 'response_data');
  //       update();
  //     },
  //   );
  // }

  // void getPlansData() {
  //   ApiRequest(
  //     path: '/show-plans',
  //     className: 'HomeController/getPlansData',
  //     requestFunction: getPlansData,
  //     formatResponse: true,
  //   ).request(
  //     onSuccess: (dynamic data, dynamic response) {
  //       // consoleLogPretty(data, key: 'show_plans');
  //       // subscriptionModel = SubscriptionModel.fromJson(data);
  //       // plansDetails = data;
  //       // consoleLog(subscriptionModel, key: 'response_data');
  //       update();
  //     },
  //   );
  // }

  Future<void> getCertCount() async {
    ApiRequest(
      path: formGetCerCount,
      className: 'HomeController/getCertCount',
      requestFunction: getCertCount,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        certCountData = data;
        countCompleteCert = data['count_complete_cert'];
        countUnCompleteCert = data['count_uncompleted_cert'];
        myAppController.localStorage.saveToStorage(
          key: 'certCountData',
          value: data,
        );
        update();
      },
    );
    if (!myAppController.isInternetConnect) {
      certCountData = await myAppController.localStorage.getFromStorage(
        key: 'certCountData',
      );
      countCompleteCert = certCountData['count_complete_cert'];
      countCompleteCert = certCountData['count_uncompleted_cert'];
      update();
      dismissLoading();
    }
  }

  //*----------------------------------------------------*//
  Map<String, dynamic> allUserData = <String, dynamic>{};
  String plan = '';
  bool isHaveElectrical = false;
  bool isHaveGas = false;
  dynamic gasNumber;
  dynamic electricNumber;
  bool isUserSubscribe = false;
  bool isRequiredNumber = false;
  Future<void> getAllUserData() async {
    hideKeyboard();
    startLoading();
    ApiRequest(
      path: keyUserData,
      className: 'HomeController/getAllUserData',
      requestFunction: getAllUserData,
      // withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        /* myAppController.localStorage.saveToStorage(
          key: 'getAllUserData',
          value: data,
        ); */

        dismissLoading();
        // userDataProfile = data['user'];
        allUserData = data;

        getTrialDetails();

        isUserSubscribe = allUserData['subscription_status'].isNotEmpty;

        // allUserData['subscription_status'].length == 1 &&
        showFreeAlert = allUserData['subscription_status'].contains('trialing');

        if (allUserData['subscription_status'].contains('trialing')) {
          plan = 'Free Plan';
          moreController.update();
        } else if (allUserData['subscription_status'].contains('active')) {
          plan = '${allUserData['user']['subscriptions'][0]['name']} Plan';
          moreController.update();
        } else {
          plan = 'Not Subscription';
          moreController.update();
        }

        checkCertsNumbers();

        update();

        if ((isHaveElectrical && electricNumber == null) &&
            (isHaveGas && gasNumber == null)) {
          //! user select Electrical and Gas not enter number for both
          isRequiredNumber = true;
          Get.bottomSheet(
            ShowNumberMassageSheet(
              text1:
                  "It looks like you haven't provided your board information yet. To create electrical certificates, we need your electrical board selection and your license number.",
              text2:
                  'To create gas certificates, we need your Gas Safe Register number. \n This information is crucial to maintain the validity and compliance of your certificates. You can update this information in your account settings. If you need help finding your license numbers or have any other questions, please refer to our help section or contact our support team.',
              btnText: 'Go To Enter Your Number',
              onPress: () {
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
                Get.toNamed(
                  routeUpdateCertNumber,
                  arguments: <String, dynamic>{
                    'is_gas': false,
                    'is_both': true,
                  },
                );
              },
            ),
            isScrollControlled: true,
            enableDrag: false,
            isDismissible: false,
          );
        } else if (isHaveElectrical && electricNumber == null) {
          //! user select Electrical and not enter number
          isRequiredNumber = true;
          Get.bottomSheet(
            ShowNumberMassageSheet(
              text1:
                  "It looks like you haven't provided your board information yet. To create electrical certificates, we need your electrical board selection and your license number.",
              text2:
                  'This information is crucial to maintain the validity and compliance of your certificates. You can update this information in your account settings. If you need help finding your license numbers or have any other questions, please refer to our help section or contact our support team.',
              btnText: 'Go To Enter License Number',
              onPress: () {
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
                Get.toNamed(
                  routeUpdateCertNumber,
                  arguments: <String, dynamic>{
                    'is_gas': false,
                  },
                );
              },
            ),
            isScrollControlled: true,
            enableDrag: false,
            isDismissible: false,
          );
        } else if (isHaveGas && gasNumber == null) {
          //! user select Gas and not enter number
          isRequiredNumber = true;
          Get.bottomSheet(
            ShowNumberMassageSheet(
              text1:
                  "It looks like you haven't provided your board information yet. To create gas certificates, we need your Gas Safe Register number.",
              text2:
                  'This information is crucial to maintain the validity and compliance of your certificates. You can update this information in your account settings. If you need help finding your license numbers or have any other questions, please refer to our help section or contact our support team.',
              btnText: 'Go To Enter Gas Safe Register Number',
              onPress: () {
                if (Get.isBottomSheetOpen!) {
                  Get.back();
                }
                Get.toNamed(
                  routeUpdateCertNumber,
                  arguments: <String, dynamic>{
                    'is_gas': true,
                  },
                );
              },
            ),
            isScrollControlled: true,
            enableDrag: false,
            isDismissible: false,
          );
        } else {
          isRequiredNumber = false;
          // numbers was entered
          // if user not have any plan
          if (isUserSubscribe) {
            getCertCount();
            certificatesController.getAllCert();
          } else {
            Get.bottomSheet(
              ShowNumberMassageSheet(
                title: 'Upgrade You Plan',
                text1:
                    'Unlock additional features with an upgrade to your plan in the app. Enhance your engineering skills and contribute to the success of your technical tasks',
                btnText: 'Upgrade Now',
                onPress: () {
                  if (Get.isBottomSheetOpen!) {
                    Get.back();
                  }
                  Get.toNamed(
                    routeSubscription,
                  );
                },
              ),
              isScrollControlled: true,
              enableDrag: false,
              isDismissible: false,
            );
          }
        }
        profileController.getUserProfileData();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
    /*  if (!myAppController.isInternetConnect) {
      final dynamic apiData = await myAppController.localStorage.getFromStorage(
        key: 'getAllUserData',
      );
      allUserData = apiData;

      getTrialDetails();

      showFreeAlert = allUserData['subscription_status'].length == 1 &&
          allUserData['subscription_status'].contains('trialing');

      update();

      if (allUserData['subscription_status'].length == 1 &&
          allUserData['subscription_status'].contains('trialing')) {
        plan = 'Free Plan';
        moreController.update();
      } else if (allUserData['subscription_status'].contains('active')) {
        plan = '${allUserData['user']['subscriptions'][0]['name']} Plan';
        moreController.update();
      } else {
        plan = 'Not Subscription';
        moreController.update();
      }

      

      checkCertsNumbers();
     

      update();
    } */
  }

  void checkCertsNumbers() {
    isHaveElectrical = allUserData['user']['categories']
        .where((dynamic item) => item['id'] == 1)
        .isNotEmpty;

    isHaveGas = allUserData['user']['categories']
        .where((dynamic item) => item['id'] == 2)
        .isNotEmpty;

    if (isHaveGas) {
      gasNumber = allUserData['user']['categories']
          .where((dynamic item) => item['id'] == 2)
          .first['pivot']['gas_register_number'];
    }

    if (isHaveElectrical) {
      electricNumber = allUserData['user']['categories']
          .where((dynamic item) => item['id'] == 1)
          .first['pivot']['license_number'];
    }

    consoleLogPretty(isHaveGas, key: 'isHaveGas');
    consoleLogPretty(gasNumber, key: 'gasNumber');
    consoleLogPretty(isHaveElectrical, key: 'isHaveElectrical');
    consoleLogPretty(electricNumber, key: 'electricNumber');
  }
}
