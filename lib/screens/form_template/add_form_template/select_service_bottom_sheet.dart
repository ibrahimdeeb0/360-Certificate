import '../../../general_exports.dart';

// class SelectServiceBT extends StatelessWidget {
//   const SelectServiceBT({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddFormTemplateController>(
//       init: AddFormTemplateController(),
//       builder: (AddFormTemplateController controller) {
//         return SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               ...controller.allServices.map(
//                 (dynamic serviceItem) => ListTile(
//                   onTap: () => controller.toggleRadioService(
//                     controller.allServices.indexOf(serviceItem),
//                   ),
//                   title: CommonText(
//                     text: serviceItem['name'],
//                     style: appTextStyles.h3Style().copyWith(
//                           fontColor: !controller.listIndexService.contains(
//                             controller.allServices.indexOf(serviceItem),
//                           )
//                               ? AppColors.colorBlack
//                               : AppColors.primary,
//                           rowMainAxisSize: MainAxisSize.max,
//                         ),
//                   ),
//                   trailing: !controller.listIndexService
//                           .contains(controller.allServices.indexOf(serviceItem))
//                       ? const Icon(Icons.radio_button_off_outlined)
//                       : Icon(
//                           Icons.radio_button_checked,
//                           color: Color(AppColors.primary),
//                         ),
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class SelectFormBT extends StatelessWidget {
  const SelectFormBT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddFormTemplateController>(
      init: AddFormTemplateController(),
      builder: (AddFormTemplateController controller) {
        return BottomSheetContainer(
          title: 'Select Form',
          responsiveContent: true,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.03),
                ...controller.serviceListForms!.map(
                  (dynamic formItem) => ListTile(
                    onTap: () {
                      controller.toggleRadioForm(
                        controller.serviceListForms!.indexOf(formItem),
                      );
                      controller.update();
                    },
                    title: CommonText(
                      formItem['name'],
                      style: appTextStyles.h3Style().copyWith(
                            fontColor: !controller.listIndexForm.contains(
                              controller.serviceListForms!.indexOf(formItem),
                            )
                                ? AppColors.colorBlack
                                : AppColors.primary,
                            rowMainAxisSize: MainAxisSize.max,
                          ),
                      containerStyle: const CommonContainerModel(
                          alignment: AlignmentDirectional.topStart),
                    ),
                    trailing: !controller.listIndexForm.contains(
                            controller.serviceListForms!.indexOf(formItem))
                        ? const Icon(Icons.radio_button_off_outlined)
                        : Icon(
                            Icons.radio_button_checked,
                            color: Color(AppColors.primary),
                          ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }
}
