import 'package:flutter/foundation.dart';

class ColorList extends ChangeNotifier {
  List<String> colorsList = [];
  List<String> get colorList => colorsList;
  void addColors({required String colorCode}) {
    colorsList.add(colorCode);
    notifyListeners();
  }
}
