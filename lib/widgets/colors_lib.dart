import 'package:flutter/material.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/resposive.dart';
import 'package:iot/widgets/boxes.dart';
import 'package:iot/widgets/buttos.dart';
import 'package:provider/provider.dart';

class ColorLib extends StatelessWidget {
  const ColorLib({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _gradientData = Provider.of<GradientDatalist>(context);
    final _brightness = Provider.of<LightData>(context);
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    final _screenSize = MediaQuery.of(context).size;
    final _resposive = ResposiveSize();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Colors', style: _txtTheme.headline2),
          const SizedBox(height: 20),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: _screenSize.width * 0.02,
                  crossAxisSpacing: _screenSize.width * 0.02,
                  crossAxisCount: _resposive.rowCount(screenSize: _screenSize),
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: _screenSize.width * 0.02,
                crossAxisSpacing: _screenSize.width * 0.02,
                crossAxisCount: _resposive.rowCount(screenSize: _screenSize)),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: _gradientData.getGradinetData.length,
            itemBuilder: (BuildContext context, int index) {
              return GradientBox(
                  onTap: () {
                    _brightness.setColor1(
                        colorData: _gradientData.getGradinetData[index].color1);
                    _brightness.setColor2(
                        colorData: _gradientData.getGradinetData[index].color2);
                  },
                  color1: _gradientData.getGradinetData[index].color1,
                  color2: _gradientData.getGradinetData[index].color2,
                  graientName:
                      _gradientData.getGradinetData[index].graientName);
            },
          ),
          const SizedBox(height: 20),
          CustomRoudedButto(text: 'Add Gradients', onTap: () {}),
          const SizedBox(height: 20),
          Text('Favourite Color', style: _txtTheme.headline2),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: _screenSize.width * 0.02,
              crossAxisSpacing: _screenSize.width * 0.02,
              crossAxisCount: _resposive.rowCount(screenSize: _screenSize),
            ),
            itemCount: _brightness.getFavColor.length,
            itemBuilder: (BuildContext context, int index) {
              return ColorBox(
                  colorCode: _brightness.getFavColor[index],
                  onTap: () => _brightness.setColor1(
                      colorData: _brightness.getFavColor[index]));
            },
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
