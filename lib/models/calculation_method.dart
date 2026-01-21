enum CalculationMethod {
  isna,
  mwl,
  egypt,
  makkah,
  turkish,
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
  }
}
