import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nir_app/Models/Furniture.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/ar_screen/ar_screen_model.dart';
import 'package:provider/provider.dart';

import '../Models/Category_data.dart';
import 'furniture_add_model.dart';
import 'furniture_list_model.dart';

class AddFurniture extends StatefulWidget {
  const AddFurniture({super.key});

  @override
  State<AddFurniture> createState() => _AddFurnitureState();
}

class _AddFurnitureState extends State<AddFurniture> {
  final category = Category.category;


  @override
  Widget build(BuildContext context) {
    final model = context.watch<FurnitureAddModel>();
    final f = model.furniture;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Container(
              child: _buildPanel(f),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel(List<Furniture> f) {
    return ExpansionPanelList(
      elevation: 0,
      animationDuration: const Duration(milliseconds: 500),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          for (int i = 0; i < category.length; i++) {
            if (i == index) {
              category[i].isExpanded = !isExpanded;
            } else {
              category[i].isExpanded = false;
            }
          }
        });
      },
      children: category.map<ExpansionPanel>((category) {
        // final furniture = Models.models.where((m) => m.catName == item.catName).toList();
        int count = 0;
        final furniture = <Furniture>[];
        for (int i = 0; i < f.length; i++) {
          if (f[i].catName == category.catName) {
            count++;
            furniture.add(f[i]);
          }
        }
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(category.catName,
                  style: const TextStyle(fontSize: 18, letterSpacing: 2)),
            );
          },
          canTapOnHeader: true,
          body: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: (BuildContext context, index) {
                  return Card(
                    elevation: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: furniture[index].img,
                          imageBuilder: (context, imageProvider) =>
                              Image.network(furniture[index].img,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                      ARScreenModel(furniture[index].modelUrl);
                                      Navigator.pop(context, furniture[index].modelUrl);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 240, 240, 240)),
                                        minimumSize: MaterialStateProperty.all(
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
              }),
          isExpanded: category.isExpanded,
        );
      }).toList(),
    );
  }
}

// ListTile(
// title: Text(item.expandedValue),
// subtitle:
// const Text('To delete this panel, tap the trash can icon'),
// trailing: const Icon(Icons.delete),
// onTap: () {
// setState(() {
// _data.removeWhere((Item currentItem) => item == currentItem);
// });
// }),
