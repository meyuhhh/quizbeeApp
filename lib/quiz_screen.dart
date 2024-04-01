import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizbee/homepage.dart';
import 'package:quizbee/view.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Quiz',
      home: Homepage(),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final String name;
  final int numQuestions;

  QuizScreen({Key? key, required this.name, required this.numQuestions})
      : super(key: key);

  final List<Map<String, dynamic>> allQuestions = [
    {
      'question': 'What does HTML stand for?',
      'choices': [
        'Hyper Text Markup Language',
        'Hyperlinks and Text Markup Language',
        'Home Tool Markup Language',
        'High Text Markup Language',
        'Hyper Transfer Markup Language'
      ],
      'answerIndex': 0,
    },
    {
      'question': 'Which of the following is a statically typed language?',
      'choices': ['Python', 'JavaScript', 'Ruby', 'Java', 'PHP'],
      'answerIndex': 3,
    },
    {
      'question': 'What does the "display: none;" property do in CSS?',
      'choices': [
        'Makes the element visible',
        'Adds a border to the element',
        'Centers the element horizontally and vertically',
        'Rotates the element',
        'Hides the element'
      ],
      'answerIndex': 4,
    },
    {
      'question': 'What is Dart primarily used for?',
      'choices': [
        'Web development',
        'Mobile app development',
        'Data analysis',
        'Game development',
        'Artificial intelligence'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Which method is used to print output in Dart?',
      'choices': ['print()', 'console.log()', 'echo()', 'println()', 'log()'],
      'answerIndex': 0,
    },
    {
      'question':
          'Which function is used to get the length of a string in PHP?',
      'choices': [
        'str_length()',
        'len()',
        ' strlen()',
        'length()',
        'str_len()'
      ],
      'answerIndex': 0,
    },
    {
      'question': 'In which year was the first version of Java released?',
      'choices': ['1995', '2000', '1990', '1985', '2005'],
      'answerIndex': 0,
    },
    {
      'question': 'What does CSS stand for?',
      'choices': [
        'Computer Style Sheets',
        'Cascading Style Sheets',
        'Creative Style Sheets',
        'Colorful Style Sheets',
        'None of the above'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Which tag is used to define an unordered list in HTML?',
      'choices': ['<ol>', '<li>', '<ul>', '<list>', '<unordlist>'],
      'answerIndex': 2,
    },
    {
      'question': 'What is the default file extension for PHP files?',
      'choices': ['.ph', ' .html', '.php', '.script', '.phps'],
      'answerIndex': 3,
    },
    {
      'question': 'What does SQL stand for?',
      'choices': [
        'Structured Query Language',
        ' Standard Query Language',
        'Sequential Query Language',
        'System Query Language',
        'Static Query Language'
      ],
      'answerIndex': 0,
    },
    {
      'question':
          'Which programming language is often used for artificial intelligence and machine learning?',
      'choices': ['Python', ' Java', 'Swift', 'C++', 'MATLAB'],
      'answerIndex': 0,
    },
    {
      'question': 'What does OOP stand for in programming?',
      'choices': [
        'Object-Oriented Protocol',
        'Object-Oriented Process',
        'Ordered Object Programming',
        'Object-Oriented Programming',
        'Optimal Object Parsing'
      ],
      'answerIndex': 3,
    },
    {
      'question': 'Which of the following is a dynamically typed language?',
      'choices': ['C#', 'C', 'Rust', 'Kotlin', 'JavaScript'],
      'answerIndex': 4,
    },
    {
      'question': 'What does AJAX stand for?',
      'choices': [
        'Advanced JavaScript and XML',
        'Asynchronous JavaScript and XML',
        'Asynchronous JSON and XML',
        'Automated JavaScript and XHTML',
        'Asynchronous Java and XHTML'
      ],
      'answerIndex': 1,
    },
    {
      'question':
          'Which programming language is commonly used for statistical computing and graphics?',
      'choices': ['Go', 'Perl', 'Scala', 'R', 'Lua'],
      'answerIndex': 3,
    },
    {
      'question': 'What does API stand for?',
      'choices': [
        'Advanced Program Interaction',
        'Application Programming Interface',
        'Automated Protocol Interface',
        'Application Protocol Integration',
        'Advanced Program Integration'
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Which of the following is a popular version control system?',
      'choices': ['Subversion', 'Mercurial', 'Git', 'CVS', 'Perforce'],
      'answerIndex': 2,
    },
    {
      'question': 'What does MVC stand for in web development?',
      'choices': [
        'Modular-View-Component',
        'Multi-View-Controller',
        'Model-View-Component',
        'Model-View-Controller',
        'Managed-View-Controller'
      ],
      'answerIndex': 3,
    },
    {
      'question': 'Which of the following is a NoSQL database?',
      'choices': [
        'MySQL',
        'PostgreSQL',
        'MSQLite',
        'OracleDB',
        'MongoDB',
      ],
      'answerIndex': 4,
    },
    {
      'question':
          'Which of the following is NOT a primitive data type in Java?',
      'choices': [
        'boolean',
        'string',
        'int',
        'double',
        'char',
      ],
      'answerIndex': 1,
    },
    {
      'question': 'What does CRUD stand for in database management?',
      'choices': [
        'Collect, Retrieve, Update, Delete',
        'Create, Remove, Update, Deliver',
        'Create, Read, Update, Delete',
        'Copy, Read, Update, Delete',
        'Control, Register, Update, Distribute',
      ],
      'answerIndex': 2,
    },
    {
      'question': 'Which of the following is NOT a valid loop in Python?',
      'choices': [
        'for',
        'while',
        'loop',
        'do-while',
        'until',
      ],
      'answerIndex': 2,
    },
    {
      'question': 'Which of the following is NOT a valid data type in PHP?',
      'choices': [
        'string',
        'boolean',
        'integer',
        'char',
        'array',
      ],
      'answerIndex': 3,
    },
    {
      'question':
          'Which of the following is a valid way to print output in C programming?',
      'choices': [
        'print("Hello, world!");',
        'printf("Hello, world!\n");',
        'Console.WriteLine("Hello, world!");',
        'cout << "Hello, world!" << endl;',
        'echo "Hello, world!";',
      ],
      'answerIndex': 1,
    },
    {
      'question':
          'Which of the following is a valid way to declare a variable in C programming?',
      'choices': [
        'int x;',
        'x = 10;',
        'x := 10;',
        'int x = 10;',
        'let x = 10;',
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Which tag is used to define a table in HTML?',
      'choices': [
        '<table>',
        '<tab>',
        '<tr>',
        '<td>',
        '<th>',
      ],
      'answerIndex': 0,
    },
    {
      'question':
          'Which property is used to change the background color of an element in CSS?',
      'choices': [
        'color',
        'background-color',
        'bgcolor',
        'background',
        '<fill',
      ],
      'answerIndex': 1,
    },
    {
      'question': 'What does C# stand for?',
      'choices': [
        'Core Sharp',
        'Core Syntax',
        'Computer Sharp',
        'Creative Sharp',
        'C Sharp',
      ],
      'answerIndex': 4,
    },
    {
      'question': 'Which keyword is used to declare a constant in C#?',
      'choices': [
        'final',
        'static',
        'const',
        'constant',
        'readonly',
      ],
      'answerIndex': 2,
    },
    {
      'question': 'How do you start a session in PHP?',
      'choices': [
        'start_session()',
        'session_begin()',
        'initialize_session()',
        'session_start()',
        'begin_session()',
      ],
      'answerIndex': 3,
    },
    {
      'question':
          'Which function is used to redirect to a different URL in PHP?',
      'choices': [
        'redirect()',
        'location()',
        'header()',
        'navigate()',
        'forward()',
      ],
      'answerIndex': 2,
    },
    {
      'question': 'Which PHP function is used to connect to a MySQL database?',
      'choices': [
        'connect()',
        'open_connection()',
        'db_connect()',
        'mysql_connect()',
        'mysqli_connect()',
      ],
      'answerIndex': 4,
    },
    {
      'question': 'How can you check if a file exists in PHP?',
      'choices': [
        'Use the file_exists() function.',
        'Use the check_file() function.',
        'Use the exists() function.',
        'Use the is_file() function.',
        'Use the verify_file() function.',
      ],
      'answerIndex': 0,
    },
    {
      'question': 'Which tag is used to create a numbered list in HTML?',
      'choices': [
        '<nl>',
        '<ol>',
        '<ul>',
        '<li>',
        '<list>',
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Which tag is used to create a horizontal line in HTML?',
      'choices': [
        '<hr>',
        '<line>',
        '<break>',
        '<hline>',
        '<rule>',
      ],
      'answerIndex': 0,
    },
    {
      'question':
          'Which property is used to set the width of an element in CSS?',
      'choices': [
        'size',
        'width',
        'height',
        'dimension',
        'element-width',
      ],
      'answerIndex': 1,
    },
    {
      'question': 'What is the syntax for declaring a pointer in C++?',
      'choices': [
        'int* ptr;',
        'pointer int ptr;',
        'ptr int;',
        'dimension',
        'element-width',
      ],
      'answerIndex': 0,
    },
    {
      'question': 'What is JavaScript primarily used for?',
      'choices': [
        'Server-side scripting',
        'Data analysis',
        'Game development',
        'Mobile app development',
        'Client-side scripting',
      ],
      'answerIndex': 4,
    },
    {
      'question':
          'Which symbol is used for single-line comments in JavaScript?',
      'choices': [
        '#',
        '--',
        '/*',
        '//',
        ';',
      ],
      'answerIndex': 3,
    },
    {
      'question':
          'Which data structure follows the Last In, First Out (LIFO) principle?',
      'choices': [
        'Queue',
        'Linked List',
        'Stack',
        'Tree',
        'Array',
      ],
      'answerIndex': 2,
    },
    {
      'question': 'What does JIT stand for in the context of Java?',
      'choices': [
        'Jump-In-Time',
        'Just-In-Time',
        'Java-In-Time',
        'Jumping-In-Thread',
        'Justified-In-Time',
      ],
      'answerIndex': 1,
    },
    {
      'question': 'Which of the following is a valid keyword in C++?',
      'choices': [
        'module',
        'interface',
        'extends',
        'implements',
        'class',
      ],
      'answerIndex': 4,
    },
    {
      'question': 'Which SQL statement is used to update data in a database?',
      'choices': [
        'MODIFY',
        'ALTER',
        'UPDATE',
        'CHANGE',
        'MODIFY',
      ],
      'answerIndex': 2,
    },
    {
      'question':
          'In HTML, which attribute is used to specify additional information about an element?',
      'choices': [
        'class',
        'id',
        'title',
        'style',
        'data',
      ],
      'answerIndex': 4,
    },
    {
      'question':
          'Which JavaScript method is used to round a number to the nearest integer?',
      'choices': [
        'Math.round()',
        'Math.ceil()',
        'Math.floor()',
        'Math.abs()',
        'Math.random()',
      ],
      'answerIndex': 0,
    },
    {
      'question':
          'In PHP, which function is used to retrieve the current date and time?',
      'choices': [
        'date()',
        'time()',
        'now()',
        'datetime()',
        'getCurrentDateTime()',
      ],
      'answerIndex': 0,
    },
    {
      'question':
          'Which JavaScript method is used to sort the elements of an array?',
      'choices': [
        'sort()',
        'sorted()',
        'order()',
        'arrange()',
        'sequence()',
      ],
      'answerIndex': 0,
    },
    {
      'question':
          'Which JavaScript method is used to convert a string to uppercase?',
      'choices': [
        'toUpperCase()',
        'toUppercase()',
        'upperCase()',
        'toUpper()',
        'upCase()',
      ],
      'answerIndex': 0,
    },
    {
      'question': 'Which CSS property is used to add shadows to elements?',
      'choices': [
        'box-shadow',
        'text-shadow',
        'shadow',
        'element-shadow',
        'shadow-effect',
      ],
      'answerIndex': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Shuffle the list of questions
    allQuestions.shuffle();

    List<Map<String, dynamic>> selectedQuestions =
        allQuestions.sublist(0, numQuestions);

    return Scaffold(
      body: Center(
        child: QuizQuestionPage(
          name: name,
          questionIndex: 0,
          questionData: selectedQuestions[0],
          questions: selectedQuestions,
          correctAnswers: 0,
        ),
      ),
    );
  }
}

class QuizQuestionPage extends StatelessWidget {
  final String name;
  final int questionIndex;
  final Map<String, dynamic> questionData;
  final List<Map<String, dynamic>> questions;
  final int correctAnswers;

  const QuizQuestionPage({
    Key? key,
    required this.name,
    required this.questionIndex,
    required this.questionData,
    required this.questions,
    required this.correctAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal, Colors.indigo],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Question ${questionIndex + 1} of ${questions.length}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: QuizQuestion(
                          name: name,
                          questionIndex: questionIndex,
                          questionData: questionData,
                          questions: questions,
                          correctAnswers: correctAnswers,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizQuestion extends StatefulWidget {
  final String name;
  final int questionIndex;
  final Map<String, dynamic> questionData;
  final List<Map<String, dynamic>> questions;
  final int correctAnswers; // Receive correctAnswers here

  const QuizQuestion({
    Key? key,
    required this.name,
    required this.questionIndex,
    required this.questionData,
    required this.questions,
    required this.correctAnswers,
  }) : super(key: key);

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  int? _selectedOptionIndex;
  int _secondsRemaining = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _proceedToNextQuestion(widget.correctAnswers);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _handleSelection(int index) {
    setState(() {
      _selectedOptionIndex = index;
    });

    // Check if the selected answer is correct
    bool isCorrect = index == widget.questionData['answerIndex'];

    // Cancel the timer
    _timer.cancel();

    // Show feedback dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Correct Answer' : 'Incorrect Answer'),
          content: Text(
            isCorrect
                ? 'Well done! You answered correctly.'
                : 'Sorry, the correct answer is: ${widget.questionData['choices'][widget.questionData['answerIndex']]}',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Proceed to the next question
                _proceedToNextQuestion(isCorrect
                    ? widget.correctAnswers + 1
                    : widget.correctAnswers);
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }

  void _proceedToNextQuestion(int correctAnswers) {
    if (widget.questionIndex < widget.questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizQuestionPage(
            name: widget.name,
            questionIndex: widget.questionIndex + 1,
            questionData: widget.questions[widget.questionIndex + 1],
            questions: widget.questions,
            correctAnswers:
                correctAnswers, // Pass correctAnswers to next question page
          ),
        ),
      );
    } else {
      // Navigate to the result page if all questions are answered
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(
            name: widget.name,
            totalQuestions: widget.questions.length,
            correctAnswers: correctAnswers,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.questionData['question'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                for (int i = 0; i < widget.questionData['choices'].length; i++)
                  InkWell(
                    onTap: () {
                      _handleSelection(i);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: double
                            .infinity, // Make the container fill the width
                        height: 50, // Set a fixed height for all choices
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            widget.questionData['choices'][i],
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 15),
            Center(
              // Center the back button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
                child: Text('Back'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Time Remaining: $_secondsRemaining seconds',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizResultPage extends StatelessWidget {
  final String name;

  final int totalQuestions;
  final int correctAnswers;

  const QuizResultPage({
    Key? key,
    required this.name,
    required this.totalQuestions,
    required this.correctAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.teal.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Congratulations, $name!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You completed the quiz!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Total Questions: $totalQuestions',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Correct Answers: $correctAnswers',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      save(correctAnswers);
                      Navigator.pop(context); // Navigate back to the quiz
                    },
                    child: Text('Retry Quiz'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void save(int correctAnswer) async {
    String url = "http://localhost/quizbee/lib/api/save.php";

    final Map<String, dynamic> requestData = {
      "username": name,
      "score": correctAnswer.toString(),
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: requestData,
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        if (result["status"] == "success") {
          // setState(() {
          //   _msg = "Registration successful. ${result["message"]}";
          // });
        } else {
          // setState(() {
          //   _msg = "Registration failed. ${result["message"]}";
          // });
        }
      } else {
        print("${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (error) {
      print("Error: $error");
    }
  }
}
