import 'package:intl/intl.dart';

DateTime nextOccurrence(DateTime time) {
  final now = DateTime.now();

  if (time.isBefore(now)) {
    return time.add(const Duration(days: 1));
  }

  return time;
}
