import '../../../../../general_exports.dart';

class SectionObservation extends StatelessWidget {
  const SectionObservation({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ObservationDetailsController>(
      init: ObservationDetailsController(),
      builder: (ObservationDetailsController observationController) {
        return Column(
          children: <Widget>[
            if (observationController.observationsDataBase.isNotEmpty)
              CommonContainer(
                backgroundColor: Colors.white,
                width: 1,
                paddingHorizontal: 0.04,
                paddingBottom: 0.02,
                paddingTop: 0.01,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CommonText(
                      'Remedial Works Completed',
                      style: appTextStyles.h3StyleBlack(),
                      leftChild: Switch(
                        // thumb color (round icon)
                        activeColor: Color(AppColors.primary),
                        activeTrackColor:
                            Color(AppColors.primary).withOpacity(0.5),
                        inactiveThumbColor: Colors.blueGrey.shade600,
                        inactiveTrackColor: Colors.grey.shade400,
                        splashRadius: 50.0,
                        value: controller
                            .gazSafetyData['remedial_works_completed'],
                        onChanged: (bool value) {
                          controller.gazSafetyData['remedial_works_completed'] =
                              value;
                          controller.update();
                        },
                      ),
                    ),
                    CommonContainer(
                      onPress: () => formsDialog(
                        title: 'Remedial Works Complete',
                        description:
                            'By turning on this switch all your C1 & C2 observations are set to satisfactory and your EICR is turned into a completion certificate to demonstrate the work has been completed.The original EICR is not affected and theRemedial Certificate is not saved separately. It can however be generated at any time from your savedEICR',
                      ),
                      child: SvgIconHelper(
                        iconPath: iconAttention,
                        color: Color(AppColors.primary),
                        width: DEVICE_WIDTH * 0.025,
                        height: DEVICE_HEIGHT * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: DEVICE_HEIGHT * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CommonText(
                    onPress: () {
                      observationController.resetObservationData();
                      observationController.onCrateObservation();
                    },
                    'Add Observation(s)',
                    style: appTextStyles.h4StyleBlack(),
                    // containerStyle: appContainerStyles.buttonsObservationStyle,
                    containerStyle: const CommonContainerModel(
                      borderWidth: 1.5,
                      padding: 0.012,
                    ),
                  ),
                  CommonText(
                    onPress: () {
                      observationController.observationsDataBase.clear();
                      observationController.update();
                    },
                    'No Observation(s)',
                    style: appTextStyles.h4StyleBlack().copyWith(),
                    // containerStyle: appContainerStyles.buttonsObservationStyle,
                    containerStyle: const CommonContainerModel(
                      borderWidth: 1.5,
                      padding: 0.012,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: DEVICE_HEIGHT * 0.03),
            ...observationController.observationsDataBase.map(
              (dynamic item) => ObservationCard(
                onPressDelete: () =>
                    observationController.onDeleteObservation(item),
                onPressCard: () {
                  final List<Map<String, dynamic>> images =
                      Get.find<EicrController>()
                              .selectedImages
                              ?.where((Map<String, dynamic> element) =>
                                  element['id'] == item['id'])
                              .toList() ??
                          <Map<String, dynamic>>[];
                  observationController.selectImage =
                      images.isNotEmpty ? images.first['image'] : null;
                  // observationController.update();
                  observationController.selectedObservation = item;
                  observationController.setObservationValues();
                  Get.to(
                    () => const ObservationDetails(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 250),
                  );
                }, //
                title: item[formKeyObservationDetails] == ''
                    ? 'New description'
                    : item[formKeyObservationDetails],
                // title: item[formKeyObservationDetails],
                code: item[formKeyObservationCode],
                num:
                    '${observationController.observationsDataBase.indexOf(item) + 1}',
              ),
            ),
          ],
        );
      },
    );
  }
}

class ObservationCard extends StatelessWidget {
  const ObservationCard({
    Key? key,
    this.title,
    this.num,
    this.code,
    this.onPressCard,
    this.onPressDelete,
  }) : super(key: key);

  final String? title;
  final String? num;
  final String? code;
  final Function? onPressCard;
  final Function? onPressDelete;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      onPress: onPressCard?.call,
      '$num.  $title',
      rowMainAxisSize: MainAxisSize.max,
      textAlign: TextAlign.start,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      containerStyle: CommonContainerModel(
        width: 1,
        backgroundColor: Colors.white,
        paddingHorizontal: 0.04,
        paddingVertical: 0.02,
        borderBottomWidth: 2,
        borderBottomColor: Colors.grey[400],
      ),
      rightChild: CommonContainer(
        onPress: onPressDelete?.call,
        borderColor: AppColors.redBold,
        borderWidth: 1,
        boxShape: BoxShape.circle,
        touchEffect: TouchableEffect(
          type: TouchTypes.scaleAndFade,
          lowerBound: 0.8,
        ),
        child: Icon(
          Icons.close_rounded,
          color: Color(AppColors.red),
          size: ((DEVICE_HEIGHT * 0.02) + (DEVICE_WIDTH * 0.02)),
        ),
      ),
      bottomChild: CommonText(
        'Observation Code: ',
        style: appTextStyles.h4Style().copyWith(
              fontColor: AppColors.red,
              rowMainAxisSize: MainAxisSize.max,
              textAlign: TextAlign.start,
            ),
        containerStyle: const CommonContainerModel(marginTop: 0.01),
        rightChild: CommonText(
          code ?? 'C1',
          fontColor: AppColors.red,
          fontSize: fontH4,
        ),
      ),
    );
  }
}
