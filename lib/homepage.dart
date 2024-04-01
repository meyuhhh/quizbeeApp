import 'package:flutter/material.dart';
import 'package:quizbee/quiz_screen.dart';
import 'package:quizbee/view.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _nameController = TextEditingController();
  int _selectedNumQuestions = 10; // Default number of questions
  int _selectedIndex = 0; // Initially selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.teal.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(75),
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Number of Questions"),
                    SizedBox(height: 10),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        5, // Number of buttons
                        (index) => ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedNumQuestions = (index + 1) * 10;
                              _selectedIndex = index; // Update selected index
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15), // Adjust padding
                            textStyle:
                                TextStyle(fontSize: 16), // Adjust font size
                            primary: _selectedIndex == index
                                ? Colors.green // Highlight selected button
                                : null,
                          ),
                          child: Text('${(index + 1) * 10}'), // Button label
                        ),
                      ),
                    ),
                    SizedBox(height: 21),
                    ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(
                                name: _nameController.text,
                                numQuestions: _selectedNumQuestions,
                              ),
                            ),
                          ).then((_) {
                            _nameController.clear();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter your name.'),
                              backgroundColor: Colors.teal.shade400,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      child: Text('Start Quiz'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactsList(),
                          ),
                        );
                      },
                      child: Text('View all'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
