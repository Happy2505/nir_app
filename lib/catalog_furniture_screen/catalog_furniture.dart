import 'package:flutter/material.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/Theme/app_color.dart';

import '../factoryes/screen_factory.dart';
import '../furniture_list_screen/furniture_list_widget.dart';

class CatalogFurniture extends StatelessWidget {
  const CatalogFurniture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenFactory = ScreenFactory();

    return SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16, right: 16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Каталог',
                    style: TextStyle(
                        fontSize: 32,
                        color: AppColors.mainDark,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 35),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemCount: 6,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (_) => _screenFactory.FurniturePage(index)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: const Color.fromARGB(255, 240, 240, 240),
                            ),
                            child: Stack(
                              children: [
                                const Positioned(
                                    top: 8,
                                    left: 11,
                                    child: Text(
                                      'Столы',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.mainDark,
                                          fontWeight: FontWeight.w600),
                                    )),
                                Positioned(
                                    bottom: 3,
                                    right: 3,
                                    child: Image.asset(
                                        'assets/catalog_img/стол.png')),
                              ],
                            ),
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
