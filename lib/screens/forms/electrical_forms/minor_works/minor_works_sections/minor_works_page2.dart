import '../../../../../general_exports.dart';

class MinorWorksPage2 extends StatelessWidget {
  const MinorWorksPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 2: Circuit  Details',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
            ),
            SizedBox(
              child: Column(
                children: const <Widget>[
                  CommonInput(
                    topLabelText: 'DB/Consumer Unit: Ref No',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Location and type',
                    marginBottom: 0.015,
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                children: const <Widget>[
                  CommonInput(
                    topLabelText: 'Circuit number',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Circuit description',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Installation reference method:',
                    marginBottom: 0.015,
                  ),
                  CommonInput(
                    topLabelText: 'Number & size of conductors:',
                    marginBottom: 0.015,
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Csa of conductors',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CommonInput(
                        topLabelText: 'Live:',
                        hint: 'mm2',
                        width: 0.45,
                        suffix: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[700],
                        ),
                      ),
                      CommonInput(
                        topLabelText: 'Cpc:',
                        hint: 'mm2',
                        width: 0.45,
                        suffix: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Overcurrent protection device',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                  ),
                  const CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
                  ),
                  CommonInput(
                    topLabelText: 'Rating',
                    hint: 'Select',
                    suffix: CommonText(
                      '(A)',
                      fontColor: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            //
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'AFDD',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                  ),
                  const CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
                  ),
                  CommonInput(
                    topLabelText: 'Rating',
                    hint: 'Select',
                    suffix: CommonText(
                      '(A)',
                      fontColor: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            //
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'SPD',
                    fontColor: AppColors.primary,
                    marginBottom: 0.01,
                    marginTop: 0.02,
                  ),
                  CommonInput(
                    topLabelText: 'BS EN',
                    hint: 'Select',
                    enabled: false,
                    suffix: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[700],
                    ),
                  ),
                  const CommonInput(
                    topLabelText: 'Type',
                    hint: 'Select',
                    // suffix: Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey[700],
                    // ),
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
