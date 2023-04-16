import '../../../../../general_exports.dart';

class DomesticEicPage2 extends StatelessWidget {
  const DomesticEicPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DomesticEicController>(
      init: DomesticEicController(),
      builder: (DomesticEicController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              // marginTop: 0.0,
              child: Column(
                children: const <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 3. ',
                    text: 'NEXT INSPECTION',
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    topLabel: CommonText(
                      'I RECOMMEND that this installation is further inspected and tested after an interval of not more than',
                      fontSize: fontH3,
                      rowMainAxisSize: MainAxisSize.max,
                      textAlign: TextAlign.start,
                      marginBottom: 0.01,
                    ),
                    hint: 'N/A',
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: const <Widget>[
                  CustomTextFormTitle(
                    leftText: 'Part 4. ',
                    text: 'COMMENTS ON EXISTING INSTALLATION',
                    marginBottom: 0.01,
                  ),
                  CommonInput(
                    hint: 'N/A',
                    topLabelText: 'Additional information and report notes',
                    maxLines: 6,
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.formSectionsStyle,
              marginTop: 0.0,
              child: Column(
                children: <Widget>[
                  const CustomTextFormTitle(
                    leftText: 'Part 5. ',
                    text: 'SCHEDULE OF ADDITIONAL RECORDS',
                    marginBottom: 0.01,
                  ),
                  const CommonInput(
                    hint: 'N/A',
                    maxLines: 6,
                    marginBottom: 0.02,
                  ),
                  const FormToggleButton(
                    title: 'Risk assessment attached?',
                    titleSize: fontTitle,
                    toggleType: FormToggleType.trueFalse,
                  ),
                  CommonText(
                    'Risk Assessment',
                    leftChild: Icon(
                      Icons.fmd_bad,
                      color: Colors.yellow[900],
                    ),
                    containerStyle: CommonContainerModel(
                      width: 1,
                      backgroundColor: Colors.yellow[700],
                      paddingVertical: 0.007,
                      alignment: AlignmentDirectional.center,
                      borderRadius: 0.01,
                    ),
                  ),
                  const CommonInput(
                    hint: 'N/A',
                    maxLines: 8,
                    marginBottom: 0.015,
                  ),
                  CommonButton(
                    onPress: () {},
                    text: 'Editable Sample RCD Omission Risk Assessment',
                    fontSize: fontBody,
                    height: 0.04,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
