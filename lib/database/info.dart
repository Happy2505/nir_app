import 'package:hive/hive.dart';

part 'info.g.dart';


@HiveType(typeId: 0)
class Favorite extends HiveObject {
  @HiveField(0)
  int id;

  Favorite({
    required this.id,
  });
}
