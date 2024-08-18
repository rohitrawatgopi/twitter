import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twitter2/design/widgets/logo.dart';
import 'package:twitter2/feature/auth/ui/authentication_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLast = false;

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 139, 179, 248),
      body: Stack(children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              isLast = value == 1;
            });
          },
          children: [
            Image.asset(
              "assets/first.png",
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: LogoImage()),
                Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "See what's\n happening in the world right now.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 44,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AuthScreen(isLogin: false)));
                    },
                    child: Text("get started"))
              ],
            )
          ],
        ),
        isLast
            ? const SizedBox()
            : TextButton(
                onPressed: () {
                  pageController.animateToPage(1,
                      duration: const Duration(seconds: 2),
                      curve: Curves.linear);
                },
                child: const Text(
                  'skip',
                  style: TextStyle(fontSize: 20),
                )),
        Align(
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: pageController,
            count: 2,
            effect: const JumpingDotEffect(),
          ),
        )
      ]),
    );
  }
}
