import 'package:auto_route/auto_route.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: MainRoute.page, path: '/main'),
        AutoRoute(page: HomeRoute.page, path: '/home'),
        AutoRoute(page: RecomendatioRoute.page, path: '/recomendation'),
        AutoRoute(page: DetailRoute.page, path: '/detail'),
        AutoRoute(page: MapRoute.page, path: '/map'),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
        AutoRoute(page: SmsRoute.page, path: '/sms_input'),
        AutoRoute(page: ProfileRoute.page,path: '/profile'),
        AutoRoute(page: InputUserInfo.page,path: '/inputUser'),
        AutoRoute(page: FavoriteRoute.page,path: '/favorite'),
        AutoRoute(page: UserInfoRoute.page,path: '/userInfo'),
        AutoRoute(page: FreeTimesRoute.page,path: '/freeTime')
      ];
}
