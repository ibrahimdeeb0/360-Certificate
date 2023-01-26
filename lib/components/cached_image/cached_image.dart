import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

import '../../general_exports.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.image,
    this.topLeftBorder,
    this.topRightBorder,
    this.bottomLeftBorder,
    this.bottomRightBorder,
    this.borderRadius = 0,
    this.diskCache,
    this.height,
    this.width,
    this.withOverlay = false,
    this.withPlaceHolder = false,
    this.fit = BoxFit.fill,
    Key? key,
  }) : super(key: key);

  final String? image;
  final double? height;
  final double? width;
  final double? topLeftBorder;
  final double? topRightBorder;
  final int? diskCache;
  final double? bottomLeftBorder;
  final double? bottomRightBorder;
  final double? borderRadius;
  final bool withOverlay;
  final bool withPlaceHolder;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeftBorder ?? borderRadius!),
            topRight: Radius.circular(topRightBorder ?? borderRadius!),
            bottomLeft: Radius.circular(bottomLeftBorder ?? borderRadius!),
            bottomRight: Radius.circular(bottomRightBorder ?? borderRadius!),
          ),
          child: image!.contains('svg')
              ? SvgPicture.network(
                  image!,
                  fit: BoxFit.cover,
                  // fit: fit,
                  height: height,
                  width: width,
                )
              : CachedNetworkImage(
                  placeholder: (BuildContext context, String url) =>
                      withPlaceHolder
                          ? Align(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(DEVICE_WIDTH * 0.1),
                                  child: CircularProgressIndicator(
                                    color: Color(AppColors.primary),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                  imageUrl: image!,
                  fit: fit,
                  height: height,
                  width: width,
                  maxWidthDiskCache: diskCache,
                  maxHeightDiskCache: diskCache,
                  memCacheHeight: diskCache,
                  memCacheWidth: diskCache,
                ),
        ),
        if (withOverlay)
          CommonContainer(
            height: height,
            width: width,
            topLeftRadius: topLeftBorder,
            topRightRadius: topRightBorder,
            bottomLeftRadius: bottomLeftBorder,
            bottomRightRadius: bottomRightBorder,
          )
        else
          const SizedBox(),
      ],
    );
  }
}
