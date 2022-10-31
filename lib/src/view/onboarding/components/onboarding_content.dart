import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);
  final String title, desc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 43.0),
      child: Column(
        children:  [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.smallHeading,
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style:const  TextStyle(fontSize: 15, color: AppColors.white, height: 1.5),
          ),
        ],
      ),
    );
  }
}
