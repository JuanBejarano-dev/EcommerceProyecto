import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // provider si la sesion existe
      final result = false;
      if (result) {
        Navigator.of(context).pushNamedAndRemoveUntil("/layout", (_) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil("/welcome", (_) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://flutter.dev/assets/dashatar-dash.adf03c5e3c90d4e867f7116a3a331ba1.png",
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
