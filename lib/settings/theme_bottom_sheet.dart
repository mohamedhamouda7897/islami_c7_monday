import 'package:flutter/material.dart';
import 'package:islami_c7_mon/my_theme.dart';
import 'package:islami_c7_mon/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Light',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: provider.mode == ThemeMode.light
                            ? MyThemeData.colorGold
                            : MyThemeData.yellowColor),
                  ),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: provider.mode == ThemeMode.light
                          ? MyThemeData.colorGold
                          : MyThemeData.yellowColor)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Dark',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: provider.mode == ThemeMode.dark
                            ? MyThemeData.colorGold
                            : MyThemeData.yellowColor),
                  ),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: provider.mode == ThemeMode.dark
                          ? MyThemeData.colorGold
                          : MyThemeData.yellowColor)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
