import 'package:flutter/material.dart';
import 'package:read/pages/Elocution.dart';
import 'package:read/pages/Facialexpression.dart';
import 'package:read/pages/Questions.dart';
import 'package:read/pages/QuizWinnerPage.dart';
import 'package:read/pages/Removingfiller.dart';
import 'package:read/pages/Speechstructure.dart';
import 'package:read/pages/Voicemodulation.dart';
import 'package:read/pages/akshaya.dart';
import 'package:read/pages/pausing.dart';
import 'package:read/pages/vocalclarity.dart';
import 'bodylanguage.dart';

class Front extends StatefulWidget {
  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  int _selectedIndex = 0; 

  final List<Map<String, String>> items = [
    {'image': 'lib/images/akshayaone.png', 'text': 'Body Language'},
    {'image': 'lib/images/akshayatwo.png', 'text': 'Voice Modulation'},
    {'image': 'lib/images/akshayathree.png', 'text': 'Removing Fillers'},
    {'image': 'lib/images/akshayafour.png', 'text': 'Speech Structure'},
    {'image': 'lib/images/akshayafive.png', 'text': 'Vocal Clarity'},
    {'image': 'lib/images/akshayasix.png', 'text': 'Facial Expression'},
    {'image': 'lib/images/akshayaseven.png', 'text': 'Intentional Pausing'},
    {'image': 'lib/images/result.png', 'text': 'English Elocution'}
  ];

  final List<Widget> pages = [
    Bodylanguage(),
    Voice(),
    Filler(),
    Structureof(),
    vocalclarity(),
    FacialExpression(),
    Pausing(),
    Elocution(),
  ];

  final List<Widget> bottomNavPages = [
    Questions(),
    QuizWinnersPage(),
    AkshayaPage(),
   

   
   
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => bottomNavPages[_selectedIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Speaking Tips'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards in each row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
              child: Card(
                color: Colors.yellow,
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      items[index]['image']!,
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(items[index]['text']!,
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset('lib/images/tes.png', height: 50),

            label: 'TAKE TEST',
          ),
          BottomNavigationBarItem(
           icon:Image.asset('lib/images/result.png',height: 50,),
            label: 'CHAMPIONS',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('lib/images/dude.png',height: 50,),
            label: 'LEGEND INSIDE',
          ),
        ],
      ),
    );
  }
}
