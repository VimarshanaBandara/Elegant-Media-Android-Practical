class ImageModel {
  final String small;
  final String medium;
  final String large;

  ImageModel({
    required this.small,
    required this.medium,
    required this.large,
  });

  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'medium': medium,
      'large': large,
    };
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        small: json["small"], medium: json["medium"], large: json["large"]);
  }
}
