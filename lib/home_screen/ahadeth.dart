import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_mon/hadeth_details/hadeth_details.dart';

import '../my_theme.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethData> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/ahadeth_main_bg.png'),
        const Divider(
          color: MyThemeData.colorGold,
          thickness: 3,
        ),
        Text(
          'Ahadeth',
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        const Divider(
          color: MyThemeData.colorGold,
          thickness: 3,
        ),
        Ahadeth.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: MyThemeData.colorGold,
                        ),
                    itemCount: Ahadeth.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, HadethDetailsScreen.routeName,
                              arguments: Ahadeth[index]);
                        },
                        child: Text(
                          Ahadeth[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: MyThemeData.colorBlack),
                        ),
                      );
                    }),
              )
      ],
    );
  }

  void loadHadethFile() async {
    // Future<List<int>>

    String m = 'mohamed ';
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.split('#\r\n');
// for loop
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      print(hadeth);
      print('------------------------');
      List<String> HadethLines = hadeth.split('\n');
      String title = HadethLines[0];
      HadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, HadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
