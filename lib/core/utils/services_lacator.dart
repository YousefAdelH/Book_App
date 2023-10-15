import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import 'api_sevice.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoimpl>(HomeRepoimpl(
    getIt.get<ApiService>(),
  ));
}
