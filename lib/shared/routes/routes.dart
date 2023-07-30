import 'package:auto_route/auto_route.dart';

import '../../app_init_screen.dart';
import '../../application_screen.dart';
import '../../auth/presentation/login_screen.dart';
import '../../auth/presentation/register_screen.dart';
import '../../product/presentation/pages/product_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppInitRoute.page,
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ApplicationRoute.page),
        AutoRoute(page: ProductRoute.page),
      ];
}
