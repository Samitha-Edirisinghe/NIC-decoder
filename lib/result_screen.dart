// 22UG1-0791
// E.D.S.R.Edirisinghe
// CCS3351 Mobile Application Development Final project Q1. National ID card (NIC) decoder

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'user_details.dart';

class ResultScreen extends StatelessWidget {
  final UserDetails userDetails;

  const ResultScreen({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIC Type: ${userDetails.isOldFormat ? 'Old' : 'New'}'),
            Text(
                'Date of Birth: ${DateFormat('yyyy-MM-dd').format(userDetails.birthDate)}'),
            Text('Weekday: ${userDetails.weekday}'),
            Text('Age: ${userDetails.age}'),
            Text('Gender: ${userDetails.gender}'),
            Text('Vote Eligibility: ${userDetails.voteEligibility}'),
          ],
        ),
      ),
    );
  }
}
