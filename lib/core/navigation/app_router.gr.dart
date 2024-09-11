// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:top_joy/data/service_data/models/service_models.dart' as _i15;
import 'package:top_joy/data/user/models/user_model.dart' as _i16;
import 'package:top_joy/presentation/auth/pages/input_user_info.dart' as _i4;
import 'package:top_joy/presentation/auth/pages/register_page.dart' as _i9;
import 'package:top_joy/presentation/auth/pages/sms_screen.dart' as _i10;
import 'package:top_joy/presentation/detail_screen/pages/detail_screen.dart'
    as _i1;
import 'package:top_joy/presentation/favorite/page/favorite_screen.dart' as _i2;
import 'package:top_joy/presentation/home/pages/home_screen.dart' as _i3;
import 'package:top_joy/presentation/main/pages/main_screen.dart' as _i5;
import 'package:top_joy/presentation/map_screen/pages/map_screen.dart' as _i6;
import 'package:top_joy/presentation/profile/pages/profile_screen.dart' as _i7;
import 'package:top_joy/presentation/profile/pages/user_info_screen.dart'
    as _i12;
import 'package:top_joy/presentation/recomendation/pages/recomendatio_screen.dart'
    as _i8;
import 'package:top_joy/presentation/splash/pages/splash_screen.dart' as _i11;

/// generated route for
/// [_i1.DetailScreen]
class DetailRoute extends _i13.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i14.Key? key,
    required _i15.ServiceModels serviceModels,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            serviceModels: serviceModels,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return _i1.DetailScreen(
        key: args.key,
        serviceModels: args.serviceModels,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.serviceModels,
  });

  final _i14.Key? key;

  final _i15.ServiceModels serviceModels;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, serviceModels: $serviceModels}';
  }
}

/// generated route for
/// [_i2.FavoriteScreen]
class FavoriteRoute extends _i13.PageRouteInfo<void> {
  const FavoriteRoute({List<_i13.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.InputUserInfo]
class InputUserInfo extends _i13.PageRouteInfo<InputUserInfoArgs> {
  InputUserInfo({
    _i14.Key? key,
    required String phoneNumber,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          InputUserInfo.name,
          args: InputUserInfoArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'InputUserInfo';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InputUserInfoArgs>();
      return _i4.InputUserInfo(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class InputUserInfoArgs {
  const InputUserInfoArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i14.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'InputUserInfoArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i5.MainScreen]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainScreen();
    },
  );
}

/// generated route for
/// [_i6.MapScreen]
class MapRoute extends _i13.PageRouteInfo<void> {
  const MapRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.MapScreen();
    },
  );
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.RecomendatioScreen]
class RecomendatioRoute extends _i13.PageRouteInfo<void> {
  const RecomendatioRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RecomendatioRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecomendatioRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.RecomendatioScreen();
    },
  );
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterPage();
    },
  );
}

/// generated route for
/// [_i10.SmsScreen]
class SmsRoute extends _i13.PageRouteInfo<SmsRouteArgs> {
  SmsRoute({
    _i14.Key? key,
    required String phoneNumber,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SmsRoute.name,
          args: SmsRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'SmsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SmsRouteArgs>();
      return _i10.SmsScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class SmsRouteArgs {
  const SmsRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i14.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}

/// generated route for
/// [_i12.UserInfoScreen]
class UserInfoRoute extends _i13.PageRouteInfo<UserInfoRouteArgs> {
  UserInfoRoute({
    _i14.Key? key,
    required _i16.UserModel userModel,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          UserInfoRoute.name,
          args: UserInfoRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserInfoRouteArgs>();
      return _i12.UserInfoScreen(
        key: args.key,
        userModel: args.userModel,
      );
    },
  );
}

class UserInfoRouteArgs {
  const UserInfoRouteArgs({
    this.key,
    required this.userModel,
  });

  final _i14.Key? key;

  final _i16.UserModel userModel;

  @override
  String toString() {
    return 'UserInfoRouteArgs{key: $key, userModel: $userModel}';
  }
}
