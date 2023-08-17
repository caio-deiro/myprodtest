// ignore_for_file: public_member_api_docs, sort_constructors_first

class GithubUserModel {
  final String? login;
  final String? bio;

  GithubUserModel({
    this.login,
    this.bio,
  });

  factory GithubUserModel.fromMap(Map<String, dynamic> map) {
    return GithubUserModel(
      login: map['login'] != null ? map['login'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
    );
  }
}
