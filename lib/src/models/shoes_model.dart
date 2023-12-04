class ShoesModel {
  int id;
  String name;
  String brand;
  double price;
  String description;
  String imageAsset;

  ShoesModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.description,
    required this.imageAsset,
  });
}

var shoesModelList = [
  ShoesModel(
    id: 1,
    name: "Nike Air Max 97 OG",
    brand: "Nike",
    price: 2849000,
    description:
        "Push your style full speed ahead with the Nike Air Max 97 OG. Its iconic design takes inspiration from water droplets and Japanese bullet trains. Full-length Nike Air cushioning lets you ride in first-class comfort.",
    imageAsset: "assets/images/product/shoes_1.png",
  ),
  ShoesModel(
    id: 2,
    name: "Air Jordan 1 Mid",
    brand: "Nike",
    price: 1939000,
    description:
        "Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.",
    imageAsset: "assets/images/product/shoes_2.png",
  ),
];
