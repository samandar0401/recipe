class CommunityUserModel {
  final int id;
  final String profilePhoto;
  final String username, firstName, lastname;

  CommunityUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastname,
  });

  factory CommunityUserModel.fromJson(Map<String, dynamic> json) {
    return CommunityUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'].toString(),
      firstName: json['firstName'],
      lastname: json['lastName'],
    );
  }
}
