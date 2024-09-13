import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List<int> selectedOptions = [];
  String result = "😊";
  int serverResponse = 0;
  bool showUserForm = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  void selectOption(int questionIndex, int optionIndex) {
    if (selectedOptions.length < 10) {
      selectedOptions.add(optionIndex);
    } else {
      selectedOptions[questionIndex] = optionIndex;
    }
    setState(() {});
  }

  Future<void> sendListToServer() async {
    try {
      String jsonList = jsonEncode(selectedOptions);

      final response = await http.post(
        Uri.parse('http://10.0.2.2:6000/api/tips/questions'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonList,
      );

      if (response.statusCode == 200) {
        serverResponse = jsonDecode(response.body);

        setState(() {
          result = serverResponse == 1 ? "Match Found!" : "No Match!";
          showUserForm = serverResponse == 1;
        });
      } else {
        setState(() {
          result = "Failed to send list.";
        });
      }
    } catch (e) {
      setState(() {
        result = "Couldn't connect to the server.";
      });
    }
  }

  Future<void> submitUserDetails() async {
    try {
      String username = usernameController.text;
      String country = countryController.text;

      Map<String, dynamic> userDetails = {
        'username': username,
        'country': country,
      };

      final response = await http.post(
        Uri.parse('http://10.0.2.2:6000/api/tips/storeUserDetails'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userDetails),
      );

      if (response.statusCode == 200) {
        setState(() {
          result = "User details saved successfully!";
        });
      } else {
        setState(() {
          result = "Failed to save user details.";
        });
      }
    } catch (e) {
      setState(() {
        result = "Couldn't save user details.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Public Speaking Quiz"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
             
              Text("1. How should you manage your body language?"),
              ListTile(
                title: const Text("A: Keep hands in pockets"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.isNotEmpty ? selectedOptions[0] : null,
                  onChanged: (value) {
                    selectOption(0, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Use hand gestures"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.isNotEmpty ? selectedOptions[0] : null,
                  onChanged: (value) {
                    selectOption(0, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Stand still"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.isNotEmpty ? selectedOptions[0] : null,
                  onChanged: (value) {
                    selectOption(0, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              Text("2. How can you avoid using filler words?"),
              ListTile(
                title: const Text("A: Speak faster"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 1 ? selectedOptions[1] : null,
                  onChanged: (value) {
                    selectOption(1, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Take pauses"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 1 ? selectedOptions[1] : null,
                  onChanged: (value) {
                    selectOption(1, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Repeat your words"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 1 ? selectedOptions[1] : null,
                  onChanged: (value) {
                    selectOption(1, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
           
              Text("3. What is the best way to use voice modulation?"),
              ListTile(
                title: const Text("A: Speak in a monotone"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 2 ? selectedOptions[2] : null,
                  onChanged: (value) {
                    selectOption(2, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Vary your pitch"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 2 ? selectedOptions[2] : null,
                  onChanged: (value) {
                    selectOption(2, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Speak quickly"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 2 ? selectedOptions[2] : null,
                  onChanged: (value) {
                    selectOption(2, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              Text("4. How should you structure your speech?"),
              ListTile(
                title: const Text("A: Start with a story"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 3 ? selectedOptions[3] : null,
                  onChanged: (value) {
                    selectOption(3, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Jump to the conclusion"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 3 ? selectedOptions[3] : null,
                  onChanged: (value) {
                    selectOption(3, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Provide too many details"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 3 ? selectedOptions[3] : null,
                  onChanged: (value) {
                    selectOption(3, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
            
              Text("5. How can you ensure vocal clarity?"),
              ListTile(
                title: const Text("A: Speak softly"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 4 ? selectedOptions[4] : null,
                  onChanged: (value) {
                    selectOption(4, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Enunciate clearly"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 4 ? selectedOptions[4] : null,
                  onChanged: (value) {
                    selectOption(4, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Mumble your words"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 4 ? selectedOptions[4] : null,
                  onChanged: (value) {
                    selectOption(4, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              Text("6. How should you use facial expressions?"),
              ListTile(
                title: const Text("A: Keep a neutral expression"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 5 ? selectedOptions[5] : null,
                  onChanged: (value) {
                    selectOption(5, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Smile when appropriate"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 5 ? selectedOptions[5] : null,
                  onChanged: (value) {
                    selectOption(5, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Frown to emphasize points"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 5 ? selectedOptions[5] : null,
                  onChanged: (value) {
                    selectOption(5, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              Text("7. When is it good to use intentional pauses?"),
              ListTile(
                title: const Text("A: When emphasizing a point"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 6 ? selectedOptions[6] : null,
                  onChanged: (value) {
                    selectOption(6, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: When unsure of what to say"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 6 ? selectedOptions[6] : null,
                  onChanged: (value) {
                    selectOption(6, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: To fill up time"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 6 ? selectedOptions[6] : null,
                  onChanged: (value) {
                    selectOption(6, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
            
              Text("8. How should you maintain eye contact?"),
              ListTile(
                title: const Text("A: Avoid looking at the audience"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 7 ? selectedOptions[7] : null,
                  onChanged: (value) {
                    selectOption(7, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Glance around the room"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 7 ? selectedOptions[7] : null,
                  onChanged: (value) {
                    selectOption(7, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Stare at one person"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 7 ? selectedOptions[7] : null,
                  onChanged: (value) {
                    selectOption(7, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              Text("9. What kind of gestures should you use?"),
              ListTile(
                title: const Text("A: None at all"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 8 ? selectedOptions[8] : null,
                  onChanged: (value) {
                    selectOption(8, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: Purposeful gestures"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 8 ? selectedOptions[8] : null,
                  onChanged: (value) {
                    selectOption(8, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: Excessive hand movements"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 8 ? selectedOptions[8] : null,
                  onChanged: (value) {
                    selectOption(8, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              Text("10. How should you open your speech?"),
              ListTile(
                title: const Text("A: With a strong hook"),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOptions.length > 9 ? selectedOptions[9] : null,
                  onChanged: (value) {
                    selectOption(9, 1);
                  },
                ),
              ),
              ListTile(
                title: const Text("B: By apologizing"),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOptions.length > 9 ? selectedOptions[9] : null,
                  onChanged: (value) {
                    selectOption(9, 2);
                  },
                ),
              ),
              ListTile(
                title: const Text("C: By asking a question"),
                leading: Radio(
                  value: 3,
                  groupValue: selectedOptions.length > 9 ? selectedOptions[9] : null,
                  onChanged: (value) {
                    selectOption(9, 3);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: selectedOptions.length < 10
                    ? null
                    : sendListToServer,
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              if (showUserForm) ...[
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: countryController,
                  decoration: const InputDecoration(
                    labelText: "Country",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: submitUserDetails,
                  child: const Text("Submit User Details"),
                ),
              ],
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
