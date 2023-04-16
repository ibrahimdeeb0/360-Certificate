import '../../../../../general_exports.dart';

class DomesticEicPage1 extends StatelessWidget {
  const DomesticEicPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 1. ',
                    text: 'DETAILS OF THE INSTALLATION',
                    marginBottom: 0.02,
                  ),
                  const CommonInput(
                    topLabel: CommonText(
                      'Extends of the installation work covered by this certificate',
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                    ),
                    topLabelText: '',
                    maxLines: 6,
                    // textInputAction: TextInputAction.newline,
                    hint: 'Select or Typing',
                    // value: controller.gazSafetyData[formKeyReasonProducingA],
                    // onChanged: (dynamic value) => controller
                    //     .onChangeFormDataValue(formKeyReasonProducingA, value),
                    suffix: SuffixInputIcon(
                      // onPress: () => Get.bottomSheet(
                      //   isScrollControlled: true,
                      //   EICRSelectBT(
                      //     controller: controller,
                      //     keyOfValue: formKeyReasonProducingA,
                      //     listTitles: formList.listReasonsSuggestions,
                      //   ),
                      //   elevation: 0.0,
                      // ),
                      iconWidget: Icon(
                        Icons.filter_list,
                      ),
                    ),
                    marginBottom: 0.02,
                  ),
                  const CommonText(
                    'The installation is: ',
                    fontWeight: FontWeight.bold,
                    marginBottom: 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.02.flexWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        FormToggleButton(
                          title: 'New',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                        ),
                        FormToggleButton(
                          title: 'Addition',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                        ),
                        FormToggleButton(
                          title: 'Alternation',
                          toggleType: FormToggleType.trueFalse,
                          textWidth: 0.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 2. ',
                    text: 'DESIGN, CONSTRUCTION, INSPECTION AND TESTING',
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    topLabel: CommonText(
                      'I being the person responsible for the design, construction, inspection and testing of the electrical installation (as indicated by my signature/s below, particulars of which are described above, having exercised reasonable skill and care when carrying out the design, construction, inspection and testing hereby Certify that the design, construction, inspection and testing work for which l/we have been responsible is, to the best of m knowledge and belief, in accordance with BS 7671: amended to',
                      fontSize: fontH3,
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                    ),
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    topLabel: CommonText(
                      'Except for the departures, if any, detailed as follows. Details of departures from BS 7671, as amended (Regulations 120.3 & 133.5)',
                      fontSize: fontH3,
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                    ),
                    hint: 'N/A',
                    marginBottom: 0.02,
                  ),
                  CommonText(
                    'The extent of liability of the signatory is limited to the work described above as the subject of this certificate',
                    fontSize: fontH4,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
