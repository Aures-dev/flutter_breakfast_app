import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  // Controller pour gérer le PageView
  final PageController _controller = PageController();

  // Indique si on est sur la dernière page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView avec les slides
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2); // 3 slides (index 0,1,2)
              });
            },
            children: [
              // Slide 1
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/slider1.jpg'),
                    const SizedBox(height: 30),
                    const Text(
                      'Welcome on BrekFast App !',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Discover diets that fits your needs',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // Slide 2
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/slider2.jpg'),
                    const SizedBox(height: 30),
                    const Text(
                      'All meal categories !',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Browse through various categories',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // Slide 3
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/slider1.jpg'),
                    const SizedBox(height: 30),
                    const Text(
                      'Get the life you deserve !',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Your favorite food right in your hand by anythime.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Indicateurs de progression (en bas)
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Colors.green,
                dotColor: Color.fromARGB(255, 214, 211, 211),
              ),
            ),
          ),

          // Bouton Suivant/Commencer (en bas à droite)
          Container(
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Bouton suivant
                onLastPage
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightGreen,
                            fixedSize: Size.fromWidth(150)),
                        child: const Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Bold',
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.green,
                        ),
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
