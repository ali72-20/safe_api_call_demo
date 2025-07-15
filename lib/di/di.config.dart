// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../data/api/api_manager.dart' as _i93;
import '../data/api/network_modul.dart' as _i774;
import '../data/data_source/remote_data_source/remote_data_source_contract.dart'
    as _i637;
import '../data/data_source/remote_data_source/remote_data_source_impl.dart'
    as _i692;
import '../data/repo/repo_impl.dart' as _i292;
import '../domain/repo/repo_contract.dart' as _i997;
import '../domain/use_case/use_case.dart' as _i355;
import '../presentation/ui/screen/managers/view_model.dart' as _i557;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioProvider = _$DioProvider();
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.singleton<_i93.ApiManager>(() => _i93.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i637.RemoteDataSourceContract>(
      () => _i692.RemoteDataSourceImpl(gh<_i93.ApiManager>()),
    );
    gh.factory<_i997.RepoContract>(
      () => _i292.RepoImpl(gh<_i637.RemoteDataSourceContract>()),
    );
    gh.factory<_i355.UseCase>(() => _i355.UseCase(gh<_i997.RepoContract>()));
    gh.factory<_i557.ViewModel>(() => _i557.ViewModel(gh<_i355.UseCase>()));
    return this;
  }
}

class _$DioProvider extends _i774.DioProvider {}
