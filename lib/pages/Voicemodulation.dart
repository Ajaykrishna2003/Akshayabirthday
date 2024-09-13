import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Voice extends StatefulWidget {
  const Voice({super.key});

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  String responses = "Voice Modulation is ablity....";
  Future<void> fetchItems(String category) async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:6000/api/tips/$category'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is List && data.isNotEmpty) {
          setState(() {
            responses = data[0]['content'];
          });
        } else {
          setState(() {
            responses = 'No tips found';
          });
        }
      } else {
        setState(() {
          responses = 'Error fetching data';
        });
      }
    } catch (e) {
      setState(() {
        responses = 'Error fetching data: $e';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VOICE MODULATION')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.red,
                      child: Text(
                        "Modulation Speaks More Than A Language",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.blueGrey[50],
                child: Text(
                  responses,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  fetchItems('voicemodulation');
                },
                child: Text("Click here to read"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}