import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_mon/my_theme.dart';
import 'package:islami_c7_mon/sura_details/sura_details_item.dart';
import 'package:provider/provider.dart';

import '../providers/sura_proivder.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'SuraDetails';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SuraProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (provider.verses.isEmpty) {
      provider.loadFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.Suraname}',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: provider.verses.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                    border: Border.all(color: MyThemeData.colorGold, width: 2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: MyThemeData.colorGold,
                          endIndent: 40,
                          indent: 40,
                        ),
                    itemCount: provider.verses.length,
                    itemBuilder: (_, index) {
                      return SuraDetailsItem(provider.verses[index]);
                    }),
        ),
      )
    ]);
  }
}

class SuraDetailsArgs {
  String Suraname;
  int index;

  SuraDetailsArgs(this.Suraname, this.index);
}
