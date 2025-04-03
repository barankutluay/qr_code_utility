import 'package:myproject/core/utils/logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

void customLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      final String e = 'Could not launch $url';
      throw Exception(e);
    }
  } catch (e) {
    LoggerUtil.error(e);
  }
}
