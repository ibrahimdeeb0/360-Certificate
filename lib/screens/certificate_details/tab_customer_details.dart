import '../../general_exports.dart';

class CustomerDetailsTab extends StatelessWidget {
  const CustomerDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificateDetailsController>(
      init: CertificateDetailsController(),
      builder: (CertificateDetailsController controller) {
        return Column(
          children: <Widget>[
            CommonContainer(
              style: appContainerStyles.cardStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CertTitleItem(
                    title: 'Company/Customer Name',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['name']}',
                  ),
                  CertTitleItem(
                    title: 'Street No & Name',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['street_num']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CertTitleItem(
                        title: 'City',
                        subTitle:
                            '${controller.certDetails['form_data']['customer']['city']}',
                      ),
                      CertTitleItem(
                        title: 'Country',
                        subTitle:
                            '${controller.certDetails['form_data']['customer']['country']['name']}',
                      ),
                      const SizedBox(),
                    ],
                  ),
                  CertTitleItem(
                    title: 'Postcode',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['postal_code']}',
                  ),
                  CertTitleItem(
                    title: 'Email',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['contacts'][0]['email']}',
                  ),
                  // if (controller.certDetails['form_data']['status']
                  //       ['status'] !=
                  //   'Completed')
                  // CommonContainer(
                  //   onPress: () {},
                  //   touchEffect: TouchableEffect(type: TouchTypes.opacity),
                  //   marginVertical: 0.015,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: const <Widget>[
                  //       CertTitleItem(
                  //         title: 'Payment Terms',
                  //         subTitle: 'Due Before Cert',
                  //       ),
                  //       Icon(Icons.arrow_forward)
                  //     ],
                  //   ),
                  // ),
                  // if (controller.certDetails['form_data']['status']
                  //         ['status'] !=
                  //     'Completed')
                  //   CommonContainer(
                  //     onPress: () {},
                  //     touchEffect: TouchableEffect(type: TouchTypes.opacity),
                  //     marginBottom: 0.015,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: const <Widget>[
                  //         CertTitleItem(
                  //           title: 'When to send the invoice',
                  //           subTitle: 'Per Week',
                  //         ),
                  //         Icon(Icons.arrow_forward)
                  //       ],
                  //     ),
                  //   ),
                  // if (controller.certDetails['form_data']['status']
                  //         ['status'] !=
                  //     'Completed')
                  //   const CertTitleItem(
                  //     title: 'Overdue Amount ',
                  //     subTitle: '3',
                  //   ),
                ],
              ),
            ),
            if (controller.statusId == idCompleted)
              CommonButton(
                text: 'Send PDF',
                onPress: () {},
                marginTop: 0.01,
                marginBottom: 0.02,
              ),
          ],
        );
      },
    );
  }
}
