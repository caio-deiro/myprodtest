import 'package:dio/dio.dart';
import 'package:myprodtest/src/home/errors/app_errors.dart';
import 'package:myprodtest/src/home/models/github_repo_model.dart';
import 'package:myprodtest/src/home/models/github_user_model.dart';
import 'package:myprodtest/src/home/repository/home_repository.dart';
import 'package:myprodtest/src/shared/services/dio/dio_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DioService dio;

  HomeRepositoryImpl(this.dio);
  @override
  Future<List<GithubRepoModel>> getRepoFromGitHub() async {
    try {
      final response = await dio.get('/users/Caio-Deiro/repos');
      final result = (response.data as List)
          .map<GithubRepoModel>((e) => GithubRepoModel.fromMap(e))
          .toList();
      return result;
    } on DioException catch (e, stk) {
      AppDioError('Houve um erro de requisição, tente novamente!', stk);
      rethrow;
    }
  }

  @override
  Future<List<GithubRepoModel>> getStarredRepoFromGitHub() async {
    try {
      final response = await dio.get('/user/starred');
      final result = (response.data as List)
          .map<GithubRepoModel>((e) => GithubRepoModel.fromMap(e))
          .toList();
      return result;
    } on DioException catch (e, stk) {
      AppDioError('Houve um erro de requisição, tente novamente!', stk);
      rethrow;
    }
  }

  @override
  Future<GithubUserModel> getUserInfo() async {
    try {
      final response = await dio.get('/user');
      return GithubUserModel.fromMap(response.data);
    } on DioException catch (e, stk) {
      AppDioError('Houve um erro de requisição, tente novamente!', stk);
      rethrow;
    }
  }
}
