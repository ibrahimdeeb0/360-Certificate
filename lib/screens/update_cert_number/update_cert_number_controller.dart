import '../../general_exports.dart';

class UpdateCertNumberController extends GetxController {
  TextEditingController gasNumController = TextEditingController();
  TextEditingController electricalNumController = TextEditingController();

  bool isGas = false;
  bool? isBoth;

  void onUpdateCertNumber() {
    hideKeyboard();
    startLoading();
    ApiRequest(
      method: ApiMethods.post,
      path: '/complete-infos',
      className: 'UpdateCertNumberController/onUpdateCertNumber',
      requestFunction: onUpdateCertNumber,
      // withLoading: true,
      body: isGas && isBoth == null
          ? <String, dynamic>{
              'gas_register_number': gasNumController.text.trim(),
            }
          : !isGas && isBoth == null
              ? <String, dynamic>{
                  'license_number': electricalNumController.text.trim(),
                }
              : <String, dynamic>{
                  'license_number': electricalNumController.text.trim(),
                  'gas_register_number': gasNumController.text.trim(),
                },
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        homeController.getAllUserData().then((void value) {
          dismissLoading();
        });
        Get.back();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    isGas = Get.arguments['is_gas'];
    isBoth = Get.arguments['is_both'];
    update();
    consoleLog(isBoth, key: 'isBoth');
  }
}
