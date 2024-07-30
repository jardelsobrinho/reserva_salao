import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:reserva_salao/features/login/data/models/data_token_model.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  const dataTokenModel = DataTokenModel(
    token: "token",
    nome: "nome",
    email: "email",
  );

  group('fromJson', () {
    test("deve retorna um DataTokenModel valido", () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture("data_token_response.json"));
      final result = DataTokenModel.fromJson(jsonMap);
      expect(result, dataTokenModel);
    });
  });

  group('toJson', () {
    test("deve retornar um json valido", () async {
      final result = dataTokenModel.toJson();
      final expectedJson = json.decode(fixture("data_token_response.json"));
      expect(result, expectedJson);
    });
  });
}
