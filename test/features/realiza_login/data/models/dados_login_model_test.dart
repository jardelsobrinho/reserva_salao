import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:reserva_salao/features/realiza_login/data/models/dados_login_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const dadosLoginModelSucesso = DadosLoginModel(
    nome: "Jardel Sobrinho",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJlbWFpbCI6ImphcmRlbHNvYnJpbmhvQGdtYWlsLmNvbSIsImV4cCI6MTcyNDM3MDY5OCwiaXNzIjoiQ3Vyc29GbHV0dGVyIiwiYXVkIjoiQ3Vyc29GbHV0dGVyIn0.0hcoEVR3jNzA4lSZGB_4IdOM10M6xIgWTUChX_TqqMA",
    isSuccess: true,
    isFailure: false,
  );
  test('deve retorna um DadosLoginModel valido', () async {
    var jsonMap = json.decode(fixture("dados_login_model.json"));
    final result = DadosLoginModel.fromJson(jsonMap);
    expect(result, dadosLoginModelSucesso);
  });
}
