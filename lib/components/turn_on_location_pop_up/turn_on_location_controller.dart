// import 'dart:async';

// import 'package:location/location.dart';

// import '../../general_exports.dart';

// class TurnOnLocationController extends GetxController {
//   TurnOnLocationController({this.onChangeLocation});
//   Location location = Location();

//   Function? onChangeLocation;
//   // ignore: cancel_subscriptions
//   StreamSubscription<LocationData>? _locationSubscription;
//   final LocalStorage localStorage = LocalStorage();
//   bool isDone = false;

//   @override
//   void onInit() {
//     super.onInit();
//     _locationSubscription =
//         location.onLocationChanged.listen((LocationData currentLocation) {
//       consoleLog('insideListener');
//       if (currentLocation.latitude != null && isDone == false) {
//         isDone = true;
//         startLoading();
//         onChangeLocation?.call();
//         Timer(
//           const Duration(
//             seconds: 1,
//           ),
//           () {
//             dismissLoading();
//             Get.back();
//           },
//         );
//       }
//     });
//   }

//   Future<void> onPressDoNotShowAgain() async {
//     await localStorage.saveToStorage(
//         key: storeLocationPermission, value: false);
//     Get.back();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//     _locationSubscription!.cancel();
//   }
// }
