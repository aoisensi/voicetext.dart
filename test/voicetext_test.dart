import 'dart:io';

import 'package:voicetext/voicetext.dart';
import 'package:test/test.dart';

void main() {
  VoicetextApi api;

  setUp(() {
    var key = Platform.environment['VOICETEXT_API_KEY'];
    if (key == null) {
      throw Exception('VOICETEXT_API_KEY is empty!!');
    }
    api = VoicetextApi(key);
  });

  test('Test', () async {
    await api.postTts('こんにちは', 'hikari');
  });
}
