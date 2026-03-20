import '../models/calculation_method.dart';
import '../models/madhhab_type.dart';

class SettingsModel {
  final CalculationMethod method;
  final MadhhabType madhab;
  final int offsetMinutes;
  final bool ramadanNotificationsEnabled;
  final bool widgetEnabled;
  final bool lockScreenEnabled;


  SettingsModel({
    required this.method,
    required this.madhab,
    required this.offsetMinutes,
    this.ramadanNotificationsEnabled=true,
    this.widgetEnabled=false,
    this.lockScreenEnabled=false,
  });
}
