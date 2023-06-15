import '../../general_exports.dart';

class CreateCustomerV2Controller extends GetxController {
  int index = 0;
  bool enableButton = true;
  CustomerType? customerType;
  bool showIndividualInputs = false;

  ContactType? selectedContactType;

  SearchWithWoozController searchWithWoozController1 =
      SearchWithWoozController();

  SearchWithWoozController searchWithWoozController2 =
      SearchWithWoozController();

  void onSelectType(CustomerType type) {
    // no pressing on the same type
    if (type != customerType) {
      showIndividualInputs = false;
      update();
    }
    customerType = type;
    update();
  }

  void onEndExpanded() {
    showIndividualInputs = true;
    update();
  }

  List<Widget> get stepsWidgets => <Widget>[
        const ChooseCustomerType(),
        const CreateCustomerIndividualStep1(),
        const CreateCustomerIndividualStep2(),
      ];

  //*------------------individual Customer---------------------*//
  TextEditingController iFName = TextEditingController();
  TextEditingController iLName = TextEditingController();

  void onChangeIInputs(String? value) {
    if (iFName.text.trim().isNotEmpty && iLName.text.trim().isNotEmpty) {
      enableButton = true;
      update();
    } else {
      enableButton = false;
      update();
    }
  }

  void onPressNext() {
    if (index == 2) {
      consoleLog('this is last step');
    } else {
      index = index + 1;
      update();
    }
  }

  void onPressBack() {
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
}
