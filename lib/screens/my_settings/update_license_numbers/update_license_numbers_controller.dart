import '../../../general_exports.dart';

class UpdateLicenseNumbersController extends GetxController {
  TextEditingController gasNumController = TextEditingController();
  TextEditingController electricalNumController = TextEditingController();

  @override
  void onInit() {
    gasNumController.text = homeController.gasNumber ?? '';
    electricalNumController.text = homeController.electricNumber ?? '';
    update();
    super.onInit();
  }

  void onUpdateCertNumber() {
    hideKeyboard();
    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/complete-infos',
      className: 'UpdateCertNumberController/onUpdateCertNumber',
      requestFunction: onUpdateCertNumber,
      // withLoading: true,
      body: homeController.isHaveElectrical && homeController.isHaveElectrical
          ? <String, dynamic>{
              'license_number': electricalNumController.text.trim(),
              'gas_register_number': gasNumController.text.trim(),
            }
          : homeController.isHaveElectrical
              ? <String, dynamic>{
                  'license_number': electricalNumController.text.trim(),
                }
              : <String, dynamic>{
                  'gas_register_number': gasNumController.text.trim(),
                },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        homeController.getAllUserData().then(
          (void value) {
            dismissLoading();
          },
        );
        Get.back();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
  }
}
