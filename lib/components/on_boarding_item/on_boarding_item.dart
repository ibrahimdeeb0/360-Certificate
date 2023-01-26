import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    this.image,
    this.title,
    this.content,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? content;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      style: appContainerStyles.bottomSheetContainer(height: 0.54),
      child: Column(
        children: <Widget>[
          CommonContainer(
            height: 0.3,
            child: SvgPicture.asset(
              image!,
            ),
          ),
          CommonText(
            title!,
            style: appTextStyles.h2Style(),
            margin: 0.016,
            marginTop: 0.06,
          ),
          CommonContainer(
            style: appContainerStyles.onBoardingDivider(),
          ),
          CommonText(
            content!,
            style: appTextStyles.h4MediumStyleBlack(),
            marginHorizontal: 0.05,
            marginVertical: 0.02,
          ),
        ],
      ),
    );
  }
}
