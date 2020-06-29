import 'dart:convert';

import 'package:CoffeShopApp/models/item.dart';
import 'package:flutter/services.dart';

class Repository {

 Future<List<Item>> getallItens() async{
    var json = await rootBundle.loadString('lib/repository/itens_repository.json');
    var parsed = jsonDecode(json.toString()).cast<Map<String,dynamic>>();
    return parsed.map<Item>((json)=> Item.fromJson(json)).toList();

  }
}