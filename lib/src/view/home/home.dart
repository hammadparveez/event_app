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
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text('$e')))
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
                            decoration: BoxDecoration(shape: BoxShape.circle),
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
      ],
    ));
  }
}
