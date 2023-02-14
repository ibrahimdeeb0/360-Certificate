import '../../general_exports.dart';

class SortCertificate extends StatelessWidget {
  const SortCertificate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: Get.arguments[keyTitle] ?? '',
        withShadow: false,
      ),
      body: GetBuilder<SortCertificateController>(
        init: SortCertificateController(),
        builder: (SortCertificateController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonContainer(
                    width: 1,
                    height: 0.015,
                    borderRadius: 0.1,
                    backgroundColor: Get.arguments[keyColor] ?? Colors.grey,
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  SortCertificateCard(
                    onPress: () => Get.toNamed(routeCertificateDetails),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
