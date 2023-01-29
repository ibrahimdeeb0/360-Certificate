import '../../general_exports.dart';

List<GetPage<dynamic>> appRoutes = <GetPage<dynamic>>[
  GetPage<SplashScreen>(
    name: routeSplash,
    page: () => const SplashScreen(),
  ),
  GetPage<Login>(
    name: routeLogin,
    page: () => const Login(),
  ),
  GetPage<HomeBottomBar>(
    name: routeHomeBottomBar,
    page: () => const HomeBottomBar(),
  ),
  GetPage<Home>(
    name: routeHome,
    page: () => const Home(),
  ),
  GetPage<CompleteProfile>(
    name: routeCompleteProfile,
    page: () => const CompleteProfile(),
  ),
  GetPage<Notifications>(
    name: routeNotifications,
    page: () => const Notifications(),
  ),
  GetPage<Profile>(
    name: routeProfile,
    page: () => const Profile(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage<EditProfile>(
    name: routeEditProfile,
    page: () => const EditProfile(),
  ),
  GetPage<Language>(
    name: routeLanguage,
    page: () => const Language(),
  ),
  GetPage<WebViewLoader>(
    name: routeWebViewLoader,
    page: () => const WebViewLoader(),
  ),
  GetPage<OTP>(
    name: routeOTP,
    page: () => const OTP(),
  ),
  GetPage<Forms>(
    name: routeForms,
    page: () => const Forms(),
  ),
];
