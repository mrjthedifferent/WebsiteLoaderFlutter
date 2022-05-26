import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/check_connection.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      checkConnection().then((isConnected) {
        isConnectedToInternet = isConnected;
        Navigator.of(context).pushReplacementNamed(MyHomePage.routeName);
      });
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
