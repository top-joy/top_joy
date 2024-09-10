// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:top_joy/data/service_data/models/service_models.dart' as _i13;
import 'package:top_joy/presentation/auth/pages/input_user_info.dart' as _i3;
import 'package:top_joy/presentation/auth/pages/register_page.dart' as _i8;
import 'package:top_joy/presentation/auth/pages/sms_screen.dart' as _i9;
import 'package:top_joy/presentation/detail_screen/pages/detail_screen.dart'
    as _i1;
import 'package:top_joy/presentation/home/pages/home_screen.dart' as _i2;
import 'package:top_joy/presentation/main/pages/main_screen.dart' as _i4;
import 'package:top_joy/presentation/map_screen/pages/map_screen.dart' as _i5;
import 'package:top_joy/presentation/profile/pages/profile_screen.dart' as _i6;
import 'package:top_joy/presentation/recomendation/pages/recomendatio_screen.dart'
    as _i7;
import 'package:top_joy/presentation/splash/pages/splash_screen.dart' as _i10;

/// generated route for
/// [_i1.DetailScreen]
class DetailRoute extends _i11.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i12.Key? key,
    required _i13.ServiceModels serviceModels,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            serviceModels: serviceModels,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
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

  final _i12.Key? key;

  final _i13.ServiceModels serviceModels;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, serviceModels: $serviceModels}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.InputUserInfo]
class InputUserInfo extends _i11.PageRouteInfo<InputUserInfoArgs> {
  InputUserInfo({
    _i12.Key? key,
    required String phoneNumber,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          InputUserInfo.name,
          args: InputUserInfoArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'InputUserInfo';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InputUserInfoArgs>();
      return _i3.InputUserInfo(
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

  final _i12.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'InputUserInfoArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainScreen();
    },
  );
}

/// generated route for
/// [_i5.MapScreen]
class MapRoute extends _i11.PageRouteInfo<void> {
  const MapRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.MapScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.RecomendatioScreen]
class RecomendatioRoute extends _i11.PageRouteInfo<void> {
  const RecomendatioRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RecomendatioRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecomendatioRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.RecomendatioScreen();
    },
  );
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.RegisterPage();
    },
  );
}

/// generated route for
/// [_i9.SmsScreen]
class SmsRoute extends _i11.PageRouteInfo<SmsRouteArgs> {
  SmsRoute({
    _i12.Key? key,
    required String phoneNumber,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SmsRoute.name,
          args: SmsRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'SmsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SmsRouteArgs>();
      return _i9.SmsScreen(
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

  final _i12.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'SmsRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashScreen();
    },
  );
}
