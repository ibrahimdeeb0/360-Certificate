import '../../../../../general_exports.dart';

class LeisureAppliancesDetails extends StatelessWidget {
  const LeisureAppliancesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
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
                child: const LeisureApplianceSection1(),
              ),
              const ApplianceSectionTitle(
                title: 'Inspection  Details',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04.flexWidth),
                child: const LeisureApplianceSection2(),
              ),
              GetBuilder<LeisureAppliancesController>(
                init: LeisureAppliancesController(),
                builder: (LeisureAppliancesController controller) {
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
                child: const LeisureApplianceSection3(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ApplianceSectionTitle extends StatelessWidget {
//   const ApplianceSectionTitle({
//     super.key,
//     this.title,
//     this.color,
//   });

//   final String? title;
//   final dynamic color;

//   @override
//   Widget build(BuildContext context) {
//     return CommonText(
//       title?.toUpperCase() ?? '',
//       style: appTextStyles.textTitleBoldStyle
//           .copyWith(fontColor: color ?? Colors.grey[700]),
//       containerStyle: CommonContainerModel(
//         backgroundColor: Colors.grey[200],
//         paddingVertical: 0.01,
//         marginBottom: 0.02,
//         paddingHorizontal: 0.04,
//         width: 1,
//       ),
//       bottomChild: const SizedBox(),
//     );
//   }
// }
