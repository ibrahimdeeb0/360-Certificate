import 'package:flutter_svg/svg.dart';

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
          width: 1.flexWidth,
          child: controller.filteredCert.isNotEmpty
              ? Column(
                  children: <Widget>[
                    SizedBox(height: DEVICE_HEIGHT * 0.02),
                    ...controller.filteredCert.map(
                      (dynamic item) {
                        final String certStatus = item[keyStatus][keyName];
                        return SortCertificateCard(
                          onPress: () {
                            Get.toNamed(
                              routeCertificateDetails,
                              arguments: <String, dynamic>{
                                keyId: item[keyId],
                                'customer_id': item['customer_id'],
                              },
                            );
                            consoleLogPretty(item);
                          },
                          code: '#${item['num_cert'] ?? item['id']}',
                          formType: item[keyForm][keyName],
                          price: '£ 0.0',
                          date: '${item['created_at']}'.formatDate,
                          certStatus: certStatus,
                          customerName:
                              '${item['customer']['first_name']}'.capitalize,
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
                )
              : CommonContainer(
                  child: Column(
                    children: <Widget>[
                      0.08.boxHeight,
                      Center(
                        child: SvgPicture.asset(
                          iconNotFoundCert,
                          height: 0.15.flexHeight,
                          width: 0.01.flexWidth,
                        ),
                      ),
                      const CommonText(
                        'No Certificates Found',
                        marginTop: 0.02,
                        fontSize: fontH2,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
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
    final CertificatesController controller =
        Get.find<CertificatesController>();
    return BottomSheetContainer(
      title: 'Filter',
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: DEVICE_HEIGHT * 0.03),
            ...controller.filterItems.map(
              (Map<String, dynamic> item) => CustomRadioSelection(
                title: item[keyTitle],
                onPress: () => controller.onFilterCert(certItem: item),
                isSelected: controller.selectedType == item[keyType],
              ),
            ),
            SizedBox(height: DEVICE_HEIGHT * 0.03),
          ],
        ),
      ),
    );
  }
}
