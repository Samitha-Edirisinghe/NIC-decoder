import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_parser.dart';
import 'nic_validator.dart';
import 'user_details.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _nicController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nicController.dispose();
    super.dispose();
  }

  void _decodeNIC() {
    if (_formKey.currentState!.validate()) {
      String nic = _nicController.text.trim();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NIC Decoder',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nicController,
                decoration: const InputDecoration(
                  labelText: 'Enter NIC',
                  labelStyle: TextStyle(fontSize: 20), // Label font size
                  hintText: 'e.g., 123456789V or 200010800178',
                  hintStyle: TextStyle(fontSize: 16), // Hint font size
                ),
                style: const TextStyle(fontSize: 18), // Input text font size
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIC cannot be empty';
                  }
                  if (!NicValidator.isValid(value.trim())) {
                    return 'Invalid NIC format';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _decodeNIC,
                child: const Text(
                  'Decode',
                  style: TextStyle(fontSize: 16), // Button text font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
