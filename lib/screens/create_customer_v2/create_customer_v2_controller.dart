import '../../general_exports.dart';

class CreateCustomerV2Controller extends GetxController {
  CustomerType? customerType;
  void onSelectType(CustomerType type) {
    customerType = type;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    consoleLog(customerType, key: 'customerType');
  }
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
