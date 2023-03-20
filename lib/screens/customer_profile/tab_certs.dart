import 'package:intl/intl.dart';

import '../../general_exports.dart';

class CertsTab extends StatelessWidget {
  const CertsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerProfileController>(
      init: CustomerProfileController(),
      builder: (CustomerProfileController controller) {
        return Column(
          children: <Widget>[
            0.02.ph,
            ...controller.certData.map(
              (dynamic item) => CertDetailsCard(
                onDetails: () => Get.toNamed(
                  routeCertificateDetails,
                  arguments: <String, dynamic>{
                    keyId: item[keyId],
                    'customer_id': item['customer_id'],
                  },
                ),
                certId: '#${item[keyId]}',
                certDate: DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(item['created_at'])),
                certType: 'EICR',
                certCost: item[keyName],
                certPayStatus: item[keyName],
                certStatus: idCompleted == item['status_id']
                    ? 'Completed'
                    : idCanceled == item['status_id']
                        ? 'Canceled'
                        : idFailed == item['status_id']
                            ? 'Failed'
                            : idInProgress == item['status_id']
                                ? 'In Progress'
                                : 'Pending',
                siteName: controller.siteData[0][keyName],
              ),
            ),
            // CommonButton(
            //   onPress: () {
            //     consoleLogPretty(controller.certData);
            //   },
            //   marginVertical: 0.015,
            // ),
          ],
        );
      },
    );
  }
}
