import 'package:get/get.dart';
import 'package:myprodtest/src/home/errors/app_errors.dart';
import 'package:myprodtest/src/home/models/github_repo_model.dart';
import 'package:myprodtest/src/home/models/github_user_model.dart';
import 'package:myprodtest/src/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  /// Observable Variables

  var githubRepoList = <GithubRepoModel>[].obs;
  var githubRepoListImmutable = <GithubRepoModel>[].obs;
  var githubStarredList = <GithubRepoModel>[].obs;
  var githubStarredListImmutable = <GithubRepoModel>[].obs;
  final githubUser = GithubUserModel().obs;
  var currentIndex = 0.obs;

  var loading = false.obs;

  /// Sync Methods
  filterRepoList(String text) {
    var filteredList = githubRepoListImmutable;
    githubRepoList.value = filteredList
        .where((repo) => repo.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  filterStarredList(String text) {
    var filteredList = githubStarredListImmutable;
    githubStarredList.value = filteredList
        .where((repo) => repo.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  /// Asyncronous methods
  ///
  ///

  Future<void> getUserFromGitHub() async {
    loading.value = true;
    try {
      final result = await repository.getRepoFromGitHub();
      githubRepoListImmutable.value = result;

      githubRepoList.value = githubRepoListImmutable;
    } on AppDioError catch (e) {
      throw AppDioError(e.message);
    } finally {
      loading.value = false;
    }
  }

  Future<void> getStarredUserRepoFromGitHub() async {
    loading.value = true;
    try {
      final result = await repository.getStarredRepoFromGitHub();
      githubStarredListImmutable.value = result;
      githubStarredList.value = githubStarredListImmutable;
    } on AppDioError catch (e) {
      throw AppDioError(e.message);
    } finally {
      loading.value = false;
    }
  }

  Future<void> getUserInfo() async {
    loading.value = true;
    try {
      final result = await repository.getUserInfo();
      githubUser.value = result;
    } on AppDioError catch (e) {
      throw AppDioError(e.message);
    } finally {
      loading.value = false;
    }
  }
}
