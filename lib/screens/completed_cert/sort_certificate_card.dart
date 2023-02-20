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
    this.statusClr,
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
  final dynamic statusClr;

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
                fontSize: fontH3,
                // marginHorizontal: 0.04,
                // rightChild: CommonText(
                //   price ?? '£ 125',
                //   fontWeight: FontWeight.bold,
                // ),
              )
            ],
          ),
          CommonText(
            date ?? '14-06-2022',
            fontSize: fontH3,
            fontColor: AppColors.greyDark,
            rowMainAxisSize: MainAxisSize.max,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rightChild: CommonText(
              certStatus ?? 'Completed',
              fontSize: fontH3,
              fontColor: Colors.black,
              fontWeight: FontWeight.w500,
              containerStyle: CommonContainerModel(
                backgroundColor:
                    Color(statusClr ?? AppColors.black).withOpacity(0.4),
                borderRadius: 0.15,
                paddingHorizontal: 0.03,
                paddingVertical: 0.006,
              ),
            ),
            containerStyle: const CommonContainerModel(
              marginLeft: 0.078,
              marginTop: 0.01,
              marginBottom: 0.005,
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
            fontSize: fontH3,
            fontColor: AppColors.greyDark,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            leftChild: Padding(
              padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.02),
              child: SvgPicture.asset(
                iconLocation,
                color: Color(AppColors.greyDark),
              ),
            ),

            // bottomChild: CommonText(
            //   customerCountry ?? 'London',
            //   fontSize: fontBody,
            //   fontColor: AppColors.greyDark,
            //   containerStyle: const CommonContainerModel(
            //     alignment: AlignmentDirectional.topStart,
            //     marginLeft: 0.057,
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
