// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:top_joy/data/service_data/models/service_models.dart' as _i16;
import 'package:top_joy/data/user/models/user_model.dart' as _i17;
import 'package:top_joy/presentation/auth/pages/input_user_info.dart' as _i5;
import 'package:top_joy/presentation/auth/pages/register_page.dart' as _i10;
import 'package:top_joy/presentation/auth/pages/sms_screen.dart' as _i11;
import 'package:top_joy/presentation/detail_screen/pages/detail_screen.dart'
    as _i1;
import 'package:top_joy/presentation/favorite/page/favorite_screen.dart' as _i2;
import 'package:top_joy/presentation/free_time/pages/free_times_screen.dart'
    as _i3;
import 'package:top_joy/presentation/home/pages/home_screen.dart' as _i4;
import 'package:top_joy/presentation/main/pages/main_screen.dart' as _i6;
import 'package:top_joy/presentation/map_screen/pages/map_screen.dart' as _i7;
import 'package:top_joy/presentation/profile/pages/profile_screen.dart' as _i8;
import 'package:top_joy/presentation/profile/pages/user_info_screen.dart'
    as _i13;
import 'package:top_joy/presentation/recomendation/pages/recomendatio_screen.dart'
    as _i9;
import 'package:top_joy/presentation/splash/pages/splash_screen.dart' as _i12;

/// generated route for
/// [_i1.DetailScreen]
class DetailRoute extends _i14.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i15.Key? key,
    required _i16.ServiceModels serviceModels,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            serviceModels: serviceModels,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
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

  final _i15.Key? key;

  final _i16.ServiceModels serviceModels;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, serviceModels: $serviceModels}';
  }
}

/// generated route for
/// [_i2.FavoriteScreen]
class FavoriteRoute extends _i14.PageRouteInfo<void> {
  const FavoriteRoute({List<_i14.PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i3.FreeTimesPage]
class FreeTimesRoute extends _i14.PageRouteInfo<FreeTimesRouteArgs> {
  FreeTimesRoute({
    _i15.Key? key,
    required String serviceId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          FreeTimesRoute.name,
          args: FreeTimesRouteArgs(
            key: key,
            serviceId: serviceId,
          ),
          initialChildren: children,
        );

  static const String name = 'FreeTimesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FreeTimesRouteArgs>();
      return _i3.FreeTimesPage(
        key: args.key,
        serviceId: args.serviceId,
      );
    },
  );
}

class FreeTimesRouteArgs {
  const FreeTimesRouteArgs({
    this.key,
    required this.serviceId,
  });

  final _i15.Key? key;

  final String serviceId;

  @override
  String toString() {
    return 'FreeTimesRouteArgs{key: $key, serviceId: $serviceId}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.InputUserInfo]
class InputUserInfo extends _i14.PageRouteInfo<InputUserInfoArgs> {
  InputUserInfo({
    _i15.Key? key,
    required String phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          InputUserInfo.name,
          args: InputUserInfoArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'InputUserInfo';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InputUserInfoArgs>();
      return _i5.InputUserInfo(
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

  final _i15.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'InputUserInfoArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainScreen();
    },
  );
}

/// generated route for
/// [_i7.MapScreen]
class MapRoute extends _i14.PageRouteInfo<void> {
  const MapRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.MapScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.RecomendatioScreen]
class RecomendatioRoute extends _i14.PageRouteInfo<void> {
  const RecomendatioRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RecomendatioRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecomendatioRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.RecomendatioScreen();
    },
  );
}

/// generated route for
/// [_i10.RegisterPage]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.RegisterPage();
    },
  );
}

/// generated route for
/// [_i11.SmsScreen]
class SmsRoute extends _i14.PageRouteInfo<SmsRouteArgs> {
  SmsRoute({
    _i15.Key? key,
    required String phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SmsRoute.name,
          args: SmsRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'SmsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SmsRouteArgs>();
      return _i11.SmsScreen(
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

  final _i15.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.UserInfoScreen]
class UserInfoRoute extends _i14.PageRouteInfo<UserInfoRouteArgs> {
  UserInfoRoute({
    _i15.Key? key,
    required _i17.UserModel userModel,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UserInfoRoute.name,
          args: UserInfoRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UserInfoRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserInfoRouteArgs>();
      return _i13.UserInfoScreen(
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

  final _i15.Key? key;

  final _i17.UserModel userModel;

  @override
  String toString() {
    return 'UserInfoRouteArgs{key: $key, userModel: $userModel}';
  }
}
