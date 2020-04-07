import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class VoiceTextApi {
  final Map<String, String> _header;
  VoiceTextApi(String apiKey)
      : _header = {
          'Authorization': 'Basic ' + base64.encode(utf8.encode('$apiKey:'))
        };

  /// https://cloud.voicetext.jp/webapi/docs/api
  Future<Uint8List> postTts(String text, String speaker,
      {String format,
      String emotion,
      int emotionLevel,
      int pitch,
      int speed,
      int volume}) async {
    var body = {
      'text': text,
      'speaker': speaker,
    };
    if (format != null) body['format'] = format;
    if (emotion != null) body['emotion'] = emotion;
    if (emotionLevel != null) body['emotion_level'] = emotionLevel.toString();
    if (pitch != null) body['pitch'] = pitch.toString();
    if (speed != null) body['speed'] = speed.toString();
    if (volume != null) body['volume'] = volume.toString();

    var resp = await http.post('https://api.voicetext.jp/v1/tts',
        headers: _header, body: body);

    if (resp.statusCode != 200) {
      var error = json.decode(resp.body)['error']['message'];
      return Future.error(Exception(error));
    }

    return resp.bodyBytes;
  }
}
