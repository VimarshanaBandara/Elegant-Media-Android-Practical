import 'package:myproject/models/image_model.dart';

class Post {
  final int id;
  final String description;
  final String title;
  final String postcode;
  final String phoneNumber;
  final String latitude;
  final String address;
  final String longitude;
  final ImageModel image;

  Post({
    required this.id,
    required this.description,
    required this.title,
    required this.postcode,
    required this.phoneNumber,
    required this.latitude,
    required this.address,
    required this.longitude,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postcode: json["postcode"],
      phoneNumber: json["phoneNumber"],
      latitude: json["latitude"],
      image: ImageModel.fromJson(json["image"]),
      address: json["address"],
      longitude: json["longitude"],
      id: json["id"],
      description: json["description"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postcode': postcode,
      'phoneNumber': phoneNumber,
      'latitude': latitude,
      'image': image.toMap(),
      'address': address,
      'longitude': longitude,
      'id': id,
      'description': description,
      'title': title,
    };
  }
}
