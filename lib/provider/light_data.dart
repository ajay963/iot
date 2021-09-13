import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LightData extends ChangeNotifier {
  double _brightness = 100;
  Color _colorData = const Color(0xff00ffe0);
  final List<Color> _recentColorsList = [const Color(0xff00ffe0)];
  double get getBulbBrightness => _brightness;
  Color get getColor => _colorData;
  List<Color> get getRecentColor => _recentColorsList;
  void setBulbBrightness({required double bright}) {
    _brightness = bright;
    notifyListeners();
  }

  void setColor({required Color colorData}) {
    _colorData = colorData;
    notifyListeners();
  }

  void addRecentColor({required Color colorData}) {
    _recentColorsList.add(colorData);
    notifyListeners();
  }
}
