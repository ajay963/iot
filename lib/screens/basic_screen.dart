import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/boxes.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _colorList = Provider.of<ColorList>(context);
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
            Row(
              children: [
                Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        _brightness.getColor1,
                        _brightness.getColor2
                      ], begin: Alignment.topLeft, end: Alignment.topRight),
                      borderRadius: BorderRadius.circular(40),
                    )),
                const SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('HEXcode', style: _txtTheme.bodyText1),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(_brightness.getColorInString,
                            style: TextStyle(
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff343434))),
                        const SizedBox(width: 20),
                        Ink(
                          height: 50,
                          width: 50,
                          child: InkWell(
                            splashColor: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            onTap: () async {
                              Clipboard.setData(ClipboardData(
                                  text: _brightness.getColorInString));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.black38,
                                      content: Text(
                                        'ColorCode Copied',
                                        style: _txtTheme.bodyText1,
                                      )));
                            },
                            child: const Icon(
                              Icons.copy,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffcccccc),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Color Wheel',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            Text('Recent Colors', style: _txtTheme.headline2),
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
                  itemCount: _brightness.getRecentColor.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ColorBox(
                        onTap: () {
                          _brightness.setColor1(
                              colorData: _brightness.getRecentColor[index]);
                          _brightness.setColor2(
                              colorData: _brightness.getRecentColor[index]);
                        },
                        colorCode: _brightness.getRecentColor[index]);
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 4),
              shrinkWrap: true,
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
            Text('Favourite Color', style: _txtTheme.headline2),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 5,
              ),
              itemCount: _brightness.getFavColor.length,
              itemBuilder: (BuildContext context, int index) {
                return ColorBox(
                    colorCode: _brightness.getFavColor[index],
                    onTap: () => _brightness.setColor1(
                        colorData: _brightness.getFavColor[index]));
              },
            ),
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
