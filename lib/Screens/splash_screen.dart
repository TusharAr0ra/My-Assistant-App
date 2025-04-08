import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../helper/pref.dart';
import '../Screens/onboarding_screen.dart';
import '../helper/global.dart';
import './home_screen.dart';
import '../widgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //wait for some time on splash and then move to home screen
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => Pref.showOnboarding
                ? const HomeScreen()
                : const OnboardingScreen(),
          ),
        );
        // onboarding screen ek hi baar dikhani hai, homepage ke init mei ise false kr denge.
        // or iska getter setter toh pref wale mei hi hai.

        // Get.off(
        //   () => Pref.showOnboarding
        //       ? const HomeScreen()
        //       : const OnboardingScreen(),
        // );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //initialising device size
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset('assets/images/logo.png',
                    width: mq.width * 0.4),
              ),
            ),
            const Spacer(), //to add space between two things
            const CustomLoading(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
