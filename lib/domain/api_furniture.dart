import 'package:flutter/cupertino.dart';
import 'package:nir_app/Models/Furniture.dart';


import 'network_client.dart';

class FurnitureClient {
  final _networkClient = NetworkClient();

  Future<AllFurniture> getFurniture() async {
    parser(dynamic json) {
      final jsonMap = json;
      final response = AllFurniture.fromJson(jsonMap);
      return response;
    }

    final result = _networkClient.get('Furniture', null, parser);
    return result;
  }
}