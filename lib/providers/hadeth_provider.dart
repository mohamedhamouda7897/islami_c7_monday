import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home_screen/ahadeth.dart';

class HadethProvider extends ChangeNotifier {
  List<HadethData> Ahadeth = [];

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
    notifyListeners();
  }
}
