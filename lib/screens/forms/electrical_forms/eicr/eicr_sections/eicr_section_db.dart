// import '../../../../general_exports.dart';

// class EICRSectionDB extends StatelessWidget {
//   const EICRSectionDB({required this.controller, super.key});
//   final EicrController controller;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<DistributionBoardController>(
//       init: DistributionBoardController(),
//       builder: (DistributionBoardController dbController) {
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: DEVICE_WIDTH * 0.03),
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: DEVICE_HEIGHT * 0.02),
//               CommonText(
//                 text: 'Distribution Boards',
//                 leftChild: CommonText(
//                   text: 'Part 10.  ',
//                   style: appTextStyles.h3StyleBlack().copyWith(
//                         fontSize: 18.0,
//                         fontFamily: fontBold,
//                       ),
//                 ),
//                 style: appTextStyles.h2StyleBlack().copyWith(
//                       fontWeight: FontWeight.w500,
//                       rowMainAxisSize: MainAxisSize.max,
//                       textAlign: TextAlign.start,
//                       rowMainAxisAlignment: MainAxisAlignment.start,
//                     ),
//                 containerStyle: CommonContainerModel(
//                   borderRadius: 0.015,
//                   marginBottom: 0.0,
//                   paddingVertical: 0.006,
//                 ),
//               ),
//               ...dbController.distrBoardDataBase.map(
//                 (dynamic dbData) => CircuitDetailsContainer(
//                   showDeleteIcon:
//                       !(dbController.distrBoardDataBase.length == 1),
//                   onPressDelete: () =>
//                       dbController.onDeleteParentDbValues(dbData),
//                   dbName: dbData[parentDistributionBoardValues][formKeyDBRef],
//                   locationName:
//                       'Location: ${dbData[parentDistributionBoardValues][formKeyBoardLocation]}',
//                   zsName:
//                       'Zs: ${dbData[parentDistributionBoardValues][formKeyZsAtThisBoard]}',
//                   ipfName:
//                       'Ipf: ${dbData[parentDistributionBoardValues][formKeyBoardIpfBoard]}',
//                   onPressDBContainer: () {
//                     dbController.selectedParentDistrBoardData = dbData;
//                     dbController.setParentValues();
//                     Get.to(
//                       () => const DistributionBoardScreen(),
//                       transition: Transition.rightToLeftWithFade,
//                     );
//                     consoleLogPretty(dbData);
//                   },
//                 ),
//               ),
//               CommonButton(
//                 onPress: () {
//                   dbController.resetParentValues();
//                   dbController.resetChildValues();
//                   dbController.onCrateParentDbData();
//                   consoleLogPretty(dbController.distrBoardDataBase);
//                 },
//                 buttonStyle: appButtonStyles.addButtonStyle().copyWith(
//                       containerStyle: CommonContainerModel(
//                         width: 1,
//                         height: 0.05,
//                         marginVertical: 0.02,
//                       ),
//                     ),
//                 child: CommonText(
//                   text: 'Add New Distribution Board',
//                   style: appTextStyles.h3MediumStyleWhite(),
//                   leftChild: Padding(
//                     padding: EdgeInsets.only(right: DEVICE_WIDTH * 0.015),
//                     child: const Icon(Icons.add_circle_outline_outlined),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
