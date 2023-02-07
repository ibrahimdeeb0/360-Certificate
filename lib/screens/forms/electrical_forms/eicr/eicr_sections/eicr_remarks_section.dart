import '../../../../../general_exports.dart';

class EICRRemarkSection extends StatelessWidget {
  const EICRRemarkSection({required this.controller, super.key});

  final EicrController controller;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: appContainerStyles.cardContainer(
        backgroundColor: Colors.white,
        marginHorizontal: 0.03,
        marginTop: 0.02,
      ),
      child: Column(
        children: <Widget>[
          CommonText(
            'Remarks',
            style: appTextStyles.h2StyleBlack().copyWith(
                  rowMainAxisSize: MainAxisSize.max,
                  textAlign: TextAlign.start,
                ),
            containerStyle: const CommonContainerModel(
              marginBottom: 0.015,
            ),
          ),
          CommonText(
            'List all other special installations or locations present, if any. Details of circuits and/or installed equipment vulnerable to damage when testing and/or remarks:',
            style: appTextStyles.h3StyleBlack().copyWith(
                  rowMainAxisSize: MainAxisSize.max,
                  textAlign: TextAlign.start,
                ),
            marginBottom: 0.02,
          ),
          CommonInput(
            maxLines: 15,
            value: controller.gazSafetyData[formKeyRemarks],
            onChanged: (dynamic value) =>
                controller.onChangeFormDataValue(formKeyRemarks, value),
            textInputAction: TextInputAction.newline,
          ),
          // CommonButton(
          //   onPress: () {
          //     consoleLog(controller.isTemplate);
          //     // consoleLog(Get.arguments);
          //   },
          // ),
        ],
      ),
    );
  }
}
