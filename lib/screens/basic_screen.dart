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
    final TextTheme _txtTheme = Theme.of(context).textTheme;

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
            const SizedBox(height: 40),
            Text(
              '${brightness.getBulbBrightness.toInt().toString()}% Brightness',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Slider(
                value: brightness.getBulbBrightness,
                onChanged: (double bright) =>
                    brightness.setBulbBrightness(bright: bright),
                min: 0,
                max: 100,
              ),
            ),
            const SizedBox(height: 20),
            Text('Color Palettes', style: _txtTheme.headline2),
            const SizedBox(height: 20),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 5,
                  ),
                  itemCount: colorList.colorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ColorBox(colorCode: colorList.colorList[index]);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Gradients',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemExtent: 90,
              physics: const BouncingScrollPhysics(),
              itemCount: gradientData.getGradinetData.length,
              itemBuilder: (BuildContext context, int index) {
                return GradientBox(
                    color1: gradientData.getGradinetData[index].color1,
                    color2: gradientData.getGradinetData[index].color2,
                    graientName:
                        gradientData.getGradinetData[index].graientName);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
