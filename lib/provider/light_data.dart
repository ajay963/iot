import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LightData extends ChangeNotifier {
  double brightness = 100;
  double get getBulbBrightness => brightness;
  void setBulbBrightness({required double bright}) {
    brightness = bright;
    notifyListeners();
  }
}
