import '../../../../../general_exports.dart';

class ObservationDetails extends StatelessWidget {
  const ObservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final EICRListsForm formList = EICRListsForm();
    return GetBuilder<ObservationDetailsController>(
      init: ObservationDetailsController(),
      builder: (ObservationDetailsController controller) {
        return Scaffold(
          appBar: Header(
            title: 'Observation Details',
            actionItem: ActionItem(
              type: ActionType.save,
              onPress: () {
                Get.back();
              },
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            backgroundColor: Colors.grey[100],
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                  CustomInputDescription(
                    title: 'EICR Observation Details',
                    maxLines: 8,
                    value:
                        controller.observationData[formKeyObservationDetails],
                    onChanged: (dynamic value) =>
                        controller.onChangeObservationsData(
                            formKeyObservationDetails, value),
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  SmallInputField(
                    title: 'Observation Code',
                    value: controller.observationData[formKeyObservationCode],
                    onTap: () => Get.bottomSheet(
                      ObservationSelectBT(
                        listTitles: formList.observationCode,
                        keyOfValue: formKeyObservationCode,
                        controller: controller,
                      ),
                    ),
                    isInputSelection: true,
                  ),
                  CommonContainer(
                    onPress: () => formsDialog(
                      title: 'THE VAULT',
                      description:
                          'Subscribed users get access to THE VAULT. Nearly 500 hundred scenarios and pre-defined observations are included with BS7671 reference and suggested EICR code. \n\nIt is designed to assist and to be a reference tool for Electrical Inspectors undertaking Electrical Installation Condition Reports with iCertifi. \n\nTHE VAULT is not exhaustive, it is designed to help the inspector form their own opinion of an installation and code it appropriately, making an accurate assessment of the installation. It is NOT a substitute for detailed knowledge.',
                    ),
                    style: const CommonContainerModel(
                      height: 0.07,
                      width: 0.5,
                    ),
                    child: Image.asset(
                      imageFormObserv,
                    ),
                  ),
                  const CommonContainer(
                    width: 1,
                    borderWidth: 1,
                    borderColor: Colors.black12,
                    marginBottom: 0.03,
                    marginTop: 0.02,
                  ),
                  //* Add Image
                  CommonText(
                    'Add Image (Optional)',
                    onPress: controller.chooseImageSourceBottomSheet,
                    style: appTextStyles.h3StyleBlack().copyWith(
                          rowMainAxisSize: MainAxisSize.max,
                          textAlign: TextAlign.start,
                          columnMainAxisAlignment: MainAxisAlignment.center,
                          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                    rightChild: Icon(
                      Icons.camera_alt_outlined,
                      color: Color(AppColors.primary),
                    ),
                    containerStyle: CommonContainerModel(
                      width: 1,
                      height: 0.06,
                      paddingHorizontal: 0.04,
                      paddingVertical: 0.01,
                      marginTop: 0.02,
                      backgroundColor: Color(AppColors.grey).withOpacity(0.2),
                      borderRadius: 0.02,
                      touchEffect: TouchableEffect(
                        type: TouchTypes.opacity,
                        duration: 50,
                      ),
                    ),
                  ),
                  if (controller.selectImage != null)
                    AttachContainer(
                      imagePath: controller.selectImage!.path,
                      onRemoveImage: controller.deleteImage,
                      isAddedImage: controller.selectImage != null,
                    ),
                  // ImagesRowViews(
                  //   imagePath: controller.selectImage!.path,
                  //   onPressDelete: controller.deleteImage,
                  // ),

                  //* C1 C2 C3
                  const CommonContainer(
                    style: CommonContainerModel(
                      width: 1,
                      borderWidth: 1,
                      borderColor: Colors.black12,
                      marginBottom: 0.03,
                      marginTop: 0.02,
                    ),
                  ),
                  ...formList.observationDetails.map(
                    (dynamic element) => ObservationComponents(
                      title: element['title'],
                      description: element['description'],
                    ),
                  ),
                  const CommonContainer(
                    width: 1,
                    borderWidth: 1,
                    borderColor: Colors.black12,
                    marginBottom: 0.03,
                    marginTop: 0.02,
                  ),
                  const CommonText(
                    'Observations should be based on the current edition of BS7671 at time of inspection, not a previous edition at time of construction',
                    fontWeight: FontWeight.bold,
                    marginBottom: 0.03,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ObservationComponents extends StatelessWidget {
  const ObservationComponents({
    Key? key,
    this.title,
    this.description,
  }) : super(key: key);

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonText(
          title ?? '',
          fontColor: AppColors.red,
          fontWeight: FontWeight.bold,
          fontSize: fontH2,
          containerStyle: const CommonContainerModel(marginRight: 0.03),
        ),
        CommonText(
          description ?? '',
          fontColor: Colors.black54,
          rowMainAxisSize: MainAxisSize.max,
          textAlign: TextAlign.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          containerStyle: const CommonContainerModel(
            marginBottom: 0.03,
            width: 0.8,
          ),
          bottomChild: const SizedBox(),
        ),
      ],
    );
  }
}
