// ignore_for_file: public_member_api_docs, sort_constructors_first
class LandModel {
  late String location;
  late String size;
  late String image;
  late String id;
  late String owner;
  late String description;
  late String price;

  LandModel({
    required this.location,
    required this.size,
    required this.image,
    required this.id,
    required this.owner,
    required this.description,
    required this.price,
  });

  factory LandModel.fromJson(Map<String, dynamic> json) {
    return LandModel(
      location: json['location'],
      size: json['size'],
      image: json['image'],
      id: json['id'],
      owner: json['owner'],
      description: json['description'],
      price: json['price'],
    );
  }
}
