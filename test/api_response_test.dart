import 'package:flutter_test/flutter_test.dart';
import 'package:flutt_mobile/service/api_response.dart';

void main() {
  group('ApiResponse', () {
    test('decodeObject returns a map for valid JSON object', () {
      final result = ApiResponse.decodeObject('{"id": 1, "name": "Kenny"}');

      expect(result['id'], 1);
      expect(result['name'], 'Kenny');
    });

    test('decodeObject returns an empty map for empty body', () {
      expect(ApiResponse.decodeObject(''), isEmpty);
      expect(ApiResponse.decodeObject('   '), isEmpty);
    });

    test('decodeObject rejects JSON arrays', () {
      expect(
        () => ApiResponse.decodeObject('[{"id": 1}]'),
        throwsFormatException,
      );
    });

    test('messageFromBody prefers known message keys', () {
      expect(
        ApiResponse.messageFromBody('{"error": "Invalid credentials"}'),
        'Invalid credentials',
      );
    });

    test('messageFromBody returns fallback for invalid JSON', () {
      expect(
        ApiResponse.messageFromBody('not-json'),
        'Erreur de connexion',
      );
    });
  });
}
