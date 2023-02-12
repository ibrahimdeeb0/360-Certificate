import 'package:image_picker/image_picker.dart';

import '../../../../../general_exports.dart';

class ObservationDetailsController extends GetxController {
  TextEditingController otherInputController = TextEditingController();

  List<dynamic> observationsDataBase = <dynamic>[];

  Map<String, dynamic>? selectedObservation;
  XFile? selectImage;
  final ImagePicker _picker = ImagePicker();
  Map<String, dynamic> observationData = <String, dynamic>{
    formKeyObservationDetails: 'Details',
    formKeyObservationCode: 'C1',
  };

  @override
  void onInit() {
    super.onInit();
    observationsDataBase = Get.find<EicrController>().observationsDataBase;
    update();
  }

  Future<void> pickImage(dynamic source) async {
    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 30,
    );
    consoleLog(source);
    // if (!selectedImages.contains(file)) {
    selectImage = file!;
    // }
    update();
  }

  void chooseImageSourceBottomSheet() {
    Get.bottomSheet(
      BottomSheetContainer(
        height: 0.18,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: DEVICE_HEIGHT * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CommonText(
                  'Camera',
                  onPress: () {
                    pickImage(ImageSource.camera);
                    Get.back();
                  },
                  style: appTextStyles.h2StyleBlack(),
                  bottomChild: const Icon(Icons.camera_alt_outlined),
                  containerStyle: const CommonContainerModel(
                    width: 0.3,
                    height: 0.1,
                    borderWidth: 1,
                    borderRadius: 0.02,
                    alignment: AlignmentDirectional.center,
                    marginBottom: 0.01,
                  ),
                ),
                CommonText(
                  'Gallery',
                  onPress: () {
                    pickImage(ImageSource.gallery);
                    Get.back();
                  },
                  style: appTextStyles.h2StyleBlack(),
                  bottomChild: const Icon(Icons.image),
                  containerStyle: const CommonContainerModel(
                    width: 0.3,
                    height: 0.1,
                    borderWidth: 1,
                    borderRadius: 0.02,
                    alignment: AlignmentDirectional.center,
                    marginBottom: 0.01,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteImage() {
    selectImage = null;
    Get.find<EicrController>().selectedImages!.removeWhere(
          (Map<String, dynamic> element) =>
              element['id'] == selectedObservation!['id'],
        );
    Get.find<EicrController>().update();
    update();
  }

  void resetObservationData() {
    observationData = <String, dynamic>{
      formKeyObservationDetails: 'Details',
      formKeyObservationCode: 'C1',
    };
    update();
  }

  void onCrateObservation() {
    selectedObservation = null;
    observationsDataBase.add(
      <String, dynamic>{
        ...observationData,
        keyId: (observationsDataBase.length + 1),
      },
    );
    update();
    consoleLogPretty(observationsDataBase);
  }

  void setObservationValues() {
    observationData = selectedObservation!;
    update();
  }

  void onSaveObservationValues() {
    if (selectImage != null) {
      Get.find<EicrController>().onAddImage(
        <String, dynamic>{
          'id': selectedObservation!['id'],
          'image': selectImage,
        },
      );
    }
    selectedObservation = observationData;

    observationsDataBase[observationsDataBase.indexWhere((dynamic element) =>
        element[keyId] == selectedObservation?[keyId])] = selectedObservation;

    update();
    consoleLogPretty(selectedObservation, key: 'selected_Data');
    Get.back();
  }

  void onDeleteObservation(dynamic data) {
    Get.find<EicrController>().selectedImages!.removeWhere(
          (Map<String, dynamic> element) =>
              element['id'] == selectedObservation!['id'],
        );
    Get.find<EicrController>().update();
    observationsDataBase.remove(data);
    update();
    consoleLogPretty(observationsDataBase, key: 'distrBoardDataBase');
  }

  void onChangeObservationsData(String? key, dynamic value) {
    observationData[key!] = value;
  }

  @override
  void onClose() {
    Get.find<EicrController>().observationsDataBase = observationsDataBase;
    consoleLog(Get.find<EicrController>().observationsDataBase);
    consoleLog('Save Observation Data Done', key: 'Saved_Observation_Data');
    super.onClose();
  }
}
