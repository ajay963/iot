import 'package:flutter/cupertino.dart';

class ResposiveSize {
  double rowSize({required Size screenSize, required bool isBig}) {
    double lowerRatio = (screenSize.width <= 900) ? 0.45 : 0.35;
    double bigRatio = 1 - lowerRatio;

    return (isBig == true)
        ? bigRatio * screenSize.width
        : lowerRatio * screenSize.width;
  }

  int rowCount({required Size screenSize}) {
    int rowCount = 5;
    if (screenSize.width < 600) {
      rowCount = 5;
    } else if (screenSize.width >= 600 && screenSize.width <= 900) {
      rowCount = 8;
    } else {
      rowCount = 10;
    }

    return rowCount;
  }
}
