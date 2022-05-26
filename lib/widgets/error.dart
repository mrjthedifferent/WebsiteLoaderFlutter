import 'package:flutter/material.dart';
import 'package:website_loader/pages/splash_page.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Something went wrong! Check your internet connection.'),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Try again'),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, SplashPage.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
