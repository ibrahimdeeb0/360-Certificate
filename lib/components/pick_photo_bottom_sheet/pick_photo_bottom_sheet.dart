import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../general_exports.dart';

class PickPhotoBottomSheet extends StatelessWidget {
  const PickPhotoBottomSheet({
    // required this.controller,
    required this.title,
    this.onCamera,
    this.onGallery,
    Key? key,
  }) : super(key: key);

  // final dynamic controller;
  final String title;
  final Function? onCamera;
  final Function? onGallery;

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      // title: title,
      responsiveContent: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CommonText(
              title.tr,
              style: pickPhotoTitleStyle,
              marginBottom: 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PickContainer(
                  onPress: () async {
                    final PermissionStatus status =
                        await Permission.camera.request();

                    if (status.isDenied ||
                        status.isRestricted ||
                        status.isPermanentlyDenied) {
                      openSimpleDialog(
                        title:
                            'Allowing 360 Certificate App to access the camera on your device',
                        description:
                            'This allows you to share photos with the application on your device',
                        btnText: 'Open Settings',
                        titleIcon: Icon(
                          Icons.camera_alt_outlined,
                          color: Color(AppColors.primary),
                        ),
                        onPress: () {
                          Get.back();
                          openAppSettings();
                        },
                      );
                    } else {
                      onCamera?.call();
                    }
                  },
                  title: 'Camera',
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
                PickContainer(
                  onPress: () async {
                    PermissionStatus? status;

                    if (Platform.isIOS) {
                      status = await Permission.photos.request();
                    } else {
                      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                      final AndroidDeviceInfo androidInfo =
                          await deviceInfo.androidInfo;

                      consoleLog(androidInfo.version.sdkInt,
                          key: 'SDK-Version');

                      status = androidInfo.version.sdkInt < 33
                          ? await Permission.storage.request()
                          : await Permission.photos.request();
                    }

                    if (status.isDenied ||
                        status.isRestricted ||
                        status.isPermanentlyDenied) {
                      openSimpleDialog(
                        title: Platform.isIOS
                            ? 'Allowing 360 Certificate App to access the Photos on your device'
                            : 'Allowing 360 Certificate App to access the Photos on your device',
                        description:
                            'This allows you to share photos with the application',
                        btnText: 'Open Settings',
                        titleIcon: Icon(
                          Icons.filter_sharp,
                          color: Color(AppColors.primary),
                        ),
                        onPress: () {
                          Get.back();
                          openAppSettings();
                        },
                      );
                    } else {
                      onGallery?.call();
                    }
                  },
                  title: 'Gallery',
                  icon: const Icon(Icons.filter_sharp),
                ),
              ],
            ),
            0.03.boxHeight,
          ],
        ),
      ),
    );
  }
}

class PickContainer extends StatelessWidget {
  const PickContainer({
    required this.icon,
    required this.onPress,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String? title;
  final dynamic icon;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      borderRadius: 0.02,
      backgroundColor: Color(AppColors.primary).withOpacity(0.1),
      paddingHorizontal: 0.04,
      paddingVertical: 0.02,
      marginRight: 0.01,
      // width: 0.43,
      // height: 0.15,
      touchEffect: TouchableEffect(
        type: TouchTypes.opacity,
      ),
      onPress: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if (icon is String)
            SvgPicture.asset(
              icon!,
            )
          else
            icon,
          CommonText(
            title,
            style: appTextStyles.h3StyleBlack(),
          )
        ],
      ),
    );
  }
}
