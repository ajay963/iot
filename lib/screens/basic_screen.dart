import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/provider/colors_list.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/boxes.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _colorList = Provider.of<ColorList>(context);
    final _gradientData = Provider.of<GradientDatalist>(context);
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
                  gradient: LinearGradient(
                      colors: [_brightness.getColor1, _brightness.getColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(20),
                )),
            const SizedBox(height: 40),
            Text(
              'Power',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            const Center(
              child: CircularSlider(),
            ),
            const SizedBox(height: 40),
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
                  itemCount: _colorList.colorList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ColorBox(
                        onTap: () {
                          _brightness.setColor1(
                              colorData: _colorList.colorList[index]);
                          _brightness.setColor2(
                              colorData: _colorList.colorList[index]);
                        },
                        colorCode: _colorList.colorList[index]);
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Gradients',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemExtent: 90,
              physics: const BouncingScrollPhysics(),
              itemCount: _gradientData.getGradinetData.length,
              itemBuilder: (BuildContext context, int index) {
                return GradientBox(
                    onTap: () {
                      _brightness.setColor1(
                          colorData:
                              _gradientData.getGradinetData[index].color1);
                      _brightness.setColor2(
                          colorData:
                              _gradientData.getGradinetData[index].color2);
                    },
                    color1: _gradientData.getGradinetData[index].color1,
                    color2: _gradientData.getGradinetData[index].color2,
                    graientName:
                        _gradientData.getGradinetData[index].graientName);
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
          startAngle: 90,
          angleRange: 260,
          infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff666666))),
          customWidths: CustomSliderWidths(progressBarWidth: 20),
          customColors: CustomSliderColors(
              shadowColor: Colors.transparent,
              hideShadow: true,
              trackColor: const Color(0xffaAaAaA),
              gradientStartAngle: 90,
              gradientEndAngle: 360,
              progressBarColors: [
                const Color(0xff00FF00),
                const Color(0xffFFFF00),
                const Color(0xffFF0000),
              ])),
    );
  }
}
