import 'dart:convert';
import 'dart:io';

import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:flutter/services.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/ar_screen/ar_screen_model.dart';
import 'package:nir_app/furniture_list_screen/list_add_furniture.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:provider/provider.dart';
import '../entity/save.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;


class ARScreenWidget extends StatefulWidget {
  const ARScreenWidget({Key? key}) : super(key: key);

  @override
  _ARScreenWidgetState createState() => _ARScreenWidgetState();
}

class _ARScreenWidgetState extends State<ARScreenWidget> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ARAnchorManager arAnchorManager;

  List<ARNode> nodes = [];
  List<ARAnchor> anchors = [];
  var newIndex = -1;

  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ARScreenModel>();
    newIndex = model.indexx;
    return Scaffold(
        body: Stack(children: [
      ARView(
        onARViewCreated: onARViewCreated,
        planeDetectionConfig: PlaneDetectionConfig.horizontal,
      ),
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: Container(color:AppColors.mainDark, child: Text(newIndex.toString())),
      // ),
      Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
              icon: const Icon(Icons.add_circle_outline_rounded,
                  size: 35, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            IconButton(
              onPressed: onRemoveEverything,
              icon: const Icon(Icons.delete_outline_rounded,
                  size: 35, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            IconButton(
              onPressed: onSavePlane,
              icon: const Icon(Icons.save_alt_rounded,
                  size: 35, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ]),
        ),
      )
    ]));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddFurniture(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1);
        const end = Offset(0.0, 0.0);
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<int> _navigateAndDisplaySelection(BuildContext context) async {
    newIndex = await Navigator.of(context).push(_createRoute());
    if (!mounted) return 0;
    print(newIndex);
    return newIndex;
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          // customPlaneTexturePath: "assets/triangle.png",
          handlePans: true,
          handleRotation: true,
        );
    this.arObjectManager.onInitialize();

    this.arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
    this.arObjectManager.onPanStart = onPanStarted;
    this.arObjectManager.onPanChange = onPanChanged;
    this.arObjectManager.onPanEnd = onPanEnded;
    this.arObjectManager.onRotationStart = onRotationStarted;
    this.arObjectManager.onRotationChange = onRotationChanged;
    this.arObjectManager.onRotationEnd = onRotationEnded;
  }

  Future<void> onSavePlane() async {
    if (anchors.isEmpty) return;
    List<Description> as = [];
    for (int i = 0; i < anchors.length; i++) {
      Vector3 pos = anchors[i].transformation.getTranslation();
      double posX = pos.x;
      double posY = pos.y;
      double posZ = pos.z;
      Matrix3 rotation = anchors[i].transformation.getRotation();
      double rotationX = rotation.getColumn(1).x;
      as.add(Description(nodes[i].uri, posX, posY, posZ, rotationX));
    }
    final dir = await pathProvider.getApplicationSupportDirectory();
    final filePath = '${dir.path}/file';
    final file = File(filePath);
    // print(dir);
    final ss = SafePlan(5, as);
    final objects = ss.toJson();
    final jsonString = jsonEncode(objects);
    await file.writeAsString(jsonString);
    // print(jsonString);
  }

  Future<void> onRemoveEverything() async {
    nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });
    for (var anchor in anchors) {
      arAnchorManager.removeAnchor(anchor);
    }
    anchors = [];
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    final model = context.read<ARScreenModel>();
    var singleHitTestResult = hitTestResults.firstWhere(
        (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor =
          ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      // var s = newAnchor.transformation.setTranslationRaw(0.2, 0.0, 0.2);
      // var ss = newAnchor.transformation.setRotationX(1.0);
      bool? didAddAnchor = await arAnchorManager.addAnchor(newAnchor);
      if (didAddAnchor!) {
        anchors.add(newAnchor);
        if (newIndex == -1) {
          var node = Models.models[model.indexx];
        }
        var node = Models.models[newIndex];
        var newNode = node.node;
        bool? didAddNodeToAnchor =
            await arObjectManager.addNode(newNode, planeAnchor: newAnchor);
        if (didAddNodeToAnchor!) {
          nodes.add(newNode);
          print(newNode.name);
          print(newNode.uri);
        } else {
          arSessionManager.onError("Adding Node to Anchor failed");
        }
      } else {
        arSessionManager.onError("Adding Anchor failed");
      }
    }
  }

  onPanStarted(String nodeName) {
    print("Started panning node " + nodeName);
  }

  onPanChanged(String nodeName) {
    print("Continued panning node " + nodeName);
  }

  onPanEnded(String nodeName, Matrix4 newTransform) {
    print("Ended panning node " + nodeName);
    final pannedNode = nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //pannedNode.transform = newTransform;
  }

  onRotationStarted(String nodeName) {
    print("Started rotating node " + nodeName);
  }

  onRotationChanged(String nodeName) {
    print("Continued rotating node " + nodeName);
  }

  onRotationEnded(String nodeName, Matrix4 newTransform) {
    print("Ended rotating node " + nodeName);
    final rotatedNode = nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //rotatedNode.transform = newTransform;
  }
}
