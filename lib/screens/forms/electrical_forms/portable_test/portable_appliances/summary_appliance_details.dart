import '../../../../../general_exports.dart';

class SummaryApplianceDetails extends StatelessWidget {
  const SummaryApplianceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: '',
      ),
      body: GetBuilder<PortableAppliancesController>(
        init: PortableAppliancesController(),
        builder: (PortableAppliancesController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: Column(
              children: <Widget>[
                // const CommonInput(
                //   topLabelText: 'Total Number Of Appliances',
                //   marginBottom: 0.02,
                //   enabled: false,
                //   width: 0.4,
                // ),
                CommonText(
                  'Total Number Of Appliances',
                  fontSize: fontH2,
                  fontWeight: FontWeight.bold,
                  rowMainAxisSize: MainAxisSize.max,
                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  marginBottom: 0.012,
                  bottomChild: CommonText(
                    controller.applianceSummary[formKeyTotalApplianceNumber]
                        .toString(),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                0.03.boxHeight,
                CommonText(
                  'Appliance Passed',
                  rowMainAxisSize: MainAxisSize.max,
                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  rightChild: CommonInput(
                    value: controller.applianceSummary[formKeyAppliancePassed]
                        .toString(),
                    width: 0.25,
                    enabled: false,
                    fillColor: Colors.grey[200],
                  ),
                ),
                0.02.boxHeight,
                CommonText(
                  'Appliance Failed',
                  rowMainAxisSize: MainAxisSize.max,
                  rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  rightChild: CommonInput(
                    value: controller.applianceSummary[formKeyApplianceFailed]
                        .toString(),
                    width: 0.25,
                    enabled: false,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
