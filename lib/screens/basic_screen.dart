import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/colors.dart';
import 'package:iot/resposive.dart';
import 'package:iot/widgets/colors_lib.dart';
import 'package:iot/widgets/colorwheel.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/widgets/buttos.dart';
import 'package:iot/widgets/color_selector.dart';
import 'package:provider/provider.dart';

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _colorList = Provider.of<ColorList>(context);

    final _brightness = Provider.of<LightData>(context);
    final TextTheme _txtTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
            Center(
                child: CircleColorPicker(
                    // width: MediaQuery.of(context).size.width * 0.7,
                    initialColor: _brightness.getColor1,
                    thumbRadius: 20,
                    thumbColor: Theme.of(context).cardColor,
                    colorListener: (int value) {
                      _brightness.addRecentColor(colorData: Color(value));

                      _brightness.setColor1(colorData: Color(value));
                      _brightness.setColor2(colorData: Color(value));
                    })),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return (_screenSize.width >= 600)
        ? SizedBox(
            height: _screenSize.height,
            width: _screenSize.width,
            child: Row(
              children: [
                //color Slector and current color status -- smaller screen
                Container(
                    color: kDarkBlack,
                    child: SizedBox(
                        height: _screenSize.height,
                        width: ResposiveSize()
                            .rowSize(screenSize: _screenSize, isBig: false),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ColorSelector(),
                        ))),
                SizedBox(
                  //recent color , gradients and fav colors
                  height: _screenSize.height,
                  width: ResposiveSize()
                      .rowSize(screenSize: _screenSize, isBig: true),

                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: ColorLib(),
                  ),
                )
              ],
            ),
          )
        : SizedBox(
            height: _screenSize.height,
            width: _screenSize.width,
            child: const ColorSelector());
  }
}
