import 'package:flutter/material.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/factoryes/screen_factory.dart';
import 'package:provider/provider.dart';

import 'furniture_list_model.dart';

class FurnitureListWidget extends StatelessWidget {
  FurnitureListWidget({Key? key}) : super(key: key);
  final _screenFactory = ScreenFactory();

  @override
  Widget build(BuildContext context) {
    final model = context.read<FurnitureListModel>();
    final furniture = Models.models.where((m) => m.catName == model.indexx).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.indexx,
          style: TextStyle(color: AppColors.mainDark),
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
                    itemCount: 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2.1,
                            mainAxisSpacing: 30),
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        elevation: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(furniture[index].img, width: 100, height: 100,),
                            const SizedBox(width: 22),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                     furniture[index].name,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    furniture[index].description,
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
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (_) => _screenFactory.ARScreen(furniture[index].catName)),
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
                                        icon: const Icon(
                                            Icons.bookmark_border_rounded),
                                        onPressed: () {},
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
