import '../../general_exports.dart';

class ProfileCardPlane extends StatelessWidget {
  const ProfileCardPlane({
    this.planeTitle,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final String? planeTitle;
  final int? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      planeTitle ?? 'Your Plan :  ',
      style: appTextStyles.h3StyleWhite().copyWith(
            rowMainAxisSize: MainAxisSize.max,
            textAlign: TextAlign.start,
            columnMainAxisAlignment: MainAxisAlignment.center,
            fontWeight: FontWeight.w500,
          ),
      containerStyle: appContainerStyles.cardHeader(
        backgroundColor: backgroundColor ?? AppColors.green,
      ),
      rightChild: CommonText(
        'Standard',
        style: appTextStyles.h3StyleWhite().copyWith(
              fontSize: fontHeader,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
