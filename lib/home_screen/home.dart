import 'package:flutter/material.dart';
import 'package:islami_c7_mon/home_screen/quran_tab/quran.dart';
import 'package:islami_c7_mon/home_screen/radio.dart';
import 'package:islami_c7_mon/home_screen/sebha.dart';
import 'package:islami_c7_mon/my_theme.dart';

import 'ahadeth.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png'),
                      size: 30),
                  label: 'Quran',
                  backgroundColor: MyThemeData.colorGold),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                    size: 30,
                  ),
                  label: 'Sebha',
                  backgroundColor: MyThemeData.colorGold),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png'),
                      size: 30),
                  label: 'Radio',
                  backgroundColor: MyThemeData.colorGold),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png'),
                      size: 30),
                  label: 'Ahadeth',
                  backgroundColor: MyThemeData.colorGold),
            ],
          ),
          body: tabs[currentIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), SebhaTab(), RadioTab(), AhadethTab()];
}
