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

final MyAppController myAppController = Get.find<MyAppController>();
final HomeBottomBarController homeBottomBarController =
    Get.put(HomeBottomBarController());
final HomeController homeController = Get.put(HomeController());
final ProfileController profileController = Get.put(ProfileController());
final SplashController splashController = Get.put(SplashController());
final AppLanguageController languageController =
    Get.put(AppLanguageController());
final MoreController moreController = Get.put(MoreController());
final CertificatesController certificatesController =
    Get.put(CertificatesController());

final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(Get.find<AppLanguageController>().appLocale),
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
            ],
          ),
        );
      },

      themeMode: ThemeMode.light,

      theme: ThemeData(
        fontFamily: 'Careem',
        primaryColor: Color(AppColors.primary),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(elevation: 0.0),
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
