import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:website_loader/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../pages/home_page.dart';
import '../utils/const.dart';

class WebViewApp extends StatefulWidget {
  final String? url;

  const WebViewApp({Key? key, this.url}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url ?? kWebUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.endsWith('#')) {
          Utils.snackBar(context, 'Invalid URL');
          return NavigationDecision.prevent;
        }
        if (request.url.startsWith(kWebUrl)) {
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
      },
      onPageStarted: (String url) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      onPageFinished: (String url) {
        Navigator.of(context).pop();
      },
      onWebResourceError: (WebResourceError error) {
        Navigator.popAndPushNamed(context, MyHomePage.routeName);
      },
    );
  }
}
