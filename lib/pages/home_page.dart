import 'package:flutter/material.dart';
import 'package:website_loader/pages/second_page.dart';
import 'package:website_loader/widgets/webview.dart';

import '../utils/check_connection.dart';
import '../utils/const.dart';
import '../widgets/error.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/logo.png", height: 40),
      ),
      body: isConnectedToInternet ? const WebViewApp() : const MyErrorWidget(),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset("assets/logo.png", height: 100),
            ),
            generateMenuList(
              context,
              "Home",
              kWebUrl,
            ),
            ExpansionTile(
              title: const Text("About"),
              children: [
                generateMenuList(
                  context,
                  "The Company",
                  "${kWebUrl}about/",
                ),
                generateMenuList(
                  context,
                  "Message from CEO",
                  "${kWebUrl}message-from-ceo/",
                ),
              ],
            ),
            generateMenuList(
              context,
              "Our Services",
              "${kWebUrl}our-services/",
            ),
            generateMenuList(
              context,
              "Blog",
              "${kWebUrl}blog/",
            ),
            generateMenuList(
              context,
              "Career",
              "${kWebUrl}career/",
            ),
            generateMenuList(
              context,
              "Contact Us",
              "${kWebUrl}contact-us/",
            ),
          ],
        ),
      ),
    );
  }

  Widget generateMenuList(BuildContext context, String title, String url) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(title: title, url: url),
          ),
        );
      },
    );
  }
}
