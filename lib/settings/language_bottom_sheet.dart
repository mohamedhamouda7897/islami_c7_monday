import 'package:flutter/material.dart';
import 'package:islami_c7_mon/my_theme.dart';
import 'package:islami_c7_mon/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'English',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: pro.languageCode == 'en'
                            ? MyThemeData.colorGold
                            : MyThemeData.colorBlack),
                  ),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: pro.languageCode == 'en'
                          ? MyThemeData.colorGold
                          : MyThemeData.colorBlack)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              pro.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Arabic',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: pro.languageCode == 'ar'
                            ? MyThemeData.colorGold
                            : MyThemeData.colorBlack),
                  ),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: pro.languageCode == 'ar'
                          ? MyThemeData.colorGold
                          : MyThemeData.colorBlack)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
