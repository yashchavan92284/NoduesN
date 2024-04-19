import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _prnController = TextEditingController();

  Future<Database>? _database;

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  Future<void> _openDatabase() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'user_info_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_info(id INTEGER PRIMARY KEY, full_name TEXT, department TEXT, prn_number TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Info Page')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please provide your information:'),
              SizedBox(height: 20),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _departmentController,
                decoration: InputDecoration(labelText: 'Department'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your department';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _prnController,
                decoration: InputDecoration(labelText: 'PRN Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your PRN number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final fullName = _fullNameController.text;
                    final department = _departmentController.text;
                    final prnNumber = _prnController.text;
                    await saveUserInfo(fullName, department, prnNumber);
                    _showDialog(context);
                  }
                },
                child: Text('Submit Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserInfo(
      String fullName, String department, String prnNumber) async {
    final Database db = await _database!;
    await db.insert(
      'user_info',
      {
        'full_name': fullName,
        'department': department,
        'prn_number': prnNumber
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Your information has been submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
