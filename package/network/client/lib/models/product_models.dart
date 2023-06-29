class ProductModels {
  final List<Product>? bestProduct;
  final List<Product>? allProduct;

  ProductModels({this.bestProduct, this.allProduct});

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
      allProduct: json['allProduct'] != null
          ? List<Product>.from(
              json['allProduct'].map((e) => Product.fromJson(e)))
          : null,
      bestProduct: json['bestProduct'] != null
          ? List<Product>.from(
              json['bestProduct'].map((e) => Product.fromJson(e)))
          : null);

  Map<String, dynamic> toJson() => {
        'allProduct': allProduct ??
            List<dynamic>.from(allProduct!.map((e) => e.toJson())),
        'bestProduct': bestProduct ??
            List<dynamic>.from(bestProduct!.map((e) => e.toJson()))
      };
}

class Product {
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? description;

  Product({this.id, this.name, this.imageUrl, this.description});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['productDescription']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'productDescription': description
      };
}
