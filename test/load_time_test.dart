import 'package:flutter_test/flutter_test.dart';
import 'package:myproject/core/app.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/logger_util.dart';

void main() {
  testWidgets('App Load Time', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    stopwatch.stop();

    LoggerUtil.info('App Load Time: ${stopwatch.elapsedMilliseconds}ms');
    expect(true, isTrue);
  });

  testWidgets('Scan Icon Load Time', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    await tester.pumpWidget(
      IconEnum.scanIcon.toSVGWidget(
        width: 112,
        height: 112,
        color: AppColors.lightOnPrimaryContainer,
      ),
    );
    await tester.pumpAndSettle();

    stopwatch.stop();

    LoggerUtil.info('Scan Icon Load Time: ${stopwatch.elapsedMilliseconds}ms');
    expect(true, isTrue);
  });

  testWidgets('History Icon Load Time', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    await tester.pumpWidget(
      IconEnum.history.toSVGWidget(
        width: 36,
        height: 36,
        color: AppColors.lightOnPrimaryContainer,
      ),
    );
    await tester.pumpAndSettle();

    stopwatch.stop();

    LoggerUtil.info(
      'History Icon Load Time: ${stopwatch.elapsedMilliseconds}ms',
    );
    expect(true, isTrue);
  });

  testWidgets('Create Icon Load Time', (WidgetTester tester) async {
    final stopwatch = Stopwatch()..start();

    await tester.pumpWidget(
      IconEnum.create.toSVGWidget(
        width: 36,
        height: 36,
        color: AppColors.lightOnPrimaryContainer,
      ),
    );
    await tester.pumpAndSettle();

    stopwatch.stop();

    LoggerUtil.info(
      'Create Icon Load Time: ${stopwatch.elapsedMilliseconds}ms',
    );
    expect(true, isTrue);
  });
}
