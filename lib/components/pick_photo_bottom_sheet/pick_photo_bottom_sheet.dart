import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class PickPhotoBottomSheet extends StatelessWidget {
  const PickPhotoBottomSheet({
    required this.controller,
    required this.title,
    this.onCamera,
    this.onGallery,
    Key? key,
  }) : super(key: key);

  final dynamic controller;
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
                  onPress: onCamera,
                  // onPress: () {
                  //   controller.attachmentImages = <AttachImageClass>[
                  //     AttachImageClass(
                  //       image: testImage,
                  //       // isImage: false,
                  //       onPress: () => controller.pickImage(fromGallery: false),
                  //       attachType: AttachType.camera,
                  //     ),
                  //   ];
                  //   // controller.pickImage(
                  //   //   fromGallery: false,
                  //   // );
                  // },
                  title: 'Camera',
                  icon: const Icon(Icons.camera_alt_outlined),
                ),
                PickContainer(
                  onPress: onGallery,
                  // onPress: () {
                  //   controller.attachmentImages = <AttachImageClass>[
                  //     AttachImageClass(
                  //       image: testImage,
                  //       // isImage: true,
                  //       onPress: () => controller.pickImage(fromGallery: true),
                  //       attachType: AttachType.camera,
                  //     ),
                  //   ];
                  //   // controller.pickImage(
                  //   //   fromGallery: true,
                  //   // );
                  // },
                  title: 'Gallery',
                  icon: const Icon(Icons.filter_sharp),
                ),
              ],
            ),
            0.03.ph,
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
