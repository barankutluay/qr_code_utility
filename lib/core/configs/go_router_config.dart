import 'package:go_router/go_router.dart';
import 'package:myproject/core/routes/home_route.dart';
import 'package:myproject/core/routes/scanner_route.dart';

class AppGoRouterConfig {
  static final GoRouter router = GoRouter(routes: [homeRoute, scannerRoute]);
}
