// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/authentication/data/datasources/login/login_data_source.dart'
    as _i5;
import '../../features/authentication/data/datasources/signup/signup_data_source.dart'
    as _i7;
import '../../features/authentication/data/repositories/login/login_repository_imp.dart'
    as _i10;
import '../../features/authentication/data/repositories/signup/signup_repository_imp.dart'
    as _i13;
import '../../features/authentication/domain/repositories/login/login_repository.dart'
    as _i9;
import '../../features/authentication/domain/repositories/signup/sign_up_repository.dart'
    as _i12;
import '../../features/authentication/domain/usecases/login/login_usecase.dart'
    as _i11;
import '../../features/authentication/domain/usecases/signup/signup_usecase.dart'
    as _i14;
import '../../features/authentication/presentaion/bloc/login/cubit/login_cubit.dart'
    as _i17;
import '../../features/authentication/presentaion/bloc/signup/cubit/signup_cubit.dart'
    as _i18;
import '../../features/jobs_list/data/datasources/job_list_data_source.dart'
    as _i4;
import '../../features/jobs_list/data/repositories/job_repository_imp.dart'
    as _i16;
import '../../features/jobs_list/domain/repositories/jobs_repository.dart'
    as _i15;
import '../../features/jobs_list/domain/usecases/get_jobs_list.dart' as _i19;
import '../../features/jobs_list/presentation/bloc/jobs_cubit/cubit/job_cubit.dart'
    as _i20;
import '../utils/shared_preferance.dart' as _i8;
import 'dio.dart' as _i21;
import 'shared_preferance.dart' as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appDio = _$AppDio();
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => appDio.getDio);
  gh.lazySingleton<_i4.JobListDataSource>(
      () => _i4.JobListDataSource(get<_i3.Dio>()));
  gh.lazySingleton<_i5.LoginDataSource>(
      () => _i5.LoginDataSource(get<_i3.Dio>()));
  await gh.factoryAsync<_i6.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i7.SignupDataSource>(
      () => _i7.SignupDataSource(get<_i3.Dio>()));
  gh.lazySingleton<_i8.LocalDataSource>(
      () => _i8.LocalDataSource(get<_i6.SharedPreferences>()));
  gh.lazySingleton<_i9.LoginRepository>(() => _i10.LoginRepositoryImp(
      dataSource: get<_i5.LoginDataSource>(),
      localDataSource: get<_i8.LocalDataSource>()));
  gh.factory<_i11.LoginUseCase>(
      () => _i11.LoginUseCase(get<_i9.LoginRepository>()));
  gh.lazySingleton<_i12.SignupRepository>(() => _i13.SignupRepositoryImp(
      dataSource: get<_i7.SignupDataSource>(),
      localDataSource: get<_i8.LocalDataSource>()));
  gh.factory<_i14.SignupUseCase>(
      () => _i14.SignupUseCase(get<_i12.SignupRepository>()));
  gh.lazySingleton<_i15.JobsRepositories>(() => _i16.JobRepositoryImp(
      dataSource: get<_i4.JobListDataSource>(),
      localDataSource: get<_i8.LocalDataSource>()));
  gh.factory<_i17.LoginCubit>(() => _i17.LoginCubit(get<_i11.LoginUseCase>()));
  gh.factory<_i18.SignupCubit>(
      () => _i18.SignupCubit(get<_i14.SignupUseCase>()));
  gh.factory<_i19.GetJobList>(
      () => _i19.GetJobList(get<_i15.JobsRepositories>()));
  gh.factory<_i20.JobCubit>(() => _i20.JobCubit(get<_i19.GetJobList>()));
  return get;
}

class _$AppDio extends _i21.AppDio {}

class _$RegisterModule extends _i22.RegisterModule {}
