enum CalculationMethod {
  isna,     // API ID: 2
  mwl,      // API ID: 3
  egypt,    // API ID: 5
  makkah,   // API ID: 4 (Umm al-Qura)
  turkish,  // API ID: 13 (Diyanet)
  karachi,  // API ID: 1
}

// int getMethodId(CalculationMethod method) {
//   switch (method) {
//     case CalculationMethod.isna:
//       return 2;
//     case CalculationMethod.mwl:
//       return 3;
//     case CalculationMethod.egypt:
//       return 5;
//     case CalculationMethod.makkah:
//       return 4;
//     case CalculationMethod.turkish:
//       return 13;
//   }

extension CalculationMethodExtension on CalculationMethod {
  String get displayName {
    switch (this) {
      case CalculationMethod.isna:
        return "ISNA (North America)";
      case CalculationMethod.mwl:
        return "MWL (Muslim World League)";
      case CalculationMethod.egypt:
        return "Egypt (Egyptian Authority)";
      case CalculationMethod.makkah:
        return "Makkah (Umm al-Qura)";
      case CalculationMethod.turkish:
        return "Turkish (Diyanet)";
      case CalculationMethod.karachi:
        return "Karachi";
    }
  }
}


int getMethodId(CalculationMethod method) {
  switch (method) {
    case CalculationMethod.isna:
      return 2;
    case CalculationMethod.mwl:
      return 3;
    case CalculationMethod.egypt:
      return 5;
    case CalculationMethod.makkah:
      return 4;
    case CalculationMethod.turkish:
      return 13;
    case CalculationMethod.karachi:
      return 1;
  }
}




