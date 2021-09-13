import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:iot/provider/light_data.dart';
import 'package:provider/provider.dart';

class AdvancePage extends StatelessWidget {
  const AdvancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _colorData = Provider.of<LightData>(context);
    final _textThemeData = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        // controller: controller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Selected Color',
              style: _textThemeData.headline2,
            ),
            const SizedBox(height: 20),
            Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _colorData.getColor
                      .withOpacity(_colorData.getBulbBrightness / 100),
                  borderRadius: BorderRadius.circular(20),
                )),
            const SizedBox(height: 40),
            Text(
                _colorData.getColor
                    .toString()
                    .replaceAll('Color(0xff', '#')
                    .replaceAll(')', ''),
                style: _textThemeData.headline2),
            const SizedBox(height: 20),
            ColorPicker(
              color: _colorData.getColor,
              onColorChanged: (Color color) =>
                  _colorData.setColor(colorData: color),
              onColorChangeEnd: (Color color) =>
                  _colorData.addRecentColor(colorData: color),
              wheelDiameter: MediaQuery.of(context).size.width * 0.8,
              wheelWidth: 30,
              borderRadius: 30,
              enableShadesSelection: false,
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.wheel: true,
                ColorPickerType.accent: false,
                ColorPickerType.primary: false
              },
            ),
          ],
        ),
      ),
    );
  }
}
