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
