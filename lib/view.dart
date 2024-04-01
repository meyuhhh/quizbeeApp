import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  List<dynamic> _contactsList = [];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    try {
      final List contacts = await getContacts();
      setState(() {
        _contactsList = contacts;
      });
    } catch (error) {
      print("Error fetching contacts: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scores",
          style: TextStyle(fontSize: 30.0),
        ),
        centerTitle: true,
      ),
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _contactsList.isEmpty
                    ? CircularProgressIndicator()
                    : contactsListView(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget contactsListView() {
    return ListView.builder(
      itemCount: _contactsList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(_contactsList[index]['username']),
            trailing: Text(_contactsList[index]['score'].toString()),
          ),
        );
      },
    );
  }

  Future<List<dynamic>> getContacts() async {
    const String url = "http://localhost/quizbee/lib/api/view.php";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load contacts");
    }
  }
}
