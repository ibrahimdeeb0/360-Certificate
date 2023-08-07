import '../../general_exports.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProfileController>(
      init: CustomerProfileController(),
      builder: (CustomerProfileController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            0.02.boxHeight,
            CommonContainer(
              style: appContainerStyles.cardStyle,
              marginHorizontal: 0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...controller.mapDetails.map(
                    (Map<String, dynamic> item) => CertTitleItem(
                      title: item[keyTitle],
                      subTitle: item[keyValue],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 0.65.flexWidth,
                        child: const CommonText(
                          "Is the site's address provided the same as the customer's address?",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      if (controller.billingSame)
                        const CommonButton(
                          text: 'Yes',
                          width: 0.18,
                          height: 0.045,
                        )
                      else
                        CommonButton(
                          text: 'No',
                          fontColor: Colors.grey[800],
                          width: 0.18,
                          height: 0.045,
                          backgroundColor: Colors.grey[400],
                        )
                    ],
                  ),
                ],
              ),
            ),
            const CommonText(
              'Customer Contact Details',
              marginTop: 0.01,
              marginBottom: 0.02,
              marginHorizontal: 0.04,
            ),
            CommonContainer(
              style: appContainerStyles.cardStyle,
              marginHorizontal: 0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...controller.mapContactDetails.map(
                    (Map<String, dynamic> item) => CertTitleItem(
                      title: item[keyTitle],
                      subTitle: item[keyValue],
                    ),
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
