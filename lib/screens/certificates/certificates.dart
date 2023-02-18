import 'package:intl/intl.dart';

import '../../general_exports.dart';

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificatesController>(
      init: certificatesController,
      builder: (CertificatesController controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(
            title: 'Certificates',
            withBack: false,
            withSearch: true,
            onPressSearch: () {},
            actionItem: ActionItem(
              type: ActionType.filter,
              onPress: () => Get.bottomSheet(
                const FilterCert(),
                isScrollControlled: true,
              ),
            ),
          ),
          body: CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: DEVICE_HEIGHT * 0.03),
                  ...controller.filteredCert.map(
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
                    ),
                  ),
                ],
              ),
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
    return BottomSheetContainer(
      title: 'Filter',
      responsiveContent: true,
      child: GetBuilder<CertificatesController>(
        init: CertificatesController(),
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
                // CommonButton(
                //   text: 'Save',
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
