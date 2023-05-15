import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_ui/core/components/custom_outline.dart';
import 'package:movies_ui/core/components/masked_image.dart';
import 'package:movies_ui/core/const/constants.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppConstants.kBlackColor,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  color: AppConstants.kPinkColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    height: 166,
                    width: 166,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -88,
              child: Container(
                height: 176,
                width: 176,
                decoration: const BoxDecoration(
                  color: AppConstants.kGreenColor,
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    height: 176,
                    width: 176,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * 0.8,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppConstants.kPinkColor,
                          AppConstants.kPinkColor.withOpacity(0),
                          AppConstants.kGreenColor.withOpacity(0.1),
                          AppConstants.kGreenColor,
                        ],
                        stops: const [0.2, 0.4, 0.6, 1],
                      ),
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.4,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/img-onboarding.png",
                            ),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.09,
                    ),
                    Text(
                      "Watch Movies in\n Virtual Reality",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight <= 660 ? 18 : 34,
                        fontWeight: FontWeight.w700,
                        color: AppConstants.kWhiteColor.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      "Download and watch offline\n Wherever you are",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight <= 660 ? 12 : 16,
                        fontWeight: FontWeight.w100,
                        color: AppConstants.kWhiteColor.withOpacity(0.75),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    CustomOutline(
                      strokeWidth: 3,
                      radius: 20,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppConstants.kPinkColor,
                          AppConstants.kGreenColor,
                        ],
                      ),
                      width: 160,
                      height: 38,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppConstants.kPinkColor.withOpacity(0.2),
                                AppConstants.kGreenColor.withOpacity(0.2),
                              ],
                            )),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: screenHeight <= 660 ? 11 : 14,
                              fontWeight: FontWeight.w700,
                              color: AppConstants.kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Container(
                            height: 7,
                            width: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == 0
                                  ? AppConstants.kGreenColor
                                  : index == 1
                                      ? AppConstants.kWhiteColor
                                          .withOpacity(0.2)
                                      : AppConstants.kWhiteColor
                                          .withOpacity(0.2),
                            ),
                          );
                        })),
                    SizedBox(
                      height: screenHeight * 0.03,
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
