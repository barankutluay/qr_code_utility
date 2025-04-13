import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

final class QrImageViewStyle {
  const QrImageViewStyle._();

  static const dataModuleStyle = QrDataModuleStyle(
    dataModuleShape: QrDataModuleShape.square,
    color: AppColors.black,
  );
  static const eyeStyle = QrEyeStyle(
    eyeShape: QrEyeShape.square,
    color: AppColors.black,
  );
}
