enum TextColor {
  black('30'),
  grey('90'),
  red('91'),
  green('32'),
  yellow('33'),
  magenta('95'),
  cyan('96'),
  white('37'),
  backBlack('40'),
  backGrey('100'),
  backRed('41'),
  backRedBright('101'),
  backGreen('42'),
  backGreenBright('102'),
  backYellow('43'),
  backYellowBright('103'),
  backBlue('44'),
  backBlueBright('104'),
  backMagenta('45'),
  backMagentaBright('105'),
  backCyan('46'),
  backCyanBright('106'),
  backWhite('47'),

  reset('\x1B[0m'),
  resetBold('\x1B[0;1m');

  const TextColor(this.code);
  final String code;

  TextColor get backFill {
    return TextColor.values.firstWhere((e) => e.code == '4${code[1]}');
  }

  String call(dynamic text, {bool bold = false}) {
    final boldCode = bold ? ';1' : '';
    return '\x1B[$code${boldCode}m$text\x1B[0${boldCode}m';
  }
}
