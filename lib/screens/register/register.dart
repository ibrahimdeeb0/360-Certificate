import '../../general_exports.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: '',
      ),
      body: GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (RegisterController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    'Create a new account',
                    fontWeight: FontWeight.bold,
                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                    fontSize: 28,
                    fontColor: AppColors.black3,
                    containerStyle: const CommonContainerModel(
                      width: 1,
                      marginBottom: 0.02,
                    ),
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'First Name',
                    ),
                    hint: 'Enter Your First Name',
                    marginBottom: 0.02,
                    controller: controller.firstNameController,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Last Name',
                    ),
                    hint: 'Enter Your Last Name',
                    marginBottom: 0.02,
                    controller: controller.lastNameController,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Enter Your Email address',
                    ),
                    hint: 'Email address',
                    marginBottom: 0.02,
                    controller: controller.emailController,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Phone Number',
                    ),
                    hint: '000 000 000',
                    controller: controller.phoneController,
                    prefix: const CommonText(
                      '+44',
                      marginHorizontal: 0.03,
                    ),
                    marginBottom: 0.02,
                  ),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Business Type',
                    ),
                    hint: 'Select Your Business Type',
                    marginBottom: 0.02,
                    suffix: const Icon(Icons.keyboard_arrow_down),
                    enabled: false,
                    onTap: () => Get.bottomSheet(
                      const SelectBusinessType(),
                      isScrollControlled: true,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ...controller.selectedBusinessType.map(
                          (Map<String, dynamic> item) => ChoiceContainer(
                            text: item[keyName],
                            onPressDelete: () =>
                                controller.onSelectTempBusinessType(item),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (controller.selectedBusinessType.isNotEmpty)
                    SizedBox(height: DEVICE_HEIGHT * 0.01),
                  CommonInput(
                    topLabel: const TopLabelText(
                      text: 'Password',
                    ),
                    hint: 'Enter Your Password',
                    marginBottom: 0.02,
                    controller: controller.passwordController,
                    obscureText: controller.isVisibility,
                    suffix: CommonContainer(
                      onPress: () => controller.visibility(),
                      child: Icon(
                        controller.isVisibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  CommonButton(
                    onPress: controller.onRegister,
                    enabled: controller.registerValidator(),
                    text: 'Create Account',
                    marginBottom: 0.02,
                    marginTop: 0.02,
                  ),
                  CommonText(
                    'Already have account',
                    marginRight: 0.025,
                    containerStyle: const CommonContainerModel(
                      marginBottom: 0.03,
                    ),
                    rightChild: CommonText(
                      'Login',
                      fontWeight: FontWeight.bold,
                      fontColor: AppColors.primary,
                      onPress: () => Get.back(),
                      containerStyle: CommonContainerModel(
                        touchEffect: TouchableEffect(type: TouchTypes.opacity),
                      ),
                    ),
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

class CustomSelectCheckbox extends StatelessWidget {
  const CustomSelectCheckbox({
    super.key,
    this.title,
    this.isSelected = false,
    this.onPress,
    this.wihBottomBorder = true,
  });
  final String? title;
  final bool isSelected;
  final Function? onPress;
  final bool wihBottomBorder;

  @override
  Widget build(BuildContext context) {
    return CommonText(
      title ?? 'test',
      fontColor: isSelected ? AppColors.primary : Colors.grey[700],
      onPress: onPress,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      textAlign: TextAlign.start,
      inlineSpans: const <InlineSpan>[],
      rightChild: isSelected
          ? Icon(
              Icons.check_box_rounded,
              color: Color(AppColors.primary),
            )
          : Icon(
              Icons.check_box_outline_blank_rounded,
              color: Colors.grey[700],
            ),
      containerStyle: CommonContainerModel(
        width: 1,
        paddingBottom: 0.015,
        marginBottom: 0.015,
        borderBottomWidth: wihBottomBorder ? 2 : 0,
        borderBottomColor: isSelected
            ? Color(AppColors.primary).withOpacity(0.2)
            : Colors.grey[200],
      ),
    );
  }
}

class SelectBusinessType extends StatelessWidget {
  const SelectBusinessType({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (RegisterController controller) {
        return BottomSheetContainer(
          title: 'Select Business Type',
          responsiveContent: true,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: DEVICE_HEIGHT * 0.035),
                ...controller.allBusinessType.map(
                  (dynamic item) => CustomSelectCheckbox(
                    title: item[keyName],
                    onPress: () => controller.onSelectTempBusinessType(item),
                    isSelected: controller.selectedTempBusinessType
                        .where((Map<String, dynamic> element) =>
                            element['id'] == item['id'])
                        .isNotEmpty,
                  ),
                ),
                SizedBox(height: DEVICE_HEIGHT * 0.02),
                CommonButton(
                  onPress: controller.onSelectBusinessType,
                  text: 'Confirm',
                  marginBottom: 0.02,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}