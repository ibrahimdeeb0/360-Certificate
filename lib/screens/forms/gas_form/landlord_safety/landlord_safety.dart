import '../../../../general_exports.dart';

class LandlordSafety extends StatelessWidget {
  const LandlordSafety({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandlordSafetyController>(
      init: LandlordSafetyController(),
      builder: (LandlordSafetyController controller) {
        return Scaffold(
          appBar: FormHeader(
            withBack: false,
            title: 'Landlord/Homeowner Gas Safety Record',
            circleNumbering: '1/3',
            onPressSave: () {},
          ),
          body: CommonContainer(
            width: 1,
            height: 1,
            backgroundColor: AppColors.greyLightBorder,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const <Widget>[
                        LandlordPage2(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
