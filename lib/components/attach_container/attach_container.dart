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
  }) : super(key: key);

  final Function? onAddImage;
  final Function? onRemoveImage;
  final bool isAddedImage;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CommonContainer(
          onPress: isAddedImage == false ? onAddImage?.call : null,
          marginBottom: 0.02,
          marginTop: 0.015,
          marginHorizontal: 0.02,
          width: 0.25,
          height: 0.15,
          borderRadius: 0.015,
          borderWidth: isAddedImage ? 0 : 1.5,
          borderColor: Colors.grey,
          backgroundColor: Colors.grey[100],
          touchEffect: TouchableEffect(
            type: TouchTypes.opacity,
            opacity: 0.7,
          ),
          clipBehavior: Clip.hardEdge,
          child: isAddedImage
              ? Image.file(
                  File(imagePath!), //controller.fileImage!.path
                  fit: BoxFit.cover,
                  width: DEVICE_WIDTH * 1,
                  height: DEVICE_HEIGHT * 1,
                )
              : Icon(
                  Icons.add,
                  color: Colors.grey[700],
                ),
        ),
        if (isAddedImage)
          Positioned(
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerDown: (PointerDownEvent details) {
                onRemoveImage?.call();
              },
              // onTap: onRemoveImage?.call,
              child: SvgPicture.asset(
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
