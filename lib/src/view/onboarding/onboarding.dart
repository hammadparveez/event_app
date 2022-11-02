import 'package:event_app/src/provider/onbaord_provider.dart';
import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:event_app/src/view/onboarding/components/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final images = [
    'assets/images/onboard_phone.png',
    'assets/images/onboard_calc.png',
    'assets/images/onboard_phone.png',
  ];

  final contents = [
    const OnBoardingContent(
        title: 'Explore Upcoming and Nearby Events',
        desc:
            'In publishing and graphic design, Lorem is a placeholder text commonly'),
    const OnBoardingContent(
        title: 'Web Have Modern Events Calendar Feature',
        desc:
            'In publishing and graphic design, Lorem is a placeholder text commonly'),
    const OnBoardingContent(
        title: 'To Look Up More Events or Activities Nearby By Map',
        desc:
            'In publishing and graphic design, Lorem is a placeholder text commonly'),
  ];

  @override
  void dispose() {
    OnBoardProvider.indicatorController.dispose();
    OnBoardProvider.imageSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    debugPrint('Size : ${MediaQuery.of(context).size}');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnBoardProvider.maxIndex,
                physics: const NeverScrollableScrollPhysics(),
                controller: OnBoardProvider.imageSlideController,
                itemBuilder: (_, index) => TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween<Offset>(
                        begin: const Offset(0, 1), end: const Offset(0, 0)),
                    builder: (context, value, child) {
                      return AnimatedSlide(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut,
                        offset: value,
                        child: Image.asset(images[index]),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: (height / 100) * 43.18,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 37),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                          controller: OnBoardProvider.indicatorController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: OnBoardProvider.maxIndex,
                          itemBuilder: (context, index) => contents[index]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.fromLTRB(0, 8, 8, 8)),
                                foregroundColor: MaterialStatePropertyAll(
                                    AppColors.lightPrimaryColor)),
                            onPressed: () {
                              // _slideAnimationController.reverse();
                              Provider.of<OnBoardProvider>(context,
                                      listen: false)
                                  .previous();
                            },
                            child: Text('Skip')),
                        Consumer<OnBoardProvider>(
                            builder: (context, value, child) {
                          return AnimatedSmoothIndicator(
                            activeIndex: value.currentIndex,
                            effect: const WormEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                dotColor: AppColors.lightPrimaryColor,
                                activeDotColor: AppColors.white),
                            count: OnBoardProvider.maxIndex,
                          );
                        }),
                        TextButton(
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.fromLTRB(8, 8, 0, 8))),
                            onPressed: () {
                              Provider.of<OnBoardProvider>(context,
                                      listen: false)
                                  .next();
                            },
                            child: Text('Next')),
                      ],
                    ),
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
