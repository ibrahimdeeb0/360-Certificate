import '../../general_exports.dart';

//ignore: must_be_immutable
class CertDetailsCard extends StatefulWidget {
  CertDetailsCard({
    super.key,
    this.toggle = false,
    this.flexCard = false,
    this.certId,
    this.certDate,
    this.certType,
    this.certCost,
    this.certPayStatus,
    this.certStatus,
    this.siteName,
  });

  bool? toggle;
  bool? flexCard;
  final String? certId;
  final String? certDate;
  final String? certType;
  final String? certCost;
  final String? certPayStatus;
  final String? certStatus;
  final String? siteName;

  @override
  State<CertDetailsCard> createState() => _CertDetailsCardState();
}

class _CertDetailsCardState extends State<CertDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      marginHorizontal: 0.04,
      width: 1,
      backgroundColor: const Color(0xffEBE9E9),
      paddingHorizontal: 0.04,
      paddingVertical: 0.015,
      borderRadius: 0.02,
      marginBottom: 0.02,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CertTitleItem(
                title: 'Cert No:',
                subTitle: widget.certId ?? '',
              ),
              CertTitleItem(
                title: 'Cert Date',
                subTitle: widget.certDate ?? '',
              ),
              // Arrow Button
              CommonContainer(
                onPress: () {
                  setState(() {
                    widget.toggle = !widget.toggle!;
                    widget.flexCard = false;
                  });
                },
                touchEffect: TouchableEffect(type: TouchTypes.scaleAndFade),
                child: Icon(
                  widget.toggle!
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: DEVICE_WIDTH * 1,
            height:
                widget.toggle! ? DEVICE_HEIGHT * 0.225 : DEVICE_HEIGHT * 0.0,
            color: const Color(0xffEBE9E9),
            onEnd: () {
              setState(() {
                widget.flexCard = true;
              });
            },
            child: widget.flexCard!
                ? Column(
                    children: <Widget>[
                      CertTitleItem(
                        title: 'Cert Type',
                        subTitle: widget.certType ?? '',
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     CertTitleItem(
                      //       title: 'Total Cost',
                      //       subTitle: widget.certCost ?? '',
                      //     ),
                      //     CertTitleItem(
                      //       title: 'Payment Status',
                      //       subTitle: widget.certPayStatus ?? '',
                      //     ),
                      //     const SizedBox(),
                      //   ],
                      // ),
                      CertTitleItem(
                        title: 'Cert Status',
                        subTitle: widget.certStatus ?? '',
                      ),
                      CertTitleItem(
                        title: 'Site Name',
                        subTitle: widget.siteName ?? '',
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
