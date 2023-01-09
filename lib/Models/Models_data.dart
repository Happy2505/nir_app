import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:vector_math/vector_math_64.dart';
class Models {
  final String name;
  final String description;
  final String img;
  final ARNode node;
  final String catName;

  Models({required this.name, required this.description, required this.img, required this.node, required this.catName});

  static var models = [
    Models(
        name: 'Стол',
        description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
        img:'assets/catalog_img/стол.png',
        node: ARNode(
            type: NodeType.fileSystemAppFolderGLTF2,
            uri:
            "models/Stol.gltf",
            scale: Vector3(1, 1, 1),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
      catName: 'Столы'
    ),
    Models(
      name: 'Лампа',
      description:'лампа',
      img:'assets/catalog_img/торшер.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          // "https://github.com/Happy2505/Models/blob/main/lampa.glb",
          "models/лампа.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Освещение'

    ),
    Models(
      name: 'Стул',
      description:'стул',
      img:'assets/catalog_img/стул.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/стул.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Стул'

    ),
    Models(
      name: 'Телевизор',
      description:'телевизор',
      img:'assets/catalog_img/телевизор.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/Телевизор.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Телевизор'

    ),
    Models(
      name: 'Холодильник',
      description:'холодильник',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/холодильник.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Журнальный'

    ),
    Models(
      name: 'Комод',
      description:'комод',
      img:'assets/catalog_img/комод.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/Комод.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Комод'

    ),
    Models(
      name: 'Кровать',
      description:'кровать',
      img:'assets/catalog_img/кровать.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/кровать1.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Кровать'
    ),
    Models(
        name: 'Шкаф',
        description:'шкаф',
        img:'assets/catalog_img/шкаф.png',
        node: ARNode(
            type: NodeType.fileSystemAppFolderGLB,
            uri:
            "models/shkav.glb",
            // "Chicken_01/shkav.glb",
            scale: Vector3(1, 1, 1),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
        catName: 'Шкаф'
    ),
  ];
}
