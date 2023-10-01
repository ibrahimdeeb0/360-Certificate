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
                  CertTitleItem(
                    title: 'Certificate Status',
                    subTitle: controller.certStatus,
                  ),
                  CertTitleItem(
                    title: 'Site Name',
                    subTitle:
                        '${controller.certDetails['form_data']['site']?['name'] ?? ''}',
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
                        '${controller.certDetails['form_data']['site']?['street_num'] ?? ''}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CertTitleItem(
                        title: 'City',
                        subTitle:
                            '${controller.certDetails['form_data']['site']?['city'] ?? ''}',
                      ),
                      CertTitleItem(
                        title: 'Country',
                        subTitle:
                            //! Need to Fix
                            '${controller.certDetails['form_data']['site']?['country']['name'] ?? ''} ',
                      ),
                      const SizedBox(),
                    ],
                  ),
                  CertTitleItem(
                    title: 'Postcode',
                    subTitle:
                        '${controller.certDetails['form_data']['site']?['postal_code'] ?? ''}',
                  ),
                ],
              ),
            ),
            if (!controller.isPDFLoading)
              Visibility(
                visible: controller.statusId == idCompleted,
                child: CommonContainer(
                  onPress: () async {
                    // consoleLog(controller.pdfFilePath);
                    // await OpenFilex.open(
                    //   controller.pdfFilePath,
                    // );
                    controller.getPdfPath();
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
            if (controller.statusId != idCompleted &&
                controller.statusId != idCanceled)
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
            if (controller.statusId != idCompleted &&
                controller.statusId != idCanceled)
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
    this.onEdit,
    this.isEditable = false,
  });

  final String? title;
  final String? subTitle;
  final bool isEditable;
  final Function? onEdit;

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
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      rightChild: isEditable
          ? CommonContainer(
              onPress: onEdit,
              touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
              child: Icon(
                Icons.edit,
                color: Colors.grey[700],
              ),
            )
          : const SizedBox(),
      bottomChild: CommonText(
        subTitle ?? '',
        rowMainAxisSize: MainAxisSize.max,
        textAlign: TextAlign.start,
        marginTop: 0.006,
      ),
      containerStyle: const CommonContainerModel(marginBottom: 0.016),
    );
  }
}
