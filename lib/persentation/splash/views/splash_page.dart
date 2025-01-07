import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constant/Images/app_images.dart';
import 'package:news_app/persentation/auth/signin_page.dart';
import 'package:news_app/persentation/bottomnav/bottom_nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  splashSetup() {
    Future.delayed(
        const Duration(seconds: 2),
        () => {
              Navigator.pushReplacement(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(builder: (context) {
                  return StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return const BottomNav();
                      } else {
                        return const SignInPage();
                      }
                    },
                  );
                }),
              )
            });
  }

  @override
  void initState() {
    splashSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.appLogo),
      ),
    );
  }
}
