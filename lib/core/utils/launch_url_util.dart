import 'package:myproject/core/utils/logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(String url) async {
  final uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      final e = 'Could not launch $url';
      throw Exception(e);
    }
  } catch (error, stackTrace) {
    LoggerUtil.error('Error: $error', stackTrace);
    rethrow;
  }
}
