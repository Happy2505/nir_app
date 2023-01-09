import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:nir_app/profile_screen/save_plane_model.dart';
import 'package:provider/provider.dart';

import '../Models/Models_data.dart';
import '../Theme/app_color.dart';
import '../factoryes/screen_factory.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void dispose() async {
    Hive.close();
    super.dispose();
  }

  final _screenFactory = ScreenFactory();

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
              ),
              color: AppColors.mainDark),
          title: const Text("Избранное",
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
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              final furniture = Models.models[index];
              return Slidable(
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (BuildContext context) => () {},
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.bookmark_border_rounded,
                        label: 'Удалить',
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(furniture.img, width: 100, height: 100,),
                        const SizedBox(width: 22),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8, top: 8),
                            child: Text(
                              furniture.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            },
          ),
        ));
  }
}
