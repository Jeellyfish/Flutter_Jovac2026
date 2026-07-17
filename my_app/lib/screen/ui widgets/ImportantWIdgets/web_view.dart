import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidgetDemo extends StatefulWidget {
  const WebViewWidgetDemo({super.key});

  @override
  State<WebViewWidgetDemo> createState() => _WebViewWidgetDemoState();
}

class _WebViewWidgetDemoState extends State<WebViewWidgetDemo> {
  late final WebViewController controller;
  @override
void initState() {
  super.initState();

  controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  loadHtml();

  // ..loadRequest(
  //   Uri.parse("https://google.com"),
  // );
}


Future<void> loadHtml() async {
    String html =
        await rootBundle.loadString("assets/html/index.html");

    controller.loadHtmlString(html);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView Example"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: WebViewWidget(controller: controller),
    );
  }
}