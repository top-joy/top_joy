import 'package:auto_route/auto_route.dart';
import 'package:top_joy/core/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: MainRoute.page, path: '/main'),
      ];
}
