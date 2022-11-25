
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
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/ar_screen/ar_screen_model.dart';
import 'package:nir_app/furniture_list_screen/list_add_furniture.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:provider/provider.dart';


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
  var newIndex = 1;



  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontal,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: onRemoveEverything,
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    3))),
                        backgroundColor:
                        MaterialStateProperty.all(
                            const Color.fromARGB(
                                255, 240, 240, 240)),
                        minimumSize:
                        MaterialStateProperty.all(
                            const Size(108, 38))),
                    child: const Text(
                      'Удалить',
                      style: TextStyle(
                          color: AppColors.mainDark,
                          fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                        newIndex = _navigateAndDisplaySelection(context) as int;
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    3))),
                        backgroundColor:
                        MaterialStateProperty.all(
                            AppColors.mainDark),
                        minimumSize:
                        MaterialStateProperty.all(
                            const Size(108, 38))),
                    child: const Text(
                      'Добавить мебель',
                      style: TextStyle(
                          color: Color.fromARGB(
                              255, 255, 255, 255),
                          fontSize: 16),
                    ),
                  ),
                ]),
          )
        ]));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const AddFurniture(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  Future<int> _navigateAndDisplaySelection(BuildContext context) async {

    final result = await Navigator.of(context).push(_createRoute());
    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return 0;
    return result;
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


  Future<void> onRemoveEverything() async {
    /*nodes.forEach((node) {
      this.arObjectManager.removeNode(node);
    });*/
    for (var anchor in anchors) {
      arAnchorManager.removeAnchor(anchor);
    }
    anchors = [];
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    final a = context.findAncestorStateOfType<_ARScreenWidgetState>()?.newIndex ?? 1;
    final model = context.read<ARScreenModel>();
    var singleHitTestResult = hitTestResults.firstWhere(
            (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult != null) {
      var newAnchor =
      ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
      var s = newAnchor.transformation.setTranslationRaw(0.2, 0.0, 0.2);
      var ss = newAnchor.transformation.setRotationX(1.0);
      bool? didAddAnchor = await arAnchorManager.addAnchor(newAnchor);
      if (didAddAnchor!) {
        anchors.add(newAnchor);
        var node = Models.models[model.indexx];
        print("~~~~~~~~~~~~~~~~~~${newAnchor.transformation.getTranslation()}~~~~~~~~~~~~~~~~~~~~");
        var newNode = node.node;
        bool? didAddNodeToAnchor =
        await arObjectManager.addNode(newNode, planeAnchor: newAnchor);
        if (didAddNodeToAnchor!) {
          nodes.add(newNode);
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
    final pannedNode =
    nodes.firstWhere((element) => element.name == nodeName);

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
    final rotatedNode =
    nodes.firstWhere((element) => element.name == nodeName);

    /*
    * Uncomment the following command if you want to keep the transformations of the Flutter representations of the nodes up to date
    * (e.g. if you intend to share the nodes through the cloud)
    */
    //rotatedNode.transform = newTransform;
  }
}
