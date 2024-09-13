import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizWinnersPage extends StatefulWidget {
  @override
  _QuizWinnersPageState createState() => _QuizWinnersPageState();
}

class _QuizWinnersPageState extends State<QuizWinnersPage> {
  List<String> usernames = [];
  List<String> country=[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsernames();
  }

  Future<void> fetchUsernames() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:6000/api/tips/getUsers'));

      if (response.statusCode == 200) {
        final List<dynamic> users = json.decode(response.body);
        setState(() {
          usernames = users.map((user) => user['username'].toString()).toList();
          country=users.map((user)=>user['country'].toString()).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Winners'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // 2 columns
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: usernames.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/images/success.png', height: 100,width: 100), 
                        SizedBox(height:5),
                        Text(
                          usernames[index],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(country[index],style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
