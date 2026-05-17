import 'dart:convert';

class ApiResponse {
  const ApiResponse._();

  static Map<String, dynamic> decodeObject(String body) {
    if (body.trim().isEmpty) {
      return {};
    }

    final decoded = jsonDecode(body);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }

    if (decoded is Map) {
      return decoded.map((key, value) => MapEntry(key.toString(), value));
    }

    throw const FormatException('Expected a JSON object response');
  }

  static String messageFromBody(
    String body, {
    String fallback = 'Erreur de connexion',
  }) {
    try {
      final decoded = decodeObject(body);
      return messageFromMap(decoded, fallback: fallback);
    } catch (_) {
      return fallback;
    }
  }

  static String messageFromMap(
    Map<dynamic, dynamic> data, {
    String fallback = 'Erreur de connexion',
  }) {
    for (final key in const ['message', 'error', 'detail']) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) {
        return value;
      }
    }

    if (data.isNotEmpty) {
      final firstValue = data.values.first;
      if (firstValue is String && firstValue.trim().isNotEmpty) {
        return firstValue;
      }
    }

    return fallback;
  }
}
