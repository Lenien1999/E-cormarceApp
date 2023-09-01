import 'package:lorem_ipsum/lorem_ipsum.dart' as lorem;

class Products {
  String title;
  String images;
  String variant;
  String description;
  int quantity;
  bool isSelected;
  double price;
  Products({
    required this.isSelected,
    this.quantity = 1,
    required this.description,
    required this.images,
    required this.price,
    required this.variant,
    required this.title,
  });
}

final List<Products> productList = [
  Products(
      description: lorem.loremIpsum(words: 50),
      images: "assets/images/img.png",
      price: 22.34,
      variant: "grey",
      title: "Monitor LG 22 'INK4'",
      isSelected: false),
  Products(
      isSelected: false,
      description: lorem.loremIpsum(words: 50),
      images: "assets/images/img2.png",
      price: 199.34,
      variant: "Combol",
      title: "Aesthetic Mug white"),
  Products(
      isSelected: false,
      description: lorem.loremIpsum(words: 50),
      images: "assets/images/img3.png",
      price: 199.34,
      variant: "Combol",
      title: "Airpod pro"),
  Products(
      isSelected: false,
      description: lorem.loremIpsum(words: 50),
      images: "assets/images/img4.png",
      price: 199.34,
      variant: "Combol",
      title: "Playstore 4-ssd"),
  Products(
      isSelected: false,
      description: lorem.loremIpsum(words: 50),
      images: "assets/images/img2.png",
      price: 199.34,
      variant: "Combol",
      title: "Mac Book Pro"),
  Products(
      isSelected: false,
      description: lorem.loremIpsum(words: 50),
      images: "assets/images/img2.png",
      price: 199.34,
      variant: "Combol",
      title: "Black T-shirt"),
];
