import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'user_details.dart';

class ResultScreen extends StatelessWidget {
  final UserDetails userDetails;

  const ResultScreen({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIC Type: ${userDetails.isOldFormat ? 'Old' : 'New'}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              'Date of Birth: ${DateFormat('yyyy-MM-dd').format(userDetails.birthDate)}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Weekday: ${userDetails.weekday}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Age: ${userDetails.age}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Gender: ${userDetails.gender}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Vote Eligibility: ${userDetails.voteEligibility}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
