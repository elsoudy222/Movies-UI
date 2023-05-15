import 'dart:ui';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../model/movies_model.dart';

import 'package:flutter/material.dart';
import 'package:movies_ui/core/components/search_field_widget.dart';
import 'package:movies_ui/core/const/constants.dart';

import '../../core/components/masked_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppConstants.kBlackColor,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
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
              Positioned(
                top: screenHeight * 0.4,
                right: -88,
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
              SafeArea(
                bottom: false,
                child: ListView(
                  primary: true,
                  children:  [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "What would you\nlike to watch?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: AppConstants.kWhiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SearchFieldWidget(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Popular Movies',
                        style: TextStyle(
                          color: AppConstants.kWhiteColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newMovies.length,
                        itemBuilder: (context, i) {
                          String? mask;
                          if (i == 0) {
                            mask = AppConstants.kMaskFirstIndex;
                          } else if (i == newMovies.length - 1) {
                            mask = AppConstants.kMaskLastIndex;
                          } else {
                            mask = AppConstants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: newMovies[i].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 39,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                          color: AppConstants.kWhiteColor,
                          fontSize: 20,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, i) {
                          String? mask;
                          if (i == 0) {
                            mask = AppConstants.kMaskFirstIndex;
                          } else if (i == newMovies.length - 1) {
                            mask = AppConstants.kMaskLastIndex;
                          } else {
                            mask = AppConstants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20.0),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[i].moviePoster,
                                mask: mask,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppConstants.kPinkColor.withOpacity(0.2),
                AppConstants.kGreenColor.withOpacity(0.2)
              ],
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppConstants.kPinkColor,
                  AppConstants.kGreenColor,
                ],
              ),
            ),
            child: RawMaterialButton(
              onPressed: () {},
              shape: const CircleBorder(),
              fillColor:const Color(0xff404c57) ,
              child: SvgPicture.asset(AppConstants.kIconPlus),

            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: GlassmorphicContainer(
            width: screenWidth,
            height: 70,
            borderRadius:0,
            linearGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppConstants.kWhiteColor.withOpacity(0.1),
                AppConstants.kWhiteColor.withOpacity(0.1),
              ],
            ),
            border: 0,
            blur: 30,
            borderGradient:const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppConstants.kPinkColor,
                AppConstants.kGreenColor,
              ],
            ) ,

            child:BottomAppBar(
              color: Colors.transparent,
              notchMargin: 4,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppConstants.kIconHome,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppConstants.kIconPlayOnTv,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(''),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppConstants.kIconCategories,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppConstants.kIconDownload,
                      ),
                    ),
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
}
