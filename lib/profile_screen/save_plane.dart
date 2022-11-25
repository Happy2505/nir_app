import 'package:flutter/material.dart';
import 'package:nir_app/profile_screen/save_plane_model.dart';
import 'package:provider/provider.dart';


class SavePlanPage extends StatefulWidget {
  const SavePlanPage({Key? key}) : super(key: key);

  @override
  _SavePlanPageState createState() => _SavePlanPageState();
}

class _SavePlanPageState extends State<SavePlanPage> {

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SavePlaneModel>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white60,
          title: const Text("123"),
        ),
        body: ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            if (model.length == 0) {
              return Container(
                color: Colors.red,
                child: const Center(
                  child: Text("Todo list is empty"),
                ),
              );
            }
            final savePlane = model.listBox[index];
            return ListTile(
                title: Text("cj[hfytybt ${savePlane.name}"),
                // subtitle: Text(res.note),
                onTap: () {
                  // res.save();
                });
          },
        )
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => AddTodo())),
      //   tooltip: 'Add todo',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
