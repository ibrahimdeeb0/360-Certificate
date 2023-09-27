import '../../../general_exports.dart';

class UpdateLicenseNumbersController extends GetxController {
  TextEditingController gasNumController = TextEditingController();
  TextEditingController electricalNumController = TextEditingController();
  bool isboardFrom = false;

  final CompleteProfileController completeProfilecontroller =
      CompleteProfileController();

  List<Map<String, dynamic>> selectedElectricBoard = <Map<String, dynamic>>[];
  List<int> electricBoardId = <int>[];

  List<Map<String, dynamic>> listElectricBoard = <Map<String, dynamic>>[
    <String, dynamic>{
      keyId: 1,
      keyName: 'ELECSA',
    },
    <String, dynamic>{
      keyId: 2,
      keyName: 'STROMA',
    },
    <String, dynamic>{
      keyId: 3,
      keyName: 'IET (Institution of Engineering and Technology)',
    },
    <String, dynamic>{
      keyId: 4,
      keyName: 'JIB (Joint Industry Board)',
    },
    <String, dynamic>{
      keyId: 5,
      keyName: 'SELECT (Scotland)',
    },
    <String, dynamic>{
      keyId: 6,
      keyName: 'NAPIT',
    },
    <String, dynamic>{
      keyId: 7,
      keyName: 'NICEIC',
    },
  ];

  // electricBoardId
  void onSelectElectricBoard(Map<String, dynamic> item) {
    final String itemId = item[keyId].toString();

    if (selectedElectricBoard.isEmpty ||
        selectedElectricBoard[0][keyId] != itemId) {
      selectedElectricBoard.clear();
      selectedElectricBoard.add(item);

      electricBoardId = <int>[int.parse(itemId)];
    } else {
      selectedElectricBoard.clear();
      electricBoardId.clear();
    }

    consoleLog(electricBoardId, key: 'electricBoardId');

    update();
  }

  @override
  void onReady() {
    getBoardFrom();
    update();
    super.onReady();
  }

  @override
  void onInit() {
    gasNumController.text = homeController.gasNumber ?? '';
    electricalNumController.text = homeController.electricNumber ?? '';
    update();
    super.onInit();
  }

  int? boardFrom;

  Map<String, dynamic>? selectedBoard;
  void getBoardFrom() {
    hideKeyboard();
    startLoading();

    ApiRequest(
      className: 'UpdateCertNumberController/boardFrom',
      path: '/getLicenseDetails',
      requestFunction: getBoardFrom,
      withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        // final dynamic jsonData = jsonDecode(data);
        // boardFrom = jsonData[0][0];
        boardFrom = data;
        selectedBoard = listElectricBoard
            .where((Map<String, dynamic> element) => element['id'] == boardFrom)
            .first;

        consoleLog(boardFrom, key: 'board_value_id');
        update();
      },
    );
  }

  void onUpdateboardFrom() {
    hideKeyboard();
    ApiRequest(
      className: 'UpdateCertNumberController/onUpdateboardFrom',
      method: ApiMethods.post,
      path: '/update-electricboard/${electricBoardId[0]}',
      requestFunction: onUpdateboardFrom,
      withLoading: true,
      formatResponse: true,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        Get.back();
      },
      onError: (dynamic error) {
        dismissLoading();
      },
    );
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
