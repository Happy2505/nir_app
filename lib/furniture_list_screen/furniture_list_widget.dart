import 'package:flutter/material.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/factoryes/screen_factory.dart';

class FurnitureListWidget extends StatelessWidget {
  FurnitureListWidget({Key? key}) : super(key: key);
  final _screenFactory = ScreenFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Столы',
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
                TextField(
                    decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(10),
                        labelText: 'Поиск...',
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.search, color: Colors.black),
                            onPressed: () {}),
                        filled: true,
                        fillColor: Colors.white.withAlpha(235),
                        border: const OutlineInputBorder())),
                const SizedBox(height: 35),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Models.models.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2.4,
                            mainAxisSpacing: 30),
                    itemBuilder: (BuildContext context, index) {
                      final furniture = Models.models[index];
                      return Card(
                        elevation: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(furniture.img),
                            const SizedBox(width: 22),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    furniture.description,
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
                                              builder: (_) => _screenFactory.ARScreen(index)),
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
