import 'dart:developer';
import 'dart:math';

import 'package:event_app/main.dart';
import 'package:event_app/src/util/constants/app_theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final items = ['India', 'Pakistan', 'Canada', 'USA'];
  String selectedCountry = 'Canada';
  final colors = const [
    Color(0xffF0635A),
    Color(0xffF59762),
    Color(0xff29D697),
    Color(0xff46CDFB),
  ];
  final categories = ['Sports', 'Music', 'Food', 'Arts'];
  final imagesName = ['ball', 'music', 'knife', 'art'];
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
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
                      Image.asset('assets/icons/bar.png',
                          width: 24, height: 20),
                      Column(
                        children: [
                          DropdownButton(
                              isDense: true,
                              iconEnabledColor: AppColors.white,
                              underline: const SizedBox(),
                              hint: const Text(
                                'Current Location',
                                style: TextStyle(color: AppColors.white),
                              ),
                              items: items
                                  .map((e) => DropdownMenuItem(
                                      value: e, child: Text('$e')))
                                  .toList(),
                              onChanged: (i) {
                                setState(() {
                                  selectedCountry = i ?? 'Canada';
                                });
                              }),
                          Text(selectedCountry,
                              style: TextStyle(color: AppColors.white)),
                        ],
                      ),
                      Container(
                        height: 36,
                        width: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightPrimaryColor,
                        ),
                        child: Image.asset(
                          'assets/icons/bell.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 25),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/search.png',
                            height: 24, width: 24),
                        SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: AppColors.lightPrimaryColor,
                            )),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            isCollapsed: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColors.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Container(
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset('assets/icons/filter.png',
                                    height: 20, width: 20),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Filter',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 24 : 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          margin: EdgeInsets.only(right: 12),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: colors[index]),
                          child: Row(
                            children: [
                              Image.asset(
                                  'assets/icons/${imagesName[index]}.png'),
                              const SizedBox(width: 8),
                              Text(
                                categories[index],
                                style: TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    ));
  }
}
