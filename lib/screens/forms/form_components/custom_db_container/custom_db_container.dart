import '../../../../general_exports.dart';

class CircuitDetailsContainer extends StatelessWidget {
  const CircuitDetailsContainer({
    Key? key,
    this.dbName,
    this.locationName,
    this.zsName,
    this.ipfName,
    this.onPressDBContainer,
    this.onPressDelete,
    this.showDeleteIcon = true,
  }) : super(key: key);

  final String? dbName;
  final String? locationName;
  final String? zsName;
  final String? ipfName;
  final Function? onPressDBContainer;
  final Function? onPressDelete;
  final bool showDeleteIcon;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      onPress: onPressDBContainer?.call,
      style: CommonContainerModel(
        backgroundColor: Colors.white,
        width: 1,
        marginBottom: 0.01,
        borderRadius: 0.02,
        // height: 0.13,
        minHeight: 0.13,
        paddingBottom: 0.015,
        paddingLeft: 0.03,
        paddingRight: 0.03,
        borderWidth: 1,
        borderColor: AppColors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            imageDBElectrical,
            width: DEVICE_WIDTH * 0.18,
            height: DEVICE_HEIGHT * 0.08,
          ),
          CommonContainer(
            width: 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: DEVICE_HEIGHT * 0.01,
                ),
                CommonText(
                  dbName ?? 'Circuit Name: ',
                  style: appTextStyles.h2StyleBlack().copyWith(
                        fontWeight: FontWeight.w500,
                        fontColor: Color(AppColors.colorBlack),
                        textAlign: TextAlign.start,
                      ),
                ),
                CommonText(
                  locationName ?? 'Location:',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                      ),
                ),
                CommonText(
                  zsName ?? 'Zs :',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                      ),
                ),
                CommonText(
                  ipfName ?? 'Ipf :',
                  style: appTextStyles.h3GreyStyle().copyWith(
                        fontSize: fontBody,
                        textAlign: TextAlign.start,
                      ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Visibility(
                visible: showDeleteIcon,
                child: CommonContainer(
                  onPress: onPressDelete?.call,
                  style: CommonContainerModel(
                    padding: 0.01,
                    marginBottom: 0.02,
                    borderColor: AppColors.red,
                    borderWidth: 1,
                    boxShape: BoxShape.circle,
                    touchEffect: TouchableEffect(
                      type: TouchTypes.scaleAndFade,
                      lowerBound: 0.8,
                    ),
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    color: Color(AppColors.red),
                    size: ((DEVICE_HEIGHT * 0.015) + (DEVICE_WIDTH * 0.015)),
                  ),
                ),
              ),
              SvgIconHelper(
                iconPath: iconArrowGo,
                color: Colors.grey,
                width: DEVICE_WIDTH * 0.014,
                height: DEVICE_HEIGHT * 0.014,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
