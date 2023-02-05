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
  GetPage<CreateCustomer>(
    name: routeCreateCustomer,
    page: () => const CreateCustomer(),
    transition: Transition.downToUp,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage<Invoices>(
    name: routeInvoices,
    page: () => const Invoices(),
  ),
GetPage<Customers>(
  name: routeCustomers,
   page: () => const Customers(),
 ), 
GetPage<FormTemplates>(
  name: routeFormTemplates,
   page: () => const FormTemplates(),
 ), 
GetPage<MySettings>(
  name: routeMySettings,
   page: () => const MySettings(),
 ), 
GetPage<MySubscription>(
  name: routeMySubscription,
   page: () => const MySubscription(),
 ), 
GetPage<Search>(
  name: routeSearch,
   page: () => const Search(),
 ), 
];
