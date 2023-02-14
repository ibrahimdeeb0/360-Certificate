import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class SortCertificateCard extends StatelessWidget {
  const SortCertificateCard({
    super.key,
    this.code,
    this.formType,
    this.price,
    this.date,
    this.certStatus,
    this.customerName,
    this.customerAddress,
    this.customerCountry,
    this.onPress,
  });

  final String? code;
  final String? formType;
  final String? price;
  final String? date;
  final String? certStatus;
  final String? customerName;
  final String? customerAddress;
  final String? customerCountry;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPress,
      width: 1,
      borderRadius: 0.03,
      paddingHorizontal: 0.03,
      paddingVertical: 0.015,
      backgroundColor: AppColors.greyBackground,
      marginBottom: 0.02,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CommonText(
                code ?? '#148905',
                marginHorizontal: 0.025,
                leftChild: SvgPicture.asset(
                  iconCertificates,
                  color: Colors.black,
                ),
              ),
              CommonText(
                formType ?? 'Gas',
                fontWeight: FontWeight.bold,
                marginHorizontal: 0.04,
                rightChild: CommonText(
                  price ?? '£ 125',
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          CommonText(
            date ?? '14-06-2022',
            fontSize: fontBody,
            fontColor: AppColors.greyDark,
            rowMainAxisSize: MainAxisSize.max,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rightChild: CommonText(
              certStatus ?? 'Paid - Cert Sent',
              fontColor: AppColors.greyDark,
              fontSize: fontBody,
            ),
            containerStyle: const CommonContainerModel(
              marginLeft: 0.078,
              marginTop: 0.01,
              marginBottom: 0.01,
            ),
          ),
          Divider(
            thickness: 2,
            color: Color(AppColors.greyLightBorder),
          ),
          CommonText(
            customerName ?? 'Harry mied',
            marginHorizontal: 0.02,
            leftChild: SvgPicture.asset(
              iconPerson,
              color: Colors.black,
            ),
            containerStyle: const CommonContainerModel(
              alignment: AlignmentDirectional.topStart,
              marginTop: 0.005,
              marginBottom: 0.01,
            ),
          ),
          CommonText(
            customerAddress ?? '1234,Rgent Street, International TribuTribu',
            inlineSpans: const <InlineSpan>[],
            textAlign: TextAlign.start,
            rowMainAxisSize: MainAxisSize.max,
            fontSize: fontBody,
            fontColor: AppColors.greyDark,
            leftChild: Padding(
              padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.02),
              child: SvgPicture.asset(
                iconLocation,
                color: Color(AppColors.greyDark),
              ),
            ),
            bottomChild: CommonText(
              customerCountry ?? 'UK / London',
              fontSize: fontBody,
              fontColor: AppColors.greyDark,
              containerStyle: const CommonContainerModel(
                alignment: AlignmentDirectional.topStart,
                marginLeft: 0.057,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
