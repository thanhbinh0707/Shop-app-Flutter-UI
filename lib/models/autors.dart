class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "Perter", image: "assets/images/Picture1.png"),
  Category(title: "Martin", image: "assets/images/Picture2.png"),
  Category(title: "Poppys", image: "assets/images/Profile Image.png"),
  Category(title: "Maxim", image: "assets/images/Picture2.png"),
  Category(title: "Jarm", image: "assets/images/Picture1.png"),
  Category(title: "Jenny", image: "assets/images/Profile Image.png"),
];
