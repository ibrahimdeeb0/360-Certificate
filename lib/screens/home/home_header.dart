import 'dart:io';

import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class HomeHeader extends StatelessWidget with PreferredSizeWidget {
  HomeHeader({
    Key? key,
    //  this.isViewedNotification = true,
  }) : super(key: key);

  // final bool isViewedNotification;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + DEVICE_HEIGHT * 0.02);

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      paddingTop: 0.02,
      paddingHorizontal: 0.02,
      child: AppBar(
        elevation: 0,
        toolbarHeight: kToolbarHeight + (DEVICE_HEIGHT * 0.02),
        backgroundColor: Color(AppColors.white),
        surfaceTintColor: Colors.white,
        // back and drawer icons
        centerTitle: false,
        // title and icon
        title: CommonContainer(
          child: SvgPicture.asset(
            iconAppLogo,
            width: DEVICE_WIDTH * 0.07,
            height: DEVICE_WIDTH * 0.07,
          ),
        ),

        leadingWidth: 0.0,
        automaticallyImplyLeading: false,

        actions: <Widget>[
          GetBuilder<ProfileController>(
            init: profileController,
            builder: (ProfileController controller) {
              return CommonContainer(
                onPress: () => Get.toNamed(routeProfile),
                style: CommonContainerModel(
                  backgroundColor: Colors.black12,
                  width: DEVICE_WIDTH * 0.0003,
                  height: DEVICE_HEIGHT * 0.0002,
                  clipBehavior: Clip.hardEdge,
                  boxShape: BoxShape.circle,
                  touchEffect: TouchableEffect(
                    type: TouchTypes.scaleAndFade,
                    lowerBound: 0.8,
                  ),
                ),
                child: controller.fileImage?.path != null
                    ? Image.file(
                        File(controller.fileImage!.path),
                        width: DEVICE_WIDTH * 1,
                        height: DEVICE_HEIGHT * 1,
                        fit: BoxFit.cover,
                      )
                    : controller.userDataProfile.isNotEmpty
                        ? controller.userDataProfile['image_profile_url'] ==
                                null
                            ? const CircleContainer()
                            : CachedImage(
                                image:
                                    '${controller.userDataProfile['image_profile_url']}',
                                width: DEVICE_WIDTH * 1,
                                height: DEVICE_HEIGHT * 1,
                                withPlaceHolder: true,
                                fit: BoxFit.cover,
                              )
                        : const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}
