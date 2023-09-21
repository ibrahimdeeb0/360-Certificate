import '../../../general_exports.dart';

class CretificatesValidateController extends GetxController {
  final CretificatesValidateList list = CretificatesValidateList();

  List<Map<String, dynamic>> get forms => <Map<String, dynamic>>[
        <String, dynamic>{
          keyId: 9,
          keyTitle: 'Landlord/Homeowner Gas Safety Record',
          keyOnPress: () {
            formsDialog(
                title: 'warning',
                description: 'The gas certificate is valid for only one year.');
          },
          keyType: FormCertType.gas,
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 11,
          keyTitle: 'Warning Notice',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 31,
          keyTitle: 'Breakdown Service',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 15,
          keyTitle: 'Maintenance Service',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.gas,
          keyId: 13,
          keyTitle: 'Gas Test & Purge',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 1,
          keyTitle: 'Portable Appliance Testing (PAT)',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 3,
          keyTitle: 'Domestic Electrical Installation Certificate',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 4,
          keyTitle: 'Electrical Danger Notice',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 5,
          keyTitle: 'EICR',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: list.eicr,
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 2,
          keyTitle: 'Minor Works',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
        <String, dynamic>{
          keyType: FormCertType.electrical,
          keyId: 32,
          keyTitle: 'Electrical Isolation',
          keyOnPress: () {
            Get.bottomSheet(
              CretificatesValidateBTSheet(
                listTitles: const <String>[],
                controller: MinorWorksController(),
                keyOfValue: formKeyOvercurrentBSEN,
                keyOfBSType: formKeyOvercurrentType,
              ),
              isScrollControlled: true,
            );
          },
        },
      ];

  List<Map<String, dynamic>> filtterForm = <Map<String, dynamic>>[];
  TextEditingController seachController = TextEditingController();
  void onSearch(String searchValue) {
    filtterForm = forms
        .where((dynamic item) =>
            item[keyTitle].toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    consoleLog(filtterForm);

    update();
  }

  @override
  void onReady() {
    filtterForm = forms;
    update();
    super.onReady();
  }
}
