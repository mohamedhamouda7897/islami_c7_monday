import 'package:flutter/material.dart';
import 'package:islami_c7_mon/home_screen/home.dart';
import 'package:islami_c7_mon/providers/my_provider.dart';
import 'package:islami_c7_mon/providers/sura_proivder.dart';
import 'package:islami_c7_mon/sura_details/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'hadeth_details/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'my_theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MyProvider()),
    ChangeNotifierProvider(create: (context) => SuraProvider()),
  ], child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale(provider.languageCode),
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