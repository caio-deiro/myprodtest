import 'package:myprodtest/src/home/models/github_user_model.dart';

import '../models/github_repo_model.dart';

abstract class HomeRepository {
  Future<List<GithubRepoModel>> getRepoFromGitHub();
  Future<List<GithubRepoModel>> getStarredRepoFromGitHub();
  Future<GithubUserModel> getUserInfo();
}
