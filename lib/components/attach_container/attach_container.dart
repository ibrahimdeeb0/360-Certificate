import 'dart:io';

import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class AttachContainer extends StatelessWidget {
  const AttachContainer({
    Key? key,
    this.imagePath,
    this.onAddImage,
    this.onRemoveImage,
    this.isAddedImage = false,
    this.isCamera = false,
    this.height,
    this.width,
  }) : super(key: key);

  final Function? onAddImage;
  final Function? onRemoveImage;
  final bool isAddedImage;
  final String? imagePath;
  final bool isCamera;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CommonContainer(
          onPress: isAddedImage == false ? onAddImage?.call : null,
          marginBottom: 0.02,
          marginTop: 0.015,
          marginHorizontal: 0.02,
          width: width ?? 0.25,
          height: height ?? 0.15,
          borderRadius: 0.015,
          touchEffect: TouchableEffect(
            type: TouchTypes.opacity,
            opacity: 0.6,
          ),
          clipBehavior: Clip.hardEdge,
          child: isAddedImage
              ? Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                  width: DEVICE_WIDTH * 1,
                  height: DEVICE_HEIGHT * 1,
                )
              : SvgPicture.asset(isCamera ? iconAddImageAttach : iconAddAttach),
        ),
        if (isAddedImage)
          Positioned(
            child: IconButton(
              onPressed: () => onRemoveImage?.call(),
              icon: SvgPicture.asset(
                iconDelete,
                height: DEVICE_HEIGHT * 0.03,
                width: DEVICE_WIDTH * 0.043,
              ),
            ),
          ),
      ],
    );
  }
}
