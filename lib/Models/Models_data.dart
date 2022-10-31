import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:vector_math/vector_math_64.dart';
class Models {
  final String name;
  final String description;
  final String img;
  final ARNode node;

  Models({required this.name, required this.description, required this.img, required this.node});

  static var models = [
    Models(
        name: 'Стол',
        description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
        img:'assets/furniture_img/стол 1.png',
        node: ARNode(
            type: NodeType.fileSystemAppFolderGLTF2,
            uri:
            "models/Stol.gltf",
            scale: Vector3(1, 1, 1),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'Письменный стол Милан с ящиком 76.5х74.5 см ЛДСП цвет белый',
      img:'assets/furniture_img/стол 1.png',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "models/лампа.glb",
          // "Chicken_01/shkav.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
  ];
}
