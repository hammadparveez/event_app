import 'package:event_app/src/provider/onbaord_provider.dart';
import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:event_app/src/view/onboarding/components/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Image.asset('assets/images/onboard_phone.png'),
          ),
          // const Spacer(),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              padding: EdgeInsets.all(40),
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
                              foregroundColor: MaterialStatePropertyAll(
                                  AppColors.lightPrimaryColor)),
                          onPressed: Provider.of<OnBoardProvider>(context,
                                  listen: false)
                              .previous,
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
                          onPressed: () {
                            Provider.of<OnBoardProvider>(context, listen: false)
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
    );
  }
}
