import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
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
  void dispose() async {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    final model = context.watch<AddFavorite>();
    if (model.length == 0) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_down_rounded ,size: 30,),
              color: AppColors.mainDark),
          title: const Text("Сохраненная планировка",
              style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: -0.17,
                  color: AppColors.mainDark)),
        ),

        body: const Center(child: Text("Сохранений нет!", style: TextStyle(fontSize: 19),)),
      );
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_down_rounded ,size: 30,),
              color: AppColors.mainDark),
          title: const Text("Сохраненная планировка",
              style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: -0.17,
                  color: AppColors.mainDark)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) { return const Divider(); },
            itemCount: model.length,
            itemBuilder: (context, index) {
              final savePlane = model.infoBox[index];
              return Slidable(
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (BuildContext context) {},
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.drive_file_rename_outline_rounded,
                        label: 'Переименовать',
                      ),
                      SlidableAction(
                        onPressed: (BuildContext context) => model.deletedPlane(index),
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Удалить',
                      ),
                    ],
                  ),
                  child: ListTile(
                      title: Text("Запись: ${savePlane.id}", style: const TextStyle(fontSize: 18)),
                      subtitle: Text(
                        "gh"
                          // "${savePlane.data.day}.${savePlane.data.month}.${savePlane.data.year}    ${savePlane.data.hour}:${savePlane.data.minute}"
                      ),
                      onTap: () {
                        // res.save();
                      })
              );
            },
          ),
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
