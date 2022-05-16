import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  String title;
  String type;
  double price;
  String? description;
  String? filename;
  int? height;
  int? width;
  DateTime? createdAt;
  int? rating;
  String? imageUrl;

  bool get hasImage => filename != null && filename!.isNotEmpty;

  String get widthString => width == null ? '' : width.toString();

  String get heightString => height == null ? '' : height.toString();

  String get priceString =>
      "R\$ " + price.toStringAsFixed(2).replaceAll(".", ",");

  Product({
    this.id,
    required this.title,
    required this.type,
    required this.price,
    this.description,
    this.filename,
    this.height,
    this.width,
    this.createdAt,
    this.rating,
    this.imageUrl,
  });

  factory Product.fromJson(String keyId, json) {
    return Product(
      id: keyId,
      title: json['title'],
      type: json['type'],
      description: json['description'],
      filename: json['filename'],
      height: json['height'],
      width: json['width'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
          : null,
      rating: json['rating'],
    );
  }

  static double priceFromString(String value) {
    value = value.replaceAll("R\$ ", "").replaceAll(",", ".");
    return double.parse(value);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['filename'] = filename;
    data['height'] = height;
    data['width'] = width;
    data['price'] = price;
    data['createdAt'] = createdAt?.millisecondsSinceEpoch;
    data['rating'] = rating;
    data['imageUrl'] = imageUrl;
    return data;
  }

  @override
  List<Object?> get props => [id, title, type, price];
}
