import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/buttos.dart';
import 'package:provider/provider.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _brightness = Provider.of<LightData>(context);
    final TextTheme _txtTheme = Theme.of(context).textTheme;
    // final _screenSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
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
                    gradient: LinearGradient(
                        colors: [_brightness.getColor1, _brightness.getColor2],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight),
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomRoudedButto(text: 'Add to fav', onTap: () {}),
          const SizedBox(height: 40),
          Text(
            'Color Wheel',
            style: _txtTheme.headline2,
          ),
          const SizedBox(height: 40),
          Center(
            child: ColorPicker(
              wheelWidth: 20,
              width: 70,
              color: _brightness.getColor1,
              onColorChanged: (colorValue) {
                _brightness.setColor1(colorData: colorValue);
                _brightness.setColor2(colorData: colorValue);
              },
              onColorChangeEnd: (colorValue) {
                _brightness.addRecentColor(colorData: colorValue);
              },
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.accent: false,
                ColorPickerType.primary: false,
                ColorPickerType.wheel: true,
              },
              enableShadesSelection: false,
            ),
          ),
          const SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     ColorBox(colorCode: _brightness.getColor1, onTap: () {}),
          //     ColorBox(colorCode: _brightness.prevColor, onTap: () {}),
          //   ],
          // )
        ],
      ),
    );
  }
}





  //  Center(
  //           child: CircleColorPicker(
  //               // width: MediaQuery.of(context).size.width * 0.7,
  //               initialColor: _brightness.getColor1,
  //               thumbRadius: 20,
  //               thumbColor: Theme.of(context).cardColor,
  //               colorListener: (int value) {
  //                 _brightness.addRecentColor(colorData: Color(value));

  //                 _brightness.setColor1(colorData: Color(value));
  //                 _brightness.setColor2(colorData: Color(value));
  //               })),