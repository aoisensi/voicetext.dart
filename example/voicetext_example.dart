import 'dart:io';

import 'package:voicetext/voicetext.dart';

void main() async {
  var key = Platform.environment['VOICETEXT_API_KEY'];
  if (key == null) {
    throw Exception('VOICETEXT_API_KEY is empty!!');
  }
  var api = VoiceTextApi(key);

  var text = 'Dart言語を使ったVoiceTextのAPIライブラリのサンプルコードです。';

  try {
    var audio = await api.postTts(text, 'hikari');
    File('example.wav').writeAsBytesSync(audio);
    print('Saved file "exsample.wav"');
  } catch (e) {
    print(e);
  }
}
