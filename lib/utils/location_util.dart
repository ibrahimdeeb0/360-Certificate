// import 'package:location/location.dart';

// import '../general_exports.dart';

// LocationData? currentLocationData;

// /// get current location
// Future<LocationData?> getCurrentLocation({
//   bool withDialog = false,
//   TurnOnLocationController? turnOnLocationController,
// }) async {
//   final Location location = Location();
//   final LocalStorage localStorage = LocalStorage();
//   LocationData? locationData;
//   final bool? canAskPermission =
//       await localStorage.getFromStorage(key: storeLocationPermission) ?? false;

//   bool serviceEnabled;
//   PermissionStatus permissionGranted;

//   serviceEnabled = await location.serviceEnabled();
//   if (!serviceEnabled) {
//     try {
//       if (withDialog && (canAskPermission == null || canAskPermission)) {
//         turnOnLocationRequest(
//           enableService: true,
//           turnOnLocationController: turnOnLocationController,
//         );
//       }
//     } catch (e) {
//       consoleLog(e, key: 'LOCATION ERRORs');
//     }

//     if (!serviceEnabled) {
//       return null;
//     }
//   }

//   permissionGranted = await location.hasPermission();
//   consoleLog(permissionGranted, key: 'permissionGranted');
//   if (permissionGranted == PermissionStatus.denied) {
//     permissionGranted = await location.requestPermission();
//     if (permissionGranted != PermissionStatus.granted &&
//         permissionGranted != PermissionStatus.grantedLimited) {
//       if (withDialog && (canAskPermission == null || canAskPermission)) {
//         turnOnLocationRequest(
//           turnOnLocationController: turnOnLocationController,
//         );
//       }
//       return null;
//     }
//   }

//   locationData = await location.getLocation();
//   return locationData;
// }


// // openMap(double latitude, double longitude) async {
// //   String googleUrl =
// //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
// //   if (await canLaunch(googleUrl)) {
// //     await launchUrl(Uri.parse(googleUrl);
// //   } else {
// //     throw 'Could not open the map.';
// //   }
// // }
