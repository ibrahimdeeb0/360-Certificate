import 'package:intl/intl.dart';

import '../../general_exports.dart';

class CompletedCert extends StatelessWidget {
  const CompletedCert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Completed Certs',
        withShadow: false,
      ),
      body: GetBuilder<CompletedCertController>(
        init: CompletedCertController(),
        builder: (CompletedCertController controller) {
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
                  ...controller.competedCerts.map(
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
                      certStatus: 'Completed',
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
