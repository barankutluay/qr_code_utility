import 'package:myproject/core/constants/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImageViewStyle {
  static const dataModuleStyle = QrDataModuleStyle(
    dataModuleShape: QrDataModuleShape.square,
    color: AppColors.black,
  );
  static const eyeStyle = QrEyeStyle(
    eyeShape: QrEyeShape.square,
    color: AppColors.black,
  );
}
