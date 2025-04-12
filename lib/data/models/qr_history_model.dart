import 'package:intl/intl.dart';

final class QrHistoryModel {
  QrHistoryModel({required this.url, required this.time, required this.type});

  factory QrHistoryModel.fromMap(Map<String, dynamic> map) {
    return QrHistoryModel(
      url: map['url'] as String,
      time: _dateFormatter.parse(map['time'] as String),
      type: map['type'] as int,
    );
  }

  final String url;
  final DateTime time;
  final int type;

  static final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy HH:mm:ss');

  String get formattedTime => _dateFormatter.format(time);

  Map<String, dynamic> toMap() {
    return {'url': url, 'time': _dateFormatter.format(time), 'type': type};
  }
}
