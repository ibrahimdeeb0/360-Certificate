import '../../general_exports.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    this.child,
    this.title,
    this.height,
    this.style,
    this.responsiveContent = false,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final String? title;
  final double? height;
  final CommonContainerModel? style;
  final bool responsiveContent;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: style ??
          appContainerStyles.bottomSheetContainer(
            height: responsiveContent ? 0.0 : height,
          ),
      child: Stack(
        children: <Widget>[
          CommonContainer(
            style: CommonContainerModel(
              paddingTop: title != null ? 0.05 : 0.02,
            ),
            child: child ?? const SizedBox(),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: CommonText(
              title ?? '',
              // style: appTextStyles.h2StyleBlack(),
              // fontWeight: FontWeight.w500,
              // rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              // rowMainAxisSize: MainAxisSize.max,
              // containerStyle: CommonContainerModel(
              //   backgroundColor:
              //       title != null ? AppColors.white : Colors.transparent,
              //   topLeftRadius: 0.05,
              //   topRightRadius: 0.05,
              //   alignment: AlignmentDirectional.topStart,
              // ),
              // rightChild: CircleContainer(
              //   onPress: Get.back,
              //   circuitSize: 0.065,
              //   backgroundColor: Colors.black26,
              //   iconWidget: Icon(
              //     size: 18.0,
              //     Icons.close,
              //     color: Color(AppColors.white),
              //   ),
              // ),
              // topChild: CommonContainer(
              //   style: CommonContainerModel(
              //     width: 0.15,
              //     height: 0.007,
              //     borderRadius: 0.015,
              //     backgroundColor: AppColors.grey,
              //     marginVertical: 0.01,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
