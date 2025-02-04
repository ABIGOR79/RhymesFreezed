import 'package:auto_route/auto_route.dart';
import 'package:poem/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page, path: '/', children: [
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: FavoriteRoute.page, path: 'favorite'),
          AutoRoute(page: HistoryRoute.page, path: 'history'),
          AutoRoute(page: SettingsRoute.page, path: 'settings'),
        ]),
      ];
}
