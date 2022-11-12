import 'package:event_app/main.dart';
import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(33),
                bottomRight: Radius.circular(33)),
          ),
          padding: EdgeInsets.fromLTRB(24, topPadding + 10, 24, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/bar.png', width: 24, height: 20),
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: Row(),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
