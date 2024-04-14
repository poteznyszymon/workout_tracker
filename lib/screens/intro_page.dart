import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workout_log/consts/colors.dart';
import 'package:workout_log/screens/intro_pages/intro_page_three.dart';
import 'package:workout_log/screens/intro_pages/intro_page_two.dart';
import 'intro_pages/intro_page_one.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: const [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: ElevatedButton(
                onPressed: onLastPage
                    ? () {
                        Navigator.pushNamed(context, '/home_page');
                      }
                    : () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height / 15),
                  elevation: 0,
                  backgroundColor: white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(16),
                  ),
                ),
                child: Text(
                  onLastPage ? 'Done' : 'Continue',
                  style: GoogleFonts.inter(
                    color: purple,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              alignment: const Alignment(0.8, -0.83),
              child: Text(
                'Skip',
                style: GoogleFonts.inter(
                    color: white, fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            onTap: () {
              _controller.jumpToPage(2);
            },
          ),
          Container(
            alignment: const Alignment(0, 0.77),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                dotColor: white,
                activeDotColor: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
