import 'package:go_router/go_router.dart';
import 'package:myproject/core/routes/history_route.dart';
import 'package:myproject/core/routes/home_route.dart';
import 'package:myproject/core/routes/scanner_route.dart';

final class GoRouterUtil {
  const GoRouterUtil._();

  static final GoRouter router = GoRouter(
    routes: [homeRoute, scannerRoute, historyRoute],
  );
}
