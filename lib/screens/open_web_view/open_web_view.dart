import '../../general_exports.dart';

class OpenWebView extends StatelessWidget {
  const OpenWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: GetBuilder<OpenWebViewController>(
        init: OpenWebViewController(),
        builder: (OpenWebViewController controller) {
          return const Center(child: CommonText('OpenWebView Screen'));
        },
      ),
    );
  }
}
