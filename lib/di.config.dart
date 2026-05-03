// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/Api/api_manager.dart' as _i795;
import 'features/Auth/data/data_source/auth_ds.dart' as _i579;
import 'features/Auth/data/data_source/auth_ds_impl.dart' as _i971;
import 'features/Auth/data/repo/auth_repo_impl.dart' as _i899;
import 'features/Auth/domain/repo/auth_repo.dart' as _i943;
import 'features/Auth/domain/usecase/login_use_case.dart' as _i495;
import 'features/Auth/domain/usecase/register_use_case.dart' as _i573;
import 'features/Auth/presentation/bloc/auth_bloc.dart' as _i172;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i795.ApiManager>(() => _i795.ApiManager());
    gh.factory<_i579.AuthDs>(() => _i971.AuthDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i943.AuthRepo>(() => _i899.AuthRepoImpl(gh<_i579.AuthDs>()));
    gh.factory<_i495.LoginUseCase>(
        () => _i495.LoginUseCase(gh<_i943.AuthRepo>()));
    gh.factory<_i573.RegisterUseCase>(
        () => _i573.RegisterUseCase(gh<_i943.AuthRepo>()));
    gh.factory<_i172.AuthBloc>(() => _i172.AuthBloc(
          gh<_i495.LoginUseCase>(),
          gh<_i573.RegisterUseCase>(),
        ));
    return this;
  }
}
