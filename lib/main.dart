import 'package:flutter/material.dart';
import 'package:islami_c7_mon/home.dart';

void main(){
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (c)=>HomeScreen()
      },
    );
  }
}