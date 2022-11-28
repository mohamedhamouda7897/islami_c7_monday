import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_mon/my_theme.dart';
import 'package:islami_c7_mon/sura_details/sura_details_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
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
        body: verses.isEmpty
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
                    itemCount: verses.length,
                    itemBuilder: (_, index) {
                      return SuraDetailsItem(verses[index]);
                    }),
              ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    print(lines);
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String Suraname;
  int index;

  SuraDetailsArgs(this.Suraname, this.index);
}
