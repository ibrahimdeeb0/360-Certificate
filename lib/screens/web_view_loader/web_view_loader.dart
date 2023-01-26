import '../../general_exports.dart';

class WebViewLoader extends StatelessWidget {
  const WebViewLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WebViewLoaderController>(
        init: WebViewLoaderController(),
        builder: (WebViewLoaderController controller) {
          return const Center(child: CommonText('WebViewLoader Screen'));
        },
      ),
    );
  }
}
