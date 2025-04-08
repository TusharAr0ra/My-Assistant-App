import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import './home_screen.dart';
import '../model/onboarding.dart';
import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pController = PageController();
    final list = [
      //onboarding1
      Onboard(
        title: 'Ask me anything',
        lottie: 'assets/lottie/ask_me.json',
        subtitle:
            'Hey! Got a question or need some help? I’m all ears and ready to assist.',
      ),
      //onboarding2
      Onboard(
        title: 'Search and Download Images',
        lottie: 'assets/lottie/play.json',
        subtitle:
            'Find the images you need and download them instantly—simple and straightforward!',
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: pController,
        itemCount: 2,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              //lottie
              Center(
                child: Lottie.asset(list[index].lottie,
                    height: mq.height * 0.5, width: mq.width * 0.85),
              ),

              //title
              Text(
                list[index].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5),
              ),

              SizedBox(height: mq.height * 0.01),

              //subtitle
              SizedBox(
                width: mq.width * 0.9,
                child: Text(
                  list[index].subtitle,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),

              //dots
              const Spacer(),

              Wrap(
                spacing: 8,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == index ? 15 : 10,

                    //mtlb ki jo dot hai uski width jonsa page select hoga uski width thori jyada hogi.
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == index ? Colors.blue : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              //button
              ElevatedButton(
                onPressed: () {
                  if (index != list.length - 1) {
                    //mtlb ki hum last page pr nhi hai; toh hume aage jana hai.
                    pController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  } else {
                    //last page pr pahuchne ke baad hume homescreen pr jana hai.

                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (_) => const HomeScreen(),
                    // ),
                    Get.off(() => const HomeScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(mq.width * 0.35, 50),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                child: Text(index == list.length - 1 ? "Finish" : "Next"),
                //last index pr finish show krega.
              ),
              const Spacer(flex: 3),
            ],
          );
        },
      ),
    );
  }
}
