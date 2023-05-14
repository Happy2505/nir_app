
import 'package:nir_app/Models/Furniture.dart';

import 'api_furniture.dart';

class FurnitureService {
  final _furnitureClient = FurnitureClient();

  Future<AllFurniture> getFurniture() async => _furnitureClient.getFurniture();

}
