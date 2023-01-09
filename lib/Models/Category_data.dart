class Category {
  String catName;
  String img;
  bool isExpanded;

  Category({
    required this.catName,
    required this.img,
    this.isExpanded = false,
  });

  static var category = [
    Category(catName: "Столы", img: 'assets/catalog_img/стол.png'),
    Category(catName: "Комод", img: 'assets/catalog_img/комод.png'),
    Category(catName: "Шкаф", img: 'assets/catalog_img/шкаф.png'),
    Category(catName: "Стул", img: 'assets/catalog_img/стул.png'),
    Category(catName: "Кровать", img: 'assets/catalog_img/кровать.png'),
    Category(catName: "Освещение", img: 'assets/catalog_img/торшер.png'),
    Category(catName: "Телевизор", img: 'assets/catalog_img/телевизор.png'),
  ];
}