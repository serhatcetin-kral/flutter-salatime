import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';

class SettingsModel {
  final CalculationMethod method;
  final MadhhabType madhab;
  final int offsetMinutes;
  final bool ramadanNotificationsEnabled;

  SettingsModel({
    required this.method,
    required this.madhab,
    required this.offsetMinutes,
    this.ramadanNotificationsEnabled=true,
  });
}
