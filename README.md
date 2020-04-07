# voicetext.dart

[![pub package](https://img.shields.io/pub/v/voicetext.svg)](https://pub.dev/packages/voicetext)
[![Build Status](https://travis-ci.org/aoisensi/voicetext.dart.svg?branch=master)](https://travis-ci.org/aoisensi/voicetext)

## Usage

A simple usage example:

```dart
import 'package:voicetext/voicetext.dart';

main() {
  var api = VoiceTextApi('YOUR API KEY');
  var data = await api.postTts('サンプルテキスト', 'hikari');
}
```
