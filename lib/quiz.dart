import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0; // Variable to keep track of the score
  int questionIndex = 0; // To track the current question

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What are the main building blocks of Flutter UIs?',
      'answers': [
        {'text': 'Widgets', 'score': 1},
        {'text': 'Components', 'score': 0},
        {'text': 'Blocks', 'score': 0},
        {'text': 'Functions', 'score': 0}
      ],
    },
    {
      'questionText': 'How are Flutter UIs built?',
      'answers': [
        {'text': 'By combining widgets in code', 'score': 1},
        {'text': 'By combining widgets in a visual editor', 'score': 0},
        {'text': 'By defining widgets in config files', 'score': 0},
        {
          'text': 'By using XCode for iOS and Android Studio for Android',
          'score': 0
        }
      ],
    },
    {
      'questionText': 'What\'s the purpose of a StatefulWidget?',
      'answers': [
        {'text': 'Update UI as data changes', 'score': 1},
        {'text': 'Update data as UI changes', 'score': 0},
        {'text': 'Ignore data changes', 'score': 0},
        {'text': 'Render UI that does not depend on data', 'score': 0}
      ],
    },
    {
      'questionText':
          'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      'answers': [
        {'text': 'StatelessWidget', 'score': 1},
        {'text': 'StatefulWidget', 'score': 0},
        {'text': 'Both are equally good', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ],
    },
    {
      'questionText': 'What happens if you change data in a StatelessWidget?',
      'answers': [
        {'text': 'The UI is not updated', 'score': 1},
        {'text': 'The UI is updated', 'score': 0},
        {'text': 'The closest StatefulWidget is updated', 'score': 0},
        {'text': 'Any nested StatefulWidgets are updated', 'score': 0}
      ],
    },
    {
      'questionText': 'How should you update data inside of StatefulWidgets?',
      'answers': [
        {'text': 'By calling setState()', 'score': 1},
        {'text': 'By calling updateData()', 'score': 0},
        {'text': 'By calling updateUI()', 'score': 0},
        {'text': 'By calling updateState()', 'score': 0}
      ],
    },
  ];

  // Function to handle answer selection and update score
  void _answerQuestion(int score) {
    setState(() {
      this.score += score; // Update the score based on answer selected
      questionIndex += 1; // Move to the next question
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Game'),
        backgroundColor: Color(0xFF6A0DAD), // Set AppBar color
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFD1C4E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: questionIndex < _questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Display question with style
                  Text(
                    _questions[questionIndex]['questionText'] as String,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6A0DAD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  // Display answers with styled buttons
                  ...(_questions[questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF8A2BE2),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () =>
                            _answerQuestion(answer['score'] as int),
                        child: Text(
                          answer['text'] as String,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              )
            : Center(
                // Show final score when quiz is finished
                child: Text(
                  'Quiz Finished!\nYour score is: $score',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A0DAD),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
