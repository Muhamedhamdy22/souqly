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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/Api/api_manager.dart' as _i795;
import 'core/cache_helper/cache_helper.dart' as _i891;
import 'features/Auth/data/data_source/auth_ds.dart' as _i579;
import 'features/Auth/data/data_source/auth_ds_impl.dart' as _i971;
import 'features/Auth/data/repo/auth_repo_impl.dart' as _i899;
import 'features/Auth/domain/repo/auth_repo.dart' as _i943;
import 'features/Auth/domain/usecase/login_use_case.dart' as _i495;
import 'features/Auth/domain/usecase/register_use_case.dart' as _i573;
import 'features/Auth/presentation/bloc/auth_bloc.dart' as _i172;
import 'features/cart/data/datasource/cart_ds.dart' as _i284;
import 'features/cart/data/datasource/cart_ds_impl.dart' as _i733;
import 'features/cart/domain/repo/cart_repo.dart' as _i411;
import 'features/cart/domain/usecase/cart_usecase.dart' as _i529;
import 'features/categories/data/datasource/category_ds.dart' as _i568;
import 'features/categories/data/datasource/category_ds_impl.dart' as _i33;
import 'features/categories/data/repo/category_repo_impl.dart' as _i950;
import 'features/categories/domain/repo/category_repo.dart' as _i1031;
import 'features/categories/domain/usecase/category_use_case.dart' as _i559;
import 'features/categories/presentation/bloc/category_bloc.dart' as _i2;
import 'features/home/data/datasource/home_ds.dart' as _i629;
import 'features/home/data/datasource/home_ds_impl.dart' as _i184;
import 'features/home/data/repo/home_repo_impl.dart' as _i516;
import 'features/home/domain/repo/home_repo.dart' as _i738;
import 'features/home/domain/usecase/home_use_case.dart' as _i445;
import 'features/home/presentation/bloc/home_bloc.dart' as _i123;
import 'features/products/data/datasource/Product_ds.dart' as _i751;
import 'features/products/data/datasource/product_ds_impl.dart' as _i870;
import 'features/products/data/repo/Product_repo_impl.dart' as _i833;
import 'features/products/domain/repo/product_repo.dart' as _i221;
import 'features/products/domain/usecase/product_use_case.dart' as _i587;
import 'features/products/presentation/bloc/product_bloc.dart' as _i276;
import 'features/search/presentation/bloc/search_bloc.dart' as _i944;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i795.ApiManager>(() => _i795.ApiManager());
    gh.factory<_i568.CategoryDs>(
        () => _i33.CategoryDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i629.HomeDs>(() => _i184.HomeDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i751.ProductDs>(
        () => _i870.ProductDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i579.AuthDs>(() => _i971.AuthDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i943.AuthRepo>(() => _i899.AuthRepoImpl(gh<_i579.AuthDs>()));
    gh.factory<_i529.CartUseCase>(
        () => _i529.CartUseCase(gh<_i411.CartRepo>()));
    gh.factory<_i221.ProductRepo>(
        () => _i833.ProductRepoImpl(gh<_i751.ProductDs>()));
    gh.lazySingleton<_i891.CacheHelper>(
        () => _i891.CacheHelper(gh<_i460.SharedPreferences>()));
    gh.factory<_i1031.CategoryRepo>(
        () => _i950.CategoryRepoImpl(gh<_i568.CategoryDs>()));
    gh.factory<_i738.HomeRepo>(() => _i516.HomeRepoImpl(gh<_i629.HomeDs>()));
    gh.factory<_i284.CartDs>(() => _i733.CartDsImpl(
          gh<_i795.ApiManager>(),
          gh<_i891.CacheHelper>(),
        ));
    gh.factory<_i587.ProductUseCase>(
        () => _i587.ProductUseCase(gh<_i221.ProductRepo>()));
    gh.factory<_i495.LoginUseCase>(
        () => _i495.LoginUseCase(gh<_i943.AuthRepo>()));
    gh.factory<_i573.RegisterUseCase>(
        () => _i573.RegisterUseCase(gh<_i943.AuthRepo>()));
    gh.factory<_i445.HomeUseCase>(
        () => _i445.HomeUseCase(gh<_i738.HomeRepo>()));
    gh.factory<_i559.CategoryUseCase>(
        () => _i559.CategoryUseCase(gh<_i1031.CategoryRepo>()));
    gh.factory<_i276.ProductBloc>(
        () => _i276.ProductBloc(gh<_i587.ProductUseCase>()));
    gh.factory<_i123.HomeBloc>(() => _i123.HomeBloc(gh<_i445.HomeUseCase>()));
    gh.factory<_i944.SearchBloc>(
        () => _i944.SearchBloc(gh<_i445.HomeUseCase>()));
    gh.factory<_i172.AuthBloc>(() => _i172.AuthBloc(
          gh<_i495.LoginUseCase>(),
          gh<_i573.RegisterUseCase>(),
        ));
    gh.factory<_i2.CategoryBloc>(
        () => _i2.CategoryBloc(gh<_i559.CategoryUseCase>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i891.SharedPreferencesModule {}
