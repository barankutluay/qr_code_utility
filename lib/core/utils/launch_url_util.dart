import 'package:myproject/core/utils/logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(String url) async {
  try {
    final uri = Uri.parse(url);
    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!success) {
      throw Exception('Could not launch: $uri');
    }
  } catch (error, stackTrace) {
    LoggerUtil.error('Error: $error', error, stackTrace);
    rethrow;
  }
}
