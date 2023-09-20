import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconHelper extends StatelessWidget {
  const SvgIconHelper({
    required this.iconPath,
    required this.color,
    this.height = 20,
    this.width = 15,
    this.fit = BoxFit.contain, // Provide a default value here
    Key? key,
  }) : super(key: key);
  final String iconPath;
  final double height;
  final double width;
  final Color color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: height,
      width: width,
      fit: fit,
    );
  }
}

class SvgIconNetworkHelper extends StatelessWidget {
  const SvgIconNetworkHelper({
    required this.iconPath,
    required this.color,
    this.height = 20,
    Key? key,
    this.width = 15,
    this.fit = BoxFit.contain,
  }) : super(key: key);
  final String iconPath;
  final double height;
  final double width;
  final Color color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      iconPath,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: height,
      width: width,
      fit: fit,
    );
  }
}
