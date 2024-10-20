import 'package:flutter/material.dart';
import 'quiz.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor:
            Color(0xFF6A0DAD), // Set the AppBar color to match the theme
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display an image from assets
            Image.asset('assets/img/img1.png', width: 200, height: 200),
            SizedBox(height: 20),

            // Styled button matching the theme colors
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFF8A2BE2), // Use backgroundColor instead of primary
                foregroundColor:
                    Colors.white, // Use foregroundColor instead of onPrimary
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Rounded corners for the button
                ),
                elevation: 5, // Add a shadow for a sleek look
              ),
              child: Text(
                'Start Quiz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // Navigate to the Quiz Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(
          0xFFEDE7F6), // Set a light background color to contrast the button
    );
  }
}
