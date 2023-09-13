import 'package:flutter/material.dart';

class DarkThemeColor {
  const DarkThemeColor._();
  static Color primary = fromHex('#ccab51');
  static Color secondary = fromHex('#36b4ff');
  static Color tertiary = fromHex('#ffa130');
  static Color alternate = fromHex('#fafafa');

  static Color primaryText = fromHex('#ffffff');
  static Color secondaryText = fromHex('#95a1ac');
  static Color primaryBackground = fromHex('#14181b');
  static Color secondaryBackground = fromHex('#1d2429');

  static Color success = fromHex('#16b070');
  static Color error = fromHex('#ff5963');
  static Color warning = fromHex('#cc8e30');
  static Color info = fromHex('#ffffff');

  static Color accent1 = fromHex('#4c19db8a');
  static Color accent2 = fromHex('#4d36b4ff');
  static Color accent3 = fromHex('#4cffa130');
  static Color accent4 = fromHex('#b214181b');
}

class LightThemeColor {
  const LightThemeColor._();
  static Color primary = fromHex('#CCAB51');
  static Color secondary = fromHex('#5AAA95');
  static Color tertiary = fromHex('#19db8a');
  static Color alternate = fromHex('#FFFFFF');

  static Color primaryText = fromHex('#14181B');
  static Color secondaryText = fromHex('#57636c');
  static Color primaryBackground = fromHex('#F1F4F8');
  static Color secondaryBackground = fromHex('#FFFFFF');

  static Color success = fromHex('#16b070');
  static Color error = fromHex('#ff5963');
  static Color warning = fromHex('#cc8e30');
  static Color info = fromHex('#ffffff');

  static Color accent1 = fromHex('#4c19db8a');
  static Color accent2 = fromHex('#4d36b4ff');
  static Color accent3 = fromHex('#4dffa130');
  static Color accent4 = fromHex('#ABFFFFFF');
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
