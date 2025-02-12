// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q1. National ID card (NIC) decoder

class UserDetails {
  final String nic;
  final bool isOldFormat;
  final DateTime birthDate;
  final String gender;
  final String weekday;
  final int age;
  final String voteEligibility;

  UserDetails({
    required this.nic,
    required this.isOldFormat,
    required this.birthDate,
    required this.gender,
    required this.weekday,
    required this.age,
    required this.voteEligibility,
  });
}
