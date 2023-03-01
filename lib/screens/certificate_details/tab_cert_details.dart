import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CertTab extends StatelessWidget {
  const CertTab({
    super.key,
  });

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
                    title: 'Certificate Name',
                    subTitle:
                        '${controller.certDetails['form_data']['form']['name']}',
                  ),
                  const CertTitleItem(
                    title: 'Certificate Status',
                    subTitle: 'Completed',
                  ),
                  CertTitleItem(
                    title: 'Site Name',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['sites'][0]['name']}',
                  ),
                  CertTitleItem(
                    title: 'Customer Name',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['name']}',
                  ),
                ],
              ),
            ),
            CommonContainer(
              style: appContainerStyles.cardStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Site details',
                    fontColor: setColor('#093358'),
                    marginBottom: 0.016,
                  ),
                  CertTitleItem(
                    title: 'Street No & Name',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['sites'][0]['street_num']}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CertTitleItem(
                        title: 'City',
                        subTitle:
                            '${controller.certDetails['form_data']['customer']['sites'][0]['city']}',
                      ),
                      CertTitleItem(
                        title: 'Country',
                        subTitle:
                            '${controller.certDetails['form_data']['customer']['country']['name']['en']}',
                      ),
                      const SizedBox(),
                    ],
                  ),
                  CertTitleItem(
                    title: 'Postcode',
                    subTitle:
                        '${controller.certDetails['form_data']['customer']['sites'][0]['postal_code']}',
                  ),
                ],
              ),
            ),
            if (!controller.isPDFLoading)
              Visibility(
                visible: controller.certStatus == 'Completed',
                child: CommonContainer(
                  onPress: () async {
                    // consoleLog(controller.pdfFilePath);
                    // await OpenFilex.open(
                    //   controller.pdfFilePath,
                    // );
                    controller.preparePDF();
                  },
                  style: appContainerStyles.cardStyle,
                  paddingVertical: 0.01,
                  paddingHorizontal: 0.02,
                  touchEffect: TouchableEffect(type: TouchTypes.opacity),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CommonText(
                        'PDF Certificate',
                        marginHorizontal: 0.02,
                        leftChild: SvgPicture.asset(iconPDF),
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              )
            else
              CommonContainer(
                width: 0.07,
                height: 0.03,
                marginBottom: 0.02,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(
                      AppColors.primary,
                    ),
                  ),
                ),
              ),
            if (controller.certStatus != 'Completed' &&
                controller.certStatus != 'Canceled')
              CommonButton(
                onPress: controller.onEditCert,
                text: 'Edit Certificate',
                backgroundColor: Color(AppColors.primary).withOpacity(0.3),
                marginBottom: 0.02,
                marginTop: 0.01,
                elevation: 0.0,
                fontColor: AppColors.primary,
                overlayColor: Colors.black12,
              ),
            if (controller.certStatus != 'Completed' &&
                controller.certStatus != 'Canceled')
              CommonButton(
                onPress: controller.onCancelCertificate,
                // onPress: controller.onCancelCertificate,
                // onPress: () {
                //   consoleLogPretty(controller.formBody);
                // },
                text: 'Cancel',
                backgroundColor: Colors.white,
                marginBottom: 0.02,
                elevation: 0.0,
                fontColor: AppColors.red,
                overlayColor: Colors.black12,
              ),
          ],
        );
      },
    );
  }
}

class CertTitleItem extends StatelessWidget {
  const CertTitleItem({
    super.key,
    this.title,
    this.subTitle,
  });

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      title ?? '',
      fontSize: fontH3,
      fontColor: AppColors.greyDark,
      // marginBottom: 0.01,
      rowMainAxisSize: MainAxisSize.max,
      textAlign: TextAlign.start,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      bottomChild: CommonText(
        subTitle ?? '',
        rowMainAxisSize: MainAxisSize.max,
        textAlign: TextAlign.start,
      ),
      containerStyle: const CommonContainerModel(marginBottom: 0.016),
    );
  }
}
