import 'package:flutter/material.dart';
import 'package:iot/provider/colors_list.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/boxes.dart';
import 'package:provider/provider.dart';

class Basics extends StatelessWidget {
  const Basics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorList = Provider.of<ColorList>(context);
    final gradientData = Provider.of<GradientDatalist>(context);
    final brightness = Provider.of<LightData>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Text('Selected Color'),
                const Spacer(flex: 1),
                Text('${brightness.getBulbBrightness.toString()} Brightness'),
                Slider(
                  value: brightness.getBulbBrightness,
                  onChanged: (double bright) =>
                      brightness.setBulbBrightness(bright: bright),
                  min: 0,
                  max: 100,
                ),
                const Spacer(flex: 1),
                const Text('Color Palettes'),
                const Spacer(flex: 1),
                Wrap(
                  spacing: 1,
                  runSpacing: 1,
                  children: [
                    for (String colorList in colorList.colorList)
                      ColorBox(colorCode: colorList)
                  ],
                ),
                const Spacer(flex: 2),
                const Text('Gradients'),
                const Spacer(flex: 1),
                for (GradientData gradientList in gradientData.getGradinetData)
                  GradientBox(
                      color1: gradientList.color1,
                      color2: gradientList.color2,
                      graientName: gradientList.graientName),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
