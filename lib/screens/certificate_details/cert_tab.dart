import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CertTab extends StatelessWidget {
  const CertTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommonContainer(
          style: appContainerStyles.cardStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              CertTitleItem(),
              CertTitleItem(
                title: 'Certificate Status',
                subTitle: 'Pending',
              ),
              CertTitleItem(
                title: 'Site Name',
                subTitle: '14 Orchard St, Bristol BS1 5EH',
              ),
              CertTitleItem(
                title: 'Customer Name',
                subTitle: 'Harry Mied',
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
              const CertTitleItem(
                title: 'Street No & Name',
                subTitle: '14 Orchard St, Bristol BS1 5EH, United Kingdom',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  CertTitleItem(
                    title: 'City',
                    subTitle: 'London',
                  ),
                  CertTitleItem(
                    title: 'Country',
                    subTitle: 'UK',
                  ),
                  SizedBox(),
                ],
              ),
              const CertTitleItem(
                title: 'Postcode',
                subTitle: '00692',
              ),
            ],
          ),
        ),
        CommonContainer(
          style: appContainerStyles.cardStyle,
          paddingVertical: 0.01,
          paddingHorizontal: 0.02,
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
        CommonButton(
          onPress: () {},
          text: 'Edit Certificate',
          backgroundColor: Color(AppColors.primary).withOpacity(0.3),
          marginBottom: 0.02,
          marginTop: 0.01,
          elevation: 0.0,
          fontColor: AppColors.primary,
          overlayColor: Colors.black12,
        ),
        CommonButton(
          onPress: () {},
          text: 'Cancel',
          backgroundColor: Colors.white,
          marginBottom: 0.02,
          elevation: 0.0,
          fontColor: AppColors.red,
          overlayColor: Colors.black12,
        ),
      ],
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
      title ?? 'Certificate Name',
      fontSize: fontH3,
      fontColor: AppColors.greyDark,
      // marginBottom: 0.01,
      rowMainAxisSize: MainAxisSize.max,
      textAlign: TextAlign.start,
      columnCrossAxisAlignment: CrossAxisAlignment.start,
      bottomChild: CommonText(
        subTitle ?? 'Domestic Electrical Installation Condition Report',
        rowMainAxisSize: MainAxisSize.max,
        textAlign: TextAlign.start,
      ),
      containerStyle: const CommonContainerModel(marginBottom: 0.016),
    );
  }
}
