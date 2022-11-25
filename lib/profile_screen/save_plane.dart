import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nir_app/profile_screen/save_plane_model.dart';
import 'package:provider/provider.dart';

import '../Theme/app_color.dart';

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
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: AppColors.mainDark),
          title: const Text("Сохраненная планировка",
              style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  letterSpacing: -0.17,
                  color: AppColors.mainDark)),
        ),
        body: ListView.builder(
          itemCount: model.length,
          itemBuilder: (context, index) {
            if (model.length == 0) {
              return const Center(
                child: Text("Todo list is empty"),
              );
            }
            final savePlane = model.listBox[index];
            return Slidable(
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {},
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.drive_file_rename_outline_rounded,
                      label: 'Переименовать',
                    ),
                    SlidableAction(
                      onPressed: (BuildContext context) => model.deletedPlane(index),
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Удалить',
                    ),
                  ],
                ),
                child: ListTile(
                    title: Text("Запись: ${savePlane.name}"),
                    subtitle: Text(
                        "${savePlane.data.day}.${savePlane.data.month}.${savePlane.data.year}    ${savePlane.data.hour}:${savePlane.data.minute}"),
                    onTap: () {
                      // res.save();
                    })
            );
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
