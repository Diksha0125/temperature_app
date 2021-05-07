import 'package:flutter/material.dart';
import 'package:temperature_fetch_app/custom_messages.dart';
import 'package:temperature_fetch_app/splash/view/logo.dart';
import 'package:temperature_fetch_app/styles.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: 30),
            Text(
              CustomMessages.demoApp,
              style: DemoTextStyle.heading,
            )
          ],
        ),
      ),
    );
  }
}
