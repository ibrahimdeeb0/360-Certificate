import '../../general_exports.dart';

class FormTemplates extends StatelessWidget {
  const FormTemplates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: GetBuilder<FormTemplatesController>(
        init: FormTemplatesController(),
        builder: (FormTemplatesController controller) {
          return const Center(child: CommonText('FormTemplates Screen'));
        },
      ),
    );
  }
}
