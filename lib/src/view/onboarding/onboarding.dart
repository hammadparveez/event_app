import 'package:event_app/src/provider/onbaord_provider.dart';
import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 43.0),
                  child: Column(
                    children: const [
                      Text(
                        'Explore Upcoming and Nearby Events',
                        textAlign: TextAlign.center,
                        style: Styles.smallHeading,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'In publishing and graphic design, Lorem is a placeholder text commonly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, color: AppColors.white, height: 1.5),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {
                      Provider.of<OnBoardNotifier>(context,listen: false).changeIndex(0);
                    }, child: Text('Skip')),
                    Consumer<OnBoardNotifier>(builder: (context, value, child) {
                      return AnimatedSmoothIndicator(
                        activeIndex: value.currentIndex,
                        effect: const WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            dotColor: AppColors.lightPrimaryColor,
                            activeDotColor: AppColors.white),
                        count: 3,
                      );
                    }),
                    TextButton(
                        onPressed: () {
                          Provider.of<OnBoardNotifier>(context,listen: false).changeIndex(1);
                        },
                        child: Text('Next')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
