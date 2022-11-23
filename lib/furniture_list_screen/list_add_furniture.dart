import 'package:flutter/material.dart';
import 'package:nir_app/Models/Models_data.dart';
import 'package:nir_app/Theme/app_color.dart';
import 'package:nir_app/ar_screen/ar_screen_model.dart';

class Category {
  String catName;
  bool isExpanded;

  Category({
    required this.catName,
    this.isExpanded = false,
  });

  static var category = [
    Category(catName: "Стол"),
    Category(catName: "Комод"),
    Category(catName: "Шкаф"),
    Category(catName: "Стул"),
    Category(catName: "Кровать"),
  ];
}


class AddFurniture extends StatefulWidget {
  const AddFurniture({super.key});

  @override
  State<AddFurniture> createState() => _AddFurnitureState();
}

class _AddFurnitureState extends State<AddFurniture> {
  final category = Category.category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Container(
              child: _buildPanel(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      elevation: 0,
      animationDuration: const Duration(seconds: 1),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          category[index].isExpanded = !isExpanded;
        });
      },
      children: category.map<ExpansionPanel>((Category item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.catName, style: const TextStyle(fontSize: 18, letterSpacing: 2)),
            );
          },
          canTapOnHeader: true,
          body: GridView.builder(
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
                                    ARScreenModel(index);
                                    Navigator.pop(context, index);
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
              }),
          isExpanded: item.isExpanded,
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
