import 'dart:convert';

extension StringExtension on String {
  Map<String, dynamic> get decodedString => jsonDecode(this);

  String get encodeString => jsonEncode(this);
}
