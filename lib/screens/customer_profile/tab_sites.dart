import '../../general_exports.dart';

class SitesTab extends StatelessWidget {
  const SitesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProfileController>(
      init: CustomerProfileController(),
      builder: (CustomerProfileController controller) {
        return Column(
          children: <Widget>[
            0.02.ph,
            CommonContainer(
              style: appContainerStyles.cardStyle,
              marginHorizontal: 0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CertTitleItem(
                    title: 'Site Name',
                    subTitle: controller.siteData[0][keyName],
                    isEditable: true,
                    onEdit: () {
                      Get.to(
                        () => const EditSite(),
                        arguments: <dynamic, dynamic>{
                          keyId: controller.siteData[0][keyId],
                          'site_data': controller.siteData,
                        },
                      );
                    },
                  ),
                  CertTitleItem(
                    title: 'Postcode',
                    subTitle: controller.siteData[0]['postal_code'],
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
