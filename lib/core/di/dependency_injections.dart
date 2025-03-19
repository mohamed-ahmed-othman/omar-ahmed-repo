import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oop/core/networking/api_service.dart';
import 'package:oop/core/networking/dio_factory.dart';
import 'package:oop/features/login/data/repository/login_repo.dart';
import 'package:oop/features/login/logic/cubit/login_cubit.dart';
import 'package:oop/features/signup/data/repo/sign_up_repo.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register your dependencies here
  // Example:
  // getIt.registerSingleton<YourService>(YourServiceImplementation());

  // Dio & api service
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // LoginRepo
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  // LoginCubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // signUpRepo
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  // signUpCubit
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
