import 'dart:io';

import 'package:voicetext/voicetext.dart';

void main() async {
  var key = Platform.environment['VOICETEXT_API_KEY'];
  if (key == null) {
    throw Exception('VOICETEXT_API_KEY is empty!!');
  }
  var api = VoicetextApi(key);

  print('Enter some text:');
  while (true) {
    var text = stdin.readLineSync();
    try {
      var audio = await api.postTts(text, 'hikari');
      File('$text.wav').writeAsBytesSync(audio);
      print('Saved file "$text.wav"');
    } catch (e) {
      print(e);
    }
  }
}
