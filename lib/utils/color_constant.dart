import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color mainBlueColor = Color(0xff32E7FC);
  static Color mainPurpleColor = Color(0xffC527E3);

  static Color purple100 = fromHex('#eaccf8');

  static Color indigo9007f = fromHex('#7f21165b');

  static Color cyanA200 = fromHex('#32e7fc');

  static Color deepPurple900 = fromHex('#2f1d8b');

  static Color tealA2004c = fromHex('#4c68eaca');

  static Color lightBlueA200 = fromHex('#3fd7fa');

  static Color gray80000 = fromHex('#004c4c4c');

  static Color deepPurpleA2004c = fromHex('#4c6654f1');

  static Color deepPurple200 = fromHex('#c2a0d5');

  static Color whiteA70033 = fromHex('#33ffffff');

  static Color whiteA70099 = fromHex('#99ffffff');

  static Color black90000 = fromHex('#00000000');

  static Color black900 = fromHex('#000000');

  static Color purple900 = fromHex('#3e085d');

  static Color purpleA400 = fromHex('#ca1ece');

  static Color whiteA70019 = fromHex('#19ffffff');

  static Color purple9007f = fromHex('#7f3e085d');

  static Color purpleA200 = fromHex('#c527e3');

  static Color purple800 = fromHex('#661196');

  static Color purple1004c = fromHex('#4ceaccf8');

  static Color deepPurpleA200 = fromHex('#6654f1');

  static Color gray600 = fromHex('#727272');

  static Color gray900 = fromHex('#131111');

  static Color purple80066 = fromHex('#66661196');

  static Color deepPurple90001 = fromHex('#371c8d');

  static Color tealA200 = fromHex('#69eacb');

  static Color deepPurple90066 = fromHex('#662f1d8b');

  static Color gray9001e = fromHex('#1e000748');

  static Color bluegray400 = fromHex('#888888');

  static Color blueGray1002d = fromHex('#2dd9d9d9');

  static Color indigo900 = fromHex('#21165b');

  static Color purple8007c = fromHex('#7c661196');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
