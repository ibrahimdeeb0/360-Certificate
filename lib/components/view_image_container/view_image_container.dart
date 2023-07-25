import 'dart:io';

import 'package:flutter_svg/svg.dart';

import '../../../general_exports.dart';

class ViewImageContainer extends StatelessWidget {
  const ViewImageContainer({
    required this.imagePath,
    this.isFullScreen = false,
    this.imageType = ImageFormatType.network,
    super.key,
  });

  final String? imagePath;
  final bool isFullScreen;
  final ImageFormatType imageType;

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      width: 1,
      height: 1,
      style: isFullScreen
          ? const CommonContainerModel(
              marginHorizontal: 0.0,
              marginVertical: 0.0,
            )
          : null,
      marginHorizontal: isFullScreen ? 0.0 : 0.06,
      marginVertical: isFullScreen ? 0.0 : 0.16,
      borderRadius: 0.04,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: <Widget>[
          if (imageType == ImageFormatType.local)
            Image.file(
              File(imagePath!),
              fit: BoxFit.cover,
              width: 1.flexWidth,
              height: 1.flexHeight,
            ),
          if (imageType == ImageFormatType.network)
            CachedImage(
              image: imagePath,
              withPlaceHolder: true,
              fit: BoxFit.cover,
              width: 1.flexWidth,
              height: 1.flexHeight,
            ),
          //  alignment: AlignmentDirectional.topEnd,
          Align(
            alignment: AlignmentDirectional.topStart,
            child: CircleContainer(
              iconWidget: IconButton(
                onPressed: Get.back,
                tooltip: 'back'.tr,
                icon: SvgPicture.asset(
                  iconClose,
                  width: 0.06.flexWidth,
                ),
                // Icon(
                //   Icons.arrow_forward,
                //   color: Colors.black,
                //   size: (0.1.flexWidth),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
