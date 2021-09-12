import 'package:flutter/foundation.dart';

class ColorList extends ChangeNotifier {
  List<String> colorsList = ['0xffFF21CE', '0xffFFD231', '0xff37FF63'];
  List<String> get colorList => colorsList;
  void addColors({required String colorCode}) {
    colorsList.add(colorCode);
    notifyListeners();
  }
}
