// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q1. National ID card (NIC) decoder

class NicValidator {
  static bool isValid(String nic) {
    return RegExp(r'^[0-9]{9}[vVxX]$').hasMatch(nic) ||
        RegExp(r'^[0-9]{12}$').hasMatch(nic);
  }
}
