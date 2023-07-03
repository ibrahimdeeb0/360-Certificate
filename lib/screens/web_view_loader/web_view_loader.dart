import 'package:webview_flutter/webview_flutter.dart';

import '../../general_exports.dart';

class WebViewLoader extends StatefulWidget {
  const WebViewLoader({super.key});

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewLoader> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://360connect.app/cert_app/plans',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (String value) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            CommonContainer(
              style: appContainerStyles.containerStyles,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(AppColors.primary),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
