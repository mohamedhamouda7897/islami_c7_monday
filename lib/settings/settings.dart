import 'package:flutter/material.dart';
import 'package:islami_c7_mon/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import 'language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyThemeData.colorGold)),
              child: Text(
                pro.languageCode == 'en' ? 'English' : "Arabic",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: MyThemeData.colorBlack),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Theme',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyThemeData.colorGold)),
            child: Text(
              'Light',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: MyThemeData.colorBlack),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }
}
