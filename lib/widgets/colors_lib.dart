import 'package:flutter/material.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/boxes.dart';
import 'package:iot/widgets/buttos.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ColorLib extends StatelessWidget {
  const ColorLib({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _gradientData = Provider.of<GradientDatalist>(context);
    final _brightness = Provider.of<LightData>(context);
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    // final _screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Colors', style: _txtTheme.headline2),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: StaggeredGridView.countBuilder(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
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
                crossAxisCount: 4,
                staggeredTileBuilder: (int index) => (index % 7 == 0)
                    ? const StaggeredTile.count(2, 2)
                    : const StaggeredTile.count(1, 1),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Gradients',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: StaggeredGridView.countBuilder(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 4,
                staggeredTileBuilder: (int index) => (index % 7 == 0)
                    ? const StaggeredTile.count(2, 2)
                    : const StaggeredTile.count(1, 1),
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
            ),
            const SizedBox(height: 20),
            CustomRoudedButto(text: 'Add Gradients', onTap: () {}),
            const SizedBox(height: 20),
            Text('Favourite Color', style: _txtTheme.headline2),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: StaggeredGridView.countBuilder(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.horizontal,
                crossAxisCount: 4,
                staggeredTileBuilder: (int index) => (index % 7 == 0)
                    ? const StaggeredTile.count(2, 2)
                    : const StaggeredTile.count(1, 1),
                itemCount: _brightness.getFavColor.length,
                itemBuilder: (BuildContext context, int index) {
                  return ColorBox(
                      colorCode: _brightness.getFavColor[index],
                      onTap: () => _brightness.setColor1(
                          colorData: _brightness.getFavColor[index]));
                },
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
