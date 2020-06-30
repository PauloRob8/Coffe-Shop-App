import 'dart:convert';

import 'package:CoffeShopApp/models/item.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  test('Teste para verificar se o arquivo Json será lido corretamente e transformado em uma Lista de Itens', () async {
    var json = await rootBundle.loadString('lib/repository/itens_repository.json');
    var parsed = jsonDecode(json.toString()).cast<Map<String,dynamic>>();
    var lista = parsed.map<Item>((json)=> Item.fromJson(json)).toList();
    expect(lista[0].name,'Classic Latte');
  });
}