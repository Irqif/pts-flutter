import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Center(child: Image.asset('assets/img/undraw_Hiking_re_k0bc.png'),),
            ),
            Center(
              child: Text("Version 1.1.0"),
            )
          ],
        ),
      ),
    );
  }
}