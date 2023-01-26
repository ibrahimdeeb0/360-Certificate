import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class PickPhotoBottomSheet extends StatelessWidget {
  const PickPhotoBottomSheet({
    required this.controller,
    required this.title,
    Key? key,
  }) : super(key: key);

  final dynamic controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      // style: parentSheet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CommonText(
            title.tr,
            style: pickPhotoTitleStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              PickContainer(
                onPress: () {
                  controller.pickImage(
                    fromGallery: false,
                  );
                },
                title: 'goToCamera'.tr,
                icon: const Icon(Icons.camera_alt_outlined),
              ),
              PickContainer(
                onPress: () {
                  controller.pickImage(
                    fromGallery: true,
                  );
                },
                title: 'gallery'.tr,
                icon: const Icon(Icons.filter_sharp),
              ),
            ],
          ),
        ],
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
      style: bottomSheetPickPictureStyle,
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
