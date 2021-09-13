import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class GradientData {
  String graientName;
  Color color1;
  Color color2;
  GradientData({
    required this.graientName,
    required this.color1,
    required this.color2,
  });
}

class GradientDatalist extends ChangeNotifier {
  final List<GradientData> _gradDatalist = [
    GradientData(
        graientName: 'Green Tea',
        color1: const Color(0xff23ef32),
        color2: const Color(0xff55ddff)),
    GradientData(
      graientName: 'Evening',
      color1: const Color(0xffFF21CE),
      color2: const Color(0xffB04CFF),
    ),
    GradientData(
      graientName: 'Haze Sun',
      color1: const Color(0xffFF6C6C),
      color2: const Color(0xffFFD231),
    ),
  ];

  List<GradientData> get getGradinetData => _gradDatalist;
  void addGradinet({required GradientData gradientData}) {
    _gradDatalist.add(gradientData);
    notifyListeners();
  }
}
