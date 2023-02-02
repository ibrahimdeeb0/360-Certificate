import '../../general_exports.dart';

class CreateCustomerController extends GetxController {
  int currentIndex = 0;

  bool isSelectBilling = true;
  bool isSendStatements = false;
  bool radioSiteAddress = false;
  bool radioSiteContact = false;

  List<String> customerType = <String>[
    'Commercial',
    'Individual',
  ];
  List<String> clientType = <String>[
    'Owner',
    'Finance Team',
    'Contract Manager',
    'Site Manager',
  ];
  List<String> contactType = <String>[
    'Owner',
    'Tenant',
    'Service Manager',
    'Other',
  ];

  void onPressNext() {
    if (currentIndex == 3) {
      showMessage(
        description: 'This Last Screen',
      );
    } else {
      currentIndex = currentIndex + 1;
      update();
      consoleLog(currentIndex);
    }
  }

  void onBackNext() {
    if (currentIndex == 0) {
      Get.back();
    } else {
      currentIndex = currentIndex - 1;
      update();
      consoleLog(currentIndex);
    }
  }

  String titleName() {
    if (currentIndex == 1) {
      return 'Customer Contacts';
    } else if (currentIndex == 2) {
      return 'Site Address';
    } else if (currentIndex == 3) {
      return 'Site Contacts';
    } else {
      return 'Customer Details';
    }
  }
}
