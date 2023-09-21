import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../general_exports.dart';
import '../../language/translation.dart';

DefaultButtonStyles appButtonStyles = DefaultButtonStyles();
DefaultTextInputStyles appTextInputStyles = DefaultTextInputStyles();
DefaultTextStyles appTextStyles = DefaultTextStyles();
DefaultContainerStyles appContainerStyles = DefaultContainerStyles();

final DefaultButtonStyles defaultButtonStyles = DefaultButtonStyles();
final DefaultTextInputStyles defaultTextInputStyles = DefaultTextInputStyles();
final DefaultTextStyles defaultTextStyles = DefaultTextStyles();
final DefaultContainerStyles defaultContainerStyles = DefaultContainerStyles();

MyAppController myAppController = Get.find<MyAppController>();
HomeBottomBarController homeBottomBarController =
    Get.put(HomeBottomBarController());
ProfileController profileController = Get.put(ProfileController());

HomeController homeController = Get.put(HomeController());
final SplashController splashController = Get.put(SplashController());
final AppLanguageController languageController =
    Get.put(AppLanguageController());
final MoreController moreController = Get.put(MoreController());
CertificatesController certificatesController =
    Get.put(CertificatesController());

final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: Locale(Get.find<AppLanguageController>().appLocale),
      locale: const Locale('en'),
      builder: (BuildContext context, Widget? child) {
        return ScrollConfiguration(
          behavior:
              MyScrollBehavior(), // This behavior disables the effect of the default scroll behavior.
          child: Stack(
            children: <Widget>[
              FlutterSmartDialog(child: child),
              const Positioned(
                top: 50,
                child: SizedBox(),
                // FloatingActionButton(
                //   onPressed: languageController.changeLanguage,
                // ),
              ),
              Positioned(
                top: DEVICE_HEIGHT * (Platform.isAndroid ? 0.04 : 0.05),
                right: DEVICE_HEIGHT * 0.02,
                child: GetBuilder<MyAppController>(
                  init: myAppController,
                  builder: (MyAppController controller) {
                    return GestureDetector(
                      onTap: controller.isConnectionAlertNotOpened
                          ? () => controller.onChangeValue()
                          : () {},
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        onEnd: controller.onEndAnimationInternet,
                        clipBehavior: Clip.hardEdge,
                        height: controller.isConnectionAlertNotOpened
                            ? DEVICE_HEIGHT * 0.022
                            : DEVICE_HEIGHT * 0.055,
                        width: controller.isInternetConnect
                            ? 0.0
                            : controller.isConnectionAlertNotOpened
                                ? DEVICE_WIDTH * 0.05
                                : DEVICE_WIDTH * 0.75,
                        margin: EdgeInsets.only(
                          right: controller.isConnectionAlertNotOpened
                              ? 0
                              : DEVICE_WIDTH * 0.07,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: controller.isConnectionAlertNotOpened
                              ? controller.isInternetConnect
                                  ? Colors.green
                                  : Colors.red
                              : const Color(0xFFE6E6E6),
                        ),
                        child: controller.isConnectionAlertNotOpened
                            ? SizedBox(
                                width: DEVICE_WIDTH * 0.04,
                                height: DEVICE_HEIGHT * 0.017,
                              )
                            : controller.showTextConnection
                                ? CommonText(
                                    controller.isInternetConnect
                                        ? 'Internet Connected '
                                        : 'You are not connected internet',
                                    fontFamily: fontFamilyType,
                                    rowMainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    rightChild: const SizedBox(),
                                    leftChild: Padding(
                                      padding: EdgeInsets.only(
                                        left: DEVICE_WIDTH * 0.03,
                                      ),
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            controller.isInternetConnect
                                                ? Colors.green
                                                : Colors.red,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },

      themeMode: ThemeMode.light,

      theme: ThemeData(
        fontFamily: 'Careem',
        primaryColor: Color(AppColors.primary),
        useMaterial3: true,
        // brightness: Brightness.dark,
        bottomSheetTheme: const BottomSheetThemeData(elevation: 0.0),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll<Color?>(
              Colors.grey[300],
            ),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll<Color?>(
              Colors.grey[300],
            ),
          ),
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll<Color?>(
              Colors.grey[300],
            ),
          ),
        ),
        dialogBackgroundColor: Colors.white,
      ),

      translations: Translation(),
      // we use the fallbackLocale to handel any error in language files and use the en as default language
      // fallbackLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: routeSplash,
      // initialRoute: routeWinchService,
      getPages: appRoutes,
    );
  }
}
