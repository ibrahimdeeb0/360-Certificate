import '../../../../../general_exports.dart';

class LandlordPage1 extends StatelessWidget {
  const LandlordPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextFormTitle(
                leftText: 'Part 1. ',
                text: 'Details of Landlord/Homeowner'.capitalize,
              ),
              const CommonText(
                'or agent where appropriate',
                fontSize: fontH3,
                marginLeft: 0.12,
              ),
              //
              const CommonInput(
                topLabelText: 'Name',
                hint: 'Type Name',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabelText: 'Address 1',
                hint: 'Type Address 1',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabelText: 'Address 2',
                hint: 'Type Address 2',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabelText: 'Postcode',
                hint: 'Type Address 1',
                marginBottom: 0.012,
              ),
            ],
          ),
        ),
        //
        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          marginTop: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextFormTitle(
                leftText: 'Part 2. ',
                text: 'Details of the installation'.capitalize,
              ),
              const CommonInput(
                topLabelText: 'Address 1',
                hint: 'Type Address 1',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabelText: 'Address 2',
                hint: 'Type Address 2',
                marginBottom: 0.012,
              ),
              const CommonInput(
                topLabelText: 'Postcode',
                hint: 'Type Address 1',
                marginBottom: 0.012,
              ),
            ],
          ),
        ),

        CommonContainer(
          style: appContainerStyles.formSectionsStyle,
          marginTop: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextFormTitle(
                leftText: 'Part 3. ',
                text: 'Details of work carried out'.capitalize,
                marginBottom: 0.02,
              ),
              const CommonInput(
                hint: '',
                maxLines: 4,
                marginBottom: 0.012,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
