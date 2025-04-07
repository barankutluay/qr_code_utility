import 'package:intl/intl.dart';

final class QrHistoryModel {
  QrHistoryModel({required this.url, required this.time, required this.type});

  final String url;
  final DateTime time;
  final int type;

  static final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy HH:mm:ss');
  
  String get formattedTime => _dateFormatter.format(time);

  Map<String, dynamic> toMap() => {
    'url': url,
    'time': _dateFormatter.format(time),
    'type': type,
  };

  factory QrHistoryModel.fromMap(Map<String, dynamic> map) => QrHistoryModel(
    url: map['url'],
    time: _dateFormatter.parse(map['time']),
    type: map['type'],
  );
}
