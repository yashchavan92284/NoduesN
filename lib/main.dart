// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:no_dues1/main1.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final database = openDatabase(
//     join(await getDatabasesPath(), 'user_database.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)",
//       );
//     },
//     version: 1,
//   );

//   runApp(MaterialApp(
//     title: 'Login Register Demo',
//     debugShowCheckedModeBanner: false,
//     home: LoginPage(database: database),
//   ));
// }

// class LoginPage extends StatefulWidget {
//   final Future<Database> database;

//   LoginPage({required this.database});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(labelText: 'Username'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your username';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       final db = await widget.database;
//                       final List<Map<String, dynamic>> users = await db.query(
//                           'users',
//                           where: 'username = ? AND password = ?',
//                           whereArgs: [
//                             _usernameController.text,
//                             _passwordController.text
//                           ]);

//                       if (users.isNotEmpty) {
//                         // Login successful
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Login Successful')));
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomePage()),
//                         );

//                         // Navigate to home page or next screen
//                       } else {
//                         // Login failed
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Invalid Credentials')));
//                       }
//                     }
//                   },
//                   child: Text('Login'),
//                 ),
//                 SizedBox(height: 20),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => RegisterPage(
//                           database: widget.database,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Text('Create an account'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RegisterPage extends StatefulWidget {
//   final Future<Database> database;

//   RegisterPage({required this.database});

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register')),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(labelText: 'Username'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your username';
//                     }
//                     return null;
//                   },
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       final db = await widget.database;
//                       await db.insert(
//                         'users',
//                         {
//                           'username': _usernameController.text,
//                           'password': _passwordController.text,
//                         },
//                         conflictAlgorithm: ConflictAlgorithm.replace,
//                       );

//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Registration Successful')));
//                     }
//                   },
//                   child: Text('Register'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:no_dues1/main1.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final database = openDatabase(
    join(await getDatabasesPath(), 'user_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)",
      );
    },
    version: 1,
  );

  runApp(MaterialApp(
    title: 'Login Register Demo',
    debugShowCheckedModeBanner: false,
    home: LoginPage(database: database),
  ));
}

class LoginPage extends StatefulWidget {
  final Future<Database> database;

  LoginPage({required this.database});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                        'https://cdn.pixabay.com/animation/2022/12/05/10/47/10-47-58-930_512.gif'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final db = await widget.database;
                        final List<Map<String, dynamic>> users = await db.query(
                            'users',
                            where: 'username = ? AND password = ?',
                            whereArgs: [
                              _usernameController.text,
                              _passwordController.text
                            ]);

                        if (users.isNotEmpty) {
                          // Login successful
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login Successful')));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );

                          // Navigate to home page or next screen
                        } else {
                          // Login failed
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid Credentials')));
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(
                            database: widget.database,
                          ),
                        ),
                      );
                    },
                    child: Text('Create an account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  final Future<Database> database;

  RegisterPage({required this.database});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                        'https://cdn.pixabay.com/animation/2022/12/05/10/47/10-47-58-930_512.gif'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final db = await widget.database;
                        await db.insert(
                          'users',
                          {
                            'username': _usernameController.text,
                            'password': _passwordController.text,
                          },
                          conflictAlgorithm: ConflictAlgorithm.replace,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registration Successful')));
                      }
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
