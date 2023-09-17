import '../../../../../general_exports.dart';

class LandlordAppliancesDetails extends StatelessWidget {
  const LandlordAppliancesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: 'Appliances Details',
      ),
      body: CommonContainer(
        style: appContainerStyles.containerStyles,
        paddingHorizontal: 0.0,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ApplianceSectionTitle(
                title: 'Appliance  Details',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                child: const LandLordApplianceSection1(),
              ),
              const ApplianceSectionTitle(
                title: 'Inspection  Details',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                child: const LandLordApplianceSection2(),
              ),
              GetBuilder<LandlordAppliancesController>(
                init: LandlordAppliancesController(),
                builder: (LandlordAppliancesController controller) {
                  return CommonText(
                    'Save To Use',
                    rowMainAxisSize: MainAxisSize.max,
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    rightChild: Switch(
                      value: controller.isSave,
                      onChanged: (bool value) => controller.toggleSave(value),
                      activeColor: Color(AppColors.primary),
                    ),
                    containerStyle: CommonContainerModel(
                      backgroundColor: Colors.grey[200],
                      paddingVertical: 0.01,
                      marginBottom: 0.02,
                      paddingHorizontal: 0.04,
                      marginVertical: 0.015,
                    ),
                  );
                },
              ),
              const ApplianceSectionTitle(
                title: 'Audible  Co  Alarm',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                child: const LandLordApplianceSection3(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplianceSectionTitle extends StatelessWidget {
  const ApplianceSectionTitle({
    super.key,
    this.title,
    this.color,
  });

  final String? title;
  final dynamic color;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      title?.toUpperCase() ?? '',
      style: appTextStyles.textTitleBoldStyle
          .copyWith(fontColor: color ?? Colors.grey[700]),
      containerStyle: CommonContainerModel(
        backgroundColor: Colors.grey[200],
        paddingVertical: 0.01,
        marginBottom: 0.02,
        paddingHorizontal: 0.04,
        width: 1,
      ),
      bottomChild: const SizedBox(),
    );
  }
}
