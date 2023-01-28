import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class SubscriptionInvoiceCard extends StatelessWidget {
  const SubscriptionInvoiceCard({
    Key? key,
    this.invoiceNum,
    this.invoiceCost,
    this.onPressDownload,
  }) : super(key: key);

  final String? invoiceNum;
  final String? invoiceCost;
  final Function? onPressDownload;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: appContainerStyles.cardContainer(),
      child: Column(
        children: <Widget>[
          CustomTextRow(
            title: invoiceNum ?? '#148905',
            titleColor: AppColors.colorBlack,
            leftChild: SvgPicture.asset(iconInvoices),
            //paddingBottom: 0.0,
          ),
          CustomTextRow(
            leftPadding: DEVICE_WIDTH * 0.082,
            title: invoiceCost ?? '£ 125',
            titleColor: AppColors.green,
            titleFontWeight: FontWeight.bold,
            withRightChild: true,
            rightChild: CommonContainer(
              onPress: onPressDownload ?? () {},
              style: CommonContainerModel(
                  paddingHorizontal: 0.01,
                  touchEffect: TouchableEffect(type: TouchTypes.scaleAndUp)),
              child: Icon(
                Icons.download,
                color: Color(AppColors.primary),
                size: 25,
              ),
            ),
            paddingBottom: 0.0,
          ),
        ],
      ),
    );
  }
}
