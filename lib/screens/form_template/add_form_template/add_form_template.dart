// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../general_exports.dart';

class AddFormTemplate extends StatelessWidget {
  const AddFormTemplate({
    Key? key,
    this.controller,
  }) : super(key: key);

  final AddFormTemplateController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(
        title: 'Add new Form Template',
      ),
      body: GetBuilder<AddFormTemplateController>(
        init: controller ?? AddFormTemplateController(),
        builder: (AddFormTemplateController controller) {
          return CommonContainer(
            width: 1,
            height: 1,
            paddingHorizontal: 0.04,
            paddingTop: 0.03,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  child: Column(
                    children: <Widget>[
                      CommonInput(
                        topLabelText: 'Template Name',
                        hint: 'type template name',
                        controller: controller.templateController,
                        onChanged: controller.inputOnChange,
                        marginBottom: 0.015,
                      ),
                      CommonInput(
                        enabled: false,
                        onTap: () => Get.bottomSheet(
                          elevation: 0.0,
                          const SelectFormBT(),
                          isScrollControlled: true,
                        ),
                        topLabelText: 'Template for this Form',
                        value: controller.selectedForm?['name'],
                        hint: 'Select Form',
                        suffix: const Icon(Icons.keyboard_arrow_down_outlined),
                      ),
                    ],
                  ),
                ),
                CommonButton(
                  enabled: controller.isEnable,
                  onPress: controller.onCreate,
                  text: 'Next',
                  marginBottom: 0.02,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
