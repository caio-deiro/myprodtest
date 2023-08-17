// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GithubRepoModel {
  final String? name;
  final String? description;
  final String? language;
  final int? forks;
  final int? stargazers_count;

  GithubRepoModel({
    required this.name,
    required this.description,
    required this.language,
    required this.forks,
    required this.stargazers_count,
  });

  factory GithubRepoModel.fromMap(Map<String, dynamic> map) {
    return GithubRepoModel(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      forks: map['forks'] != null ? map['forks'] as int : null,
      stargazers_count: map['stargazers_count'] != null
          ? map['stargazers_count'] as int
          : null,
    );
  }

  factory GithubRepoModel.fromJson(String source) =>
      GithubRepoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
