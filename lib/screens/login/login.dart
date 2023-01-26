import '../../general_exports.dart';

enum LoginTypes {
  phone,
  car,
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: '',
        withShadow: false,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) {
          return CommonContainer(
            paddingHorizontal: 0.04,
            paddingTop: 0.02,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CommonText(
                  Get.arguments?[keyType] == LoginTypes.car
                      ? 'enter_car_number'.tr
                      : 'enter_mobile_number'.tr,
                  fontSize: fontH1,
                ),
                CommonText(
                  Get.arguments?[keyType] == LoginTypes.car
                      ? 'we_will_send_'.tr
                      : 'we_will_send'.tr,
                  marginTop: 0.01,
                  textAlign: TextAlign.start,
                  fontColor: Colors.black87,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CommonInput(
                    hint: '00-000-000',
                    prefix: Get.arguments?[keyType] == LoginTypes.car
                        ? null
                        : const CommonText(
                            '05',
                            fontWeight: FontWeight.w600,
                          ),
                    marginVertical: 0.04,
                    maxLength: 10,
                    contentPaddingHorizontal: 0.03,
                    controller: controller.inputController,
                    onChanged: controller.onChangeInputValue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CommonButton(
                    enabled: controller.isButtonEnable,
                    onPress: controller.onSendVerifyLogin,
                    child: CommonText(
                      'next'.tr,
                      fontColor: controller.isButtonEnable
                          ? Colors.white
                          : Colors.black,
                      rowCrossAxisAlignment: CrossAxisAlignment.center,
                      marginHorizontal: 0.01,
                      leftChild: Icon(
                        Icons.arrow_back_sharp,
                        color: controller.isButtonEnable
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
