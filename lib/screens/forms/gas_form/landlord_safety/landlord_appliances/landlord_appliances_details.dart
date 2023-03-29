import '../../../../../general_exports.dart';

class LandlordAppliancesDetails extends StatelessWidget {
  const LandlordAppliancesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Appliances Details',
      ),
      body: CommonContainer(
        style: appContainerStyles.containerStyles,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              0.01.ph,
              const LandLordApplianceSection1(),
              const LandLordApplianceSection2(),
              const LandLordApplianceSection3(),
            ],
          ),
        ),
      ),
    );
  }
}
