import '../../general_exports.dart';

class CreateCustomerController extends GetxController {
  bool isSelectBilling = false;
  bool isSendStatements = false;

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
}
