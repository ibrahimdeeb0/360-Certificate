import '../../../../../general_exports.dart';

class MinorWorksPage1 extends StatelessWidget {
  const MinorWorksPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinorWorksController>(
      init: MinorWorksController(),
      builder: (MinorWorksController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'Part 1 Derails of The Minor Works, Supply Characteristics & Earthing Arrangements',
              fontColor: AppColors.primary,
              fontSize: fontH2,
              marginBottom: 0.02,
              // marginHorizontal: 0.04,
              // marginTop: 0.08,
            ),
            const CommonInput(
              topLabelText: 'Description of Minor Works:',
              maxLines: 4,
            ),
            const CommonInput(
              topLabelText: 'Date completed:',
              hint: 'Select Date',
              suffix: Icon(Icons.calendar_today_outlined),
              marginBottom: 0.02,
            ),
            const FormToggleButton(
              title: 'System type and earthing arrangements:',
              titleSize: fontTitle,
            ),
            const CommonInput(
              topLabel: CommonText(
                'Zs at Distribution Board / Consumer Unit supplying the final circuit:',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Presence of adequate main protective conductors:',
              fontColor: AppColors.primary,
              textAlign: TextAlign.start,
              marginBottom: 0.01,
              marginTop: 0.015,
            ),
            const FormToggleButton(
              title: 'Earthing conductor',
              titleSize: fontTitle,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 3,
            ),
            CommonText(
              'Protective bonding conductor(s) to:',
              fontColor: AppColors.primary,
              marginBottom: 0.01,
              marginTop: 0.02,
            ),
            SizedBox(
              child: Column(
                children: const <Widget>[
                  FormToggleButton(
                    title: 'Water',
                    titleSize: fontTitle,
                  ),
                  FormToggleButton(
                    title: 'Gas',
                    titleSize: fontTitle,
                  ),
                  FormToggleButton(
                    title: 'Oil',
                    titleSize: fontTitle,
                  ),
                  SmallInputField(
                    title: 'Other (state)',
                    hint: 'N/A',
                  ),
                ],
              ),
            ),
            const CommonInput(
              topLabel: CommonText(
                'Comments on existing installation (see Reg. 644.1.2):',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              marginBottom: 0.02,
            ),
            const SmallInputField(
              title: 'Page No:',
              hint: 'N/A',
              marginBottom: 0.01,
            ),
            const FormToggleButton(
              title:
                  'Details of any departures from BS 7671: 2018, as amended to',
              titleSize: fontTitle,
            ),
            const CommonInput(
              topLabel: CommonText(
                '(date) for the circuit altered or extended (Regulation 120.3, 133.1.3 & 133.5):',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              marginBottom: 0.02,
            ),
            const CommonInput(
              topLabel: CommonText(
                'Details of permitted exceptions (Regulation 411.3.3):',
                textAlign: TextAlign.start,
                marginBottom: 0.01,
              ),
              maxLines: 4,
              marginBottom: 0.02,
            ),
            const FormToggleButton(
              title: 'Risk assessment attached:',
              titleSize: fontTitle,
            ),
          ],
        );
      },
    );
  }
}
