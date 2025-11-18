class CurrentUserModel {
  final String id;
  final String email;
  final String? fullName;
  final String? avatarUrl;

  CurrentUserModel({
    required this.id,
    required this.email,
    this.fullName,
    this.avatarUrl,
  });

  factory CurrentUserModel.fromMap(Map<String, dynamic> map) {
    return CurrentUserModel(
      id: map['id'],
      email: map['email'],
      fullName: map['full_name'],
      avatarUrl: map['avatar_url'],
    );
  }
}
