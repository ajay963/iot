import 'package:flutter/foundation.dart';

class GradientData {
  String graientName;
  String color1;
  String color2;
  GradientData({
    required this.graientName,
    required this.color1,
    required this.color2,
  });
}

class GradientDatalist extends ChangeNotifier {
  List<GradientData> gradDatalist = [];

  List<GradientData> get getGradinetData => gradDatalist;
  void addGradinet({required GradientData gradientData}) {
    gradDatalist.add(gradientData);
    notifyListeners();
  }
}
