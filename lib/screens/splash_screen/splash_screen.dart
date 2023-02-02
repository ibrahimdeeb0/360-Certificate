import 'package:flutter_svg/flutter_svg.dart';

import '../../general_exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setIsRTL(context);

    return Scaffold(
      backgroundColor: Color(AppColors.white),
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (SplashController controller) {
          return Center(
            child: CommonContainer(
              paddingVertical: 0.2,
              child: SvgPicture.asset(
                iconAppLogo,
                width: DEVICE_WIDTH * 0.1,
                height: DEVICE_WIDTH * 0.1,
              ),
            ),
          );
        },
      ),
    );
  }
}
