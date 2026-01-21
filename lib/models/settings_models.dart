import 'calculation_method.dart';
import 'madhhab_type.dart';

class SettingsModel {
  CalculationMethod method;
  MadhhabType madhab;
  int offsetMinutes;

  SettingsModel({
    required this.method,
    required this.madhab,
    required this.offsetMinutes,
  });

  Map<String, dynamic> toJson() => {
    'method': method.name,
    'madhab': madhab.name,
    'offsetMinutes': offsetMinutes,
  };

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      method: CalculationMethod.values.firstWhere(
              (e) => e.name == json['method'],
          orElse: () => CalculationMethod.isna),
      madhab: MadhhabType.values.firstWhere(
              (e) => e.name == json['madhab'],
          orElse: () => MadhhabType.shafiGroup),
      offsetMinutes: json['offsetMinutes'] ?? 0,
    );
  }
}
