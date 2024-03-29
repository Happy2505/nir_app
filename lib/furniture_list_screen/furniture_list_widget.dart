import 'package:flutter/material.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/factoryes/screen_factory.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'furniture_list_model.dart';

class FurnitureListWidget extends StatefulWidget {
  FurnitureListWidget({Key? key}) : super(key: key);

  @override
  State<FurnitureListWidget> createState() => _FurnitureListWidgetState();
}

class _FurnitureListWidgetState extends State<FurnitureListWidget> {
  final _screenFactory = ScreenFactory();
  bool isFavorite = false; // Переменная для хранения состояния иконки

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Инвертируем состояние иконки
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<FurnitureListModel>();

    // model.loadFurniture();
    if (model.furniture.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.indexx,
          style: const TextStyle(color: AppColors.mainDark),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.mainDark),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(height: 19),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.furniture.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2.1,
                            mainAxisSpacing: 30),
                    itemBuilder: (BuildContext context, index) {
                      final f = model.furniture;
                      return Card(
                        elevation: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: f[index].img,
                              imageBuilder: (context, imageProvider) =>
                                  Image.network(f[index].img,
                                      width: 100, height: 100),
                              placeholder: (context, url) => Image.asset(
                                  'assets/pla.jpg',
                                  width: 100,
                                  height: 100),
                              errorWidget: (context, url, error) => Image.asset(
                                  'assets/pla.jpg',
                                  width: 100,
                                  height: 100),
                            ),
                            const SizedBox(width: 22),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    f[index].name,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    f[index].description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    _screenFactory.ARScreen(
                                                        f[index].modelUrl)),
                                          );
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
                                                    const Color.fromARGB(
                                                        255, 240, 240, 240)),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(108, 38))),
                                        child: const Text(
                                          'Разместить',
                                          style: TextStyle(
                                              color: AppColors.mainDark,
                                              fontSize: 16),
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                                          color: Colors.red,),
                                        onPressed: () {
                                          toggleFavorite();
                                        },
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
