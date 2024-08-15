import 'package:flutter/material.dart';
import 'package:food_app/constant.dart';
import 'package:food_app/screen_widgets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            itemCount: 3,
            controller: pageController, // Use the initialized PageController
            itemBuilder: (context, index) {
              return ScreenWidgets(
                index: index, // Pass index here instead of pageIndex
              );
            },
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: size.height * 0.20,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == index
                              ? Colors.red
                              : Colors
                                  .grey, // Indicator color based on pageIndex
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: size.width - 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: bgColor),
                      onPressed: pageIndex == 2
                          ? () {
                              // Final action on the last page
                            }
                          : () {
                              pageController.nextPage(
                                duration: Duration(
                                    milliseconds: 600), // Fixed duration
                                curve: Curves.easeIn,
                              );
                            },
                      child: Text(
                        pageIndex == 2 ? "proceed" : 'NEXT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
