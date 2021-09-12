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
    final TextTheme _txtTheme = ThemeData().textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Selected Color',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(brightness.brightness / 100),
                  borderRadius: BorderRadius.circular(20),
                )),
            const SizedBox(height: 20),
            Text(
                '${brightness.getBulbBrightness.toInt().toString()}% Brightness'),
            Slider(
              value: brightness.getBulbBrightness,
              onChanged: (double bright) =>
                  brightness.setBulbBrightness(bright: bright),
              min: 0,
              max: 100,
            ),
            const SizedBox(height: 20),
            Text('Color Palettes', style: _txtTheme.headline2),
            const SizedBox(height: 20),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: [
                for (String colorList in colorList.colorList)
                  ColorBox(colorCode: colorList)
              ],
            ),
            const SizedBox(height: 20),
            const Text('Gradients'),
            const SizedBox(height: 20),
            for (GradientData gradientList in gradientData.getGradinetData)
              GradientBox(
                  color1: gradientList.color1,
                  color2: gradientList.color2,
                  graientName: gradientList.graientName),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
