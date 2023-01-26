import '../../general_exports.dart';

class Language extends StatelessWidget {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (LanguageController controller) {
          return const Center(child: CommonText('Language Screen'));
        },
      ),
    );
  }
}
