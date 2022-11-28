import 'package:flutter/material.dart';
import 'package:islami_c7_mon/home_screen/home.dart';
import 'package:islami_c7_mon/sura_details/sura_details.dart';

import 'hadeth_details/hadeth_details.dart';
import 'my_theme.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (c) => HomeScreen(),
        SuraDetailsScreen.routeName: (c) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen()
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}