// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q1. National ID card (NIC) decoder

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_parser.dart';
import 'nic_validator.dart';
import 'user_details.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController _nicController = TextEditingController();

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NIC Decoder')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nicController,
              decoration: InputDecoration(
                labelText: 'Enter NIC',
                hintText: 'e.g., 123456789V or 200010800178',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nic = _nicController.text.trim();
                if (NicValidator.isValid(nic)) {
                  NicParser parser = NicParser(nic);
                  UserDetails userDetails = UserDetails(
                    nic: nic,
                    isOldFormat: parser.isOldFormat,
                    birthDate: parser.birthDate,
                    gender: parser.gender,
                    weekday: parser.weekday,
                    age: parser.age,
                    voteEligibility: parser.voteEligibility,
                  );
                  Get.toNamed('/result', arguments: userDetails);
                } else {
                  Get.snackbar('Error', 'Invalid NIC format');
                }
              },
              child: Text('Decode'),
            ),
          ],
        ),
      ),
    );
  }
}
