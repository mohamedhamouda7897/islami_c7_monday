import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_mon/hadeth_details/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';
import '../providers/hadeth_provider.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (contet) => HadethProvider()..loadHadethFile(),
      builder: (c, w) {
        var provider = Provider.of<HadethProvider>(c);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/ahadeth_main_bg.png'),
            const Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
            Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
            provider.Ahadeth.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                              color: MyThemeData.colorGold,
                            ),
                        itemCount: provider.Ahadeth.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HadethDetailsScreen.routeName,
                                  arguments: provider.Ahadeth[index]);
                            },
                            child: Text(
                              provider.Ahadeth[index].title,
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
      },
    );
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
