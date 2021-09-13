import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/provider/colors_list.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/boxes.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Basics extends StatelessWidget {
  const Basics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorList = Provider.of<ColorList>(context);
    final gradientData = Provider.of<GradientDatalist>(context);
    final _brightness = Provider.of<LightData>(context);
    final TextTheme _txtTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  color: _brightness.getColor
                      .withOpacity(_brightness.getBulbBrightness / 100),
                  borderRadius: BorderRadius.circular(20),
                )),
            const SizedBox(height: 40),
            Text(
              'Brightness',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            const Center(
              child: CircularSlider(),
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

class CircularSlider extends StatelessWidget {
  const CircularSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Provider.of<LightData>(context);
    return SleekCircularSlider(
      initialValue: brightness.getBulbBrightness,
      onChange: (double bright) => brightness.setBulbBrightness(bright: bright),
      min: 0,
      max: 100,
      appearance: CircularSliderAppearance(
          size: MediaQuery.of(context).size.width * 0.7,
          startAngle: 110,
          angleRange: 320,
          infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff666666))),
          customWidths: CustomSliderWidths(progressBarWidth: 20),
          customColors: CustomSliderColors(
              shadowColor: Colors.transparent,
              hideShadow: true,
              trackColor: const Color(0xffaAaAaA),
              progressBarColors: [
                const Color(0xff1b1b1b),
                const Color(0xffaAaAaA),
              ])),
    );
  }
}
