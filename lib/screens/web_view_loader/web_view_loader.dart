// import 'package:webview_flutter/webview_flutter.dart';

import '../../general_exports.dart';

class WebViewLoader extends StatefulWidget {
  const WebViewLoader({super.key});

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewLoader> {
  // bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View'),
      ),
      body: const Stack(),
    );
  }
}
