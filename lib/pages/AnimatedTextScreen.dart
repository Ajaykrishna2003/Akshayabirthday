import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:read/pages/front.dart';

class AnimatedTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 244, 84, 35),
                  const Color.fromARGB(255, 233, 32, 99),
                  Color.fromARGB(255, 235, 176, 0),
                  Color.fromARGB(255, 207, 11, 241)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
        
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Image.asset(
                  'lib/images/animation.png', 
                  width: 150.0, 
                  height: 150.0,
                ),
                SizedBox(height: 20.0), 
                
                SizedBox(
                  width: 250.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'San Francisco',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Happiest',
                          textStyle: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                          ),
                          colors: [
                            const Color.fromARGB(228, 255, 193, 7),
                            Colors.white,
                            Colors.black,
                            Colors.blueAccent,
                          ],
                        ),
                        ColorizeAnimatedText(
                          'Birthday',
                          textStyle: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                          ),
                          colors: [
                            const Color.fromARGB(228, 255, 193, 7),
                            Colors.white,
                            Colors.black,
                            Colors.blueAccent,
                          ],
                        ),
                        ColorizeAnimatedText(
                          'DUDO  AKKA DRAGO NEO',
                          textStyle: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                          ),
                          colors: [
                            Colors.white,
                            Colors.amber,
                            Colors.purpleAccent,
                            Colors.black,
                            Colors.blueAccent,
                          ],
                        ),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Front()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
