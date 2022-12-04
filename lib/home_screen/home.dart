import 'package:flutter/material.dart';
import 'package:islami_c7_mon/home_screen/quran_tab/quran.dart';
import 'package:islami_c7_mon/home_screen/radio.dart';
import 'package:islami_c7_mon/home_screen/sebha.dart';
import 'package:islami_c7_mon/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c7_mon/providers/my_provider.dart';
import 'package:islami_c7_mon/settings/settings.dart';
import 'package:provider/provider.dart';
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
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.mode == ThemeMode.light
              ? 'assets/images/main_background.png'
              : "assets/images/bg.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png'),
                      size: 30),
                  label: 'Quran',
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.darkPrimary),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/sebha.png'),
                    size: 30,
                  ),
                  label: 'Sebha',
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.darkPrimary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png'),
                      size: 30),
                  label: 'Radio',
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.darkPrimary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png'),
                      size: 30),
                  label: 'Ahadeth',
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.darkPrimary),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: provider.mode == ThemeMode.light
                      ? MyThemeData.colorGold
                      : MyThemeData.darkPrimary),
            ],
          ),
          body: tabs[currentIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsScreen()
  ];
}
