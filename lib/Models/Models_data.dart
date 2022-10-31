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
        description:'',
        img:'',
        node: ARNode(
            type: NodeType.fileSystemAppFolderGLTF2,
            uri:
            "Chicken_01/Stol.gltf",
            scale: Vector3(1, 1, 1),
            position: Vector3(0.0, 0.0, 0.0),
            rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стул',
      description:'',
      img:'',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLB,
          uri:
          "Chicken_01/шкав1.glb",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'',
      img:'',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLTF2,
          uri:
          "Chicken_01/Stol.gltf",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'',
      img:'',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLTF2,
          uri:
          "Chicken_01/Stol.gltf",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
    Models(
      name: 'Стол',
      description:'',
      img:'',
      node: ARNode(
          type: NodeType.fileSystemAppFolderGLTF2,
          uri:
          "Chicken_01/Stol.gltf",
          scale: Vector3(1, 1, 1),
          position: Vector3(0.0, 0.0, 0.0),
          rotation: Vector4(1.0, 0.0, 0.0, 0.0)),
    ),
  ];
}
