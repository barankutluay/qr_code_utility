import 'package:myproject/core/utils/logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

void customLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    final e = "Could not launch $url";
    LoggerUtil.error(e);
    throw e;
  }
}
