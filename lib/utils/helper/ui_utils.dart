import 'dart:io';

import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/default_pop_up/default_pop_up.dart';
import '../../general_exports.dart';

void hideKeyboard() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}

dynamic isTablet(dynamic tabletValue, dynamic mobileValue) {
  if (DEVICE_WIDTH > 600) {
    return tabletValue;
  } else {
    return mobileValue;
  }
}

int setColor(String? color) {
  if (color == null || color.isEmpty) {
    return AppColors.white;
  }
  final String stringColor = '0xFF${color.replaceAll('#', '')}';
  final int newColor = int.parse(stringColor);
  return newColor;
}

Widget getMyIcon({
  String? icon,
  bool withPlaceHolder = true,
  dynamic height,
  dynamic width,
  int? color,
}) {
  return icon == null
      ? const Center()
      : icon.startsWith('http')
          ? icon.toString().contains('svg')
              ? SvgPicture.network(
                  icon,
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                  color: color == null ? null : Color(color),
                )
              : CachedImage(
                  image: icon,
                  withPlaceHolder: withPlaceHolder,
                  height: height,
                  width: width,
                )
          : icon.toString().contains('svg')
              ? SvgPicture.asset(
                  icon,
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                  color: color == null ? null : Color(color),
                )
              : Image.asset(
                  icon,
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                  color: color == null ? null : Color(color),
                );
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    final String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    consoleLog(googleUrl);
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(
        Uri.parse(googleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not open the map.';
    }
  }
}

Future<dynamic> showLoginRequest() {
  return Get.bottomSheet(
    DefaultPopUp(
      okButtonSettings: ButtonSettings(
        title: 'transLogin'.tr,
        onPress: () {
          Get.back();
          Get.toNamed(routeLogin);
        },
      ),
    ),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
  );
}

void openPopUp(Widget? widget) {
  Get.bottomSheet(
    widget!,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
  );
}

Future<String> onPressDownloadPdf(
    {required String htmlContent, required String pdfTitle}) async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;

  await FlutterHtmlToPdf.convertFromHtmlContent(
    htmlContent,
    appDocPath,
    pdfTitle,
  );

  dismissLoading();

  // Get.back();

  return '$appDocPath/$pdfTitle.pdf';
}
