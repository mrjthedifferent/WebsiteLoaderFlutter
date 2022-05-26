import 'package:flutter/material.dart';

import '../widgets/webview.dart';

class SecondPage extends StatelessWidget {
  final String title;
  final String url;

  const SecondPage({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: WebViewApp(url: url),
    );
  }
}
