import 'package:intl/intl.dart';

import '../../general_exports.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificatesController>(
      init: certificatesController,
      builder: (CertificatesController controller) {
        return CommonContainer(
          paddingHorizontal: 0.04,
          child: Column(
            children: <Widget>[
              SizedBox(height: DEVICE_HEIGHT * 0.02),
              ...controller.filteredCert.map(
                (dynamic item) {
                  final String certStatus = item[keyStatus][keyName];
                  return SortCertificateCard(
                    onPress: () => Get.toNamed(
                      routeCertificateDetails,
                      arguments: <String, dynamic>{
                        keyId: item[keyId],
                        'customer_id': item['customer_id'],
                      },
                    ),
                    code: '#${item[keyId]}',
                    formType: item[keyForm][keyType],
                    price: '£ 0.0',
                    date: DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(item['created_at'].toString())),
                    certStatus: certStatus,
                    customerName: '${item['customer'][keyName]}'.capitalize,
                    customerAddress: item['customer']['address'],
                    statusClr: certStatus == 'Completed'
                        ? AppColors.completedClr
                        : certStatus == 'Canceled'
                            ? AppColors.canceledClr
                            : certStatus == 'In Progress'
                                ? AppColors.inProgressClr
                                : AppColors.pendingClr,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class FilterCert extends StatelessWidget {
  const FilterCert({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Filter',
      responsiveContent: true,
      child: GetBuilder<CertificatesController>(
        init: certificatesController,
        builder: (CertificatesController controller) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.03),
                ...controller.filterItems.map(
                  (Map<String, dynamic> item) => CustomRadioSelection(
                    title: item[keyTitle],
                    onPress: () => controller.onFilterCert(item),
                    isSelected: controller.selectedType == item[keyType],
                  ),
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.03),
              ],
            ),
          );
        },
      ),
    );
  }
}
