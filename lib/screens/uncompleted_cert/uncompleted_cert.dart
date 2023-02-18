import 'package:intl/intl.dart';

import '../../general_exports.dart';

class UncompletedCert extends StatelessWidget {
  const UncompletedCert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Not Completed Certs',
        withShadow: false,
      ),
      body: GetBuilder<UncompletedCertController>(
        init: UncompletedCertController(),
        builder: (UncompletedCertController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonContainer(
                    width: 1,
                    height: 0.015,
                    borderRadius: 0.1,
                    // backgroundColor: Get.arguments[keyColor] ?? Colors.grey,
                    backgroundColor: AppColors.homeClr2,
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  // SortCertificateCard(
                  //   onPress: () => Get.toNamed(routeCertificateDetails),
                  // ),
                  ...controller.unCompetedCerts.map(
                    (dynamic item) => SortCertificateCard(
                      onPress: () => Get.toNamed(
                        routeCertificateDetails,
                        arguments: <String, dynamic>{
                          keyId: item[keyId],
                          'customer_id': item['customer_id'],
                        },
                      ),
                      code: '#${item[keyId]}',
                      formType: item['form']['type'],
                      price: '£ 0.0',
                      // date: item['created_at'],

                      date: DateFormat('dd-MM-yyyy').format(
                          DateTime.parse(item['created_at'].toString())),
                      certStatus: item['status']['status'],
                      customerName: item['customer']['name'],
                      customerAddress: item['customer']['address'],
                      // customerCountry: item['customer']['name'],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}