// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q1. National ID card (NIC) decoder
import 'package:intl/intl.dart';

class NicParser {
  final String nic;

  NicParser(this.nic);

  bool get isOldFormat => nic.length == 10;

  int get birthYear {
    if (isOldFormat) {
      return 1900 + int.parse(nic.substring(0, 2));
    } else {
      return int.parse(nic.substring(0, 4));
    }
  }

  int get dayOfYear {
    if (isOldFormat) {
      return int.parse(nic.substring(2, 5));
    } else {
      return int.parse(nic.substring(4, 7));
    }
  }

  String get gender => dayOfYear < 500 ? 'Male' : 'Female';

  DateTime get birthDate {
    int year = birthYear;
    int day = dayOfYear < 500 ? dayOfYear : dayOfYear - 500;
    return DateTime(year, 1, 1).add(Duration(days: day - 1));
  }

  String get weekday => DateFormat('EEEE').format(birthDate);

  int get age {
    DateTime now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  String get voteEligibility {
    if (isOldFormat) {
      return nic[9].toUpperCase() == 'V' ? 'Eligible' : 'Not Eligible';
    } else {
      return 'Eligible'; // New NICs assume eligibility
    }
  }
}
