enum MadhhabType {
  hanafi,
  shafiGroup,
}

extension MadhhabTypeExtension on MadhhabType {
  String get nameText {
    switch (this) {
      case MadhhabType.hanafi:
        return 'Hanafi';
      case MadhhabType.shafiGroup:
        return 'Shafi / Maliki / Hanbali';
    }
  }

  int get schoolValue {
    // Aladhan API school value
    switch (this) {
      case MadhhabType.hanafi:
        return 1;
      case MadhhabType.shafiGroup:
        return 0;
    }
  }
}
