import '../../../general_exports.dart';

class EditSiteController extends GetxController {
  TextEditingController siteName = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  void onUpdateSite() {
    hideKeyboard();
    startLoading();
    ApiRequest(
      shouldShowMessage: false,
      method: ApiMethods.put,
      path: '/site-contact/${Get.arguments[keyId]}/update',
      className: 'RegisterController/onCreateNote',
      requestFunction: onUpdateSite,
      // withLoading: true,
      body: <String, dynamic>{
        'site_name': siteName.text.trim(),
        'first_name': fName.text.trim(),
        'last_name': lName.text.trim(),
        'type': Get.arguments['site_data'][0]['site_contact']['type'],
        'phone': phone.text.trim(),
        'email': email.text.trim(),
      },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        if (Get.isRegistered<CustomerProfileController>()) {
          Get.find<CustomerProfileController>().onGeCustomerDetails();
        }
        Get.back();
        // update();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    consoleLogPretty(Get.arguments);
    siteName.text = Get.arguments['site_data'][0]['name'];
    fName.text = Get.arguments['site_data'][0]['site_contact']['f_name'];
    lName.text = Get.arguments['site_data'][0]['site_contact']['l_name'];
    phone.text = Get.arguments['site_data'][0]['site_contact']['phone'];
    email.text = Get.arguments['site_data'][0]['site_contact']['email'];
    update();
  }
}
