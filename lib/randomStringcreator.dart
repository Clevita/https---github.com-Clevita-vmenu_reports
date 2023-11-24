import 'dart:math';

String randomStringcreator({String? prefixname}) {
  int len = 5;
  var r = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz';
  return '${prefixname ?? ''}A${List.generate(len, (index) => chars[r.nextInt(chars.length)]).join()}';
}
