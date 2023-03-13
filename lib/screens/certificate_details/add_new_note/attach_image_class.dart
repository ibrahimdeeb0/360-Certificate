import 'package:image_picker/image_picker.dart';

enum AttachType {
  image,
  video,
}

class AttachImageClass {
  AttachImageClass({
    this.image,
    this.file,
    this.onPress,
    this.attachType,
    this.isImage = true,
  });
  final String? image;
  final Function()? onPress;
  final bool isImage;
  final XFile? file;
  final AttachType? attachType;
}
