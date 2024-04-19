// import 'package:flutter/material.dart';

// class StudentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildProfileCard(context),
//               SizedBox(height: 20),
//               _buildButton(
//                   context, 'Raise Request', Icons.add_alert, Colors.orange),
//               SizedBox(height: 20),
//               _buildButton(context, 'Check Status', Icons.info, Colors.blue),
//               SizedBox(height: 20),
//               _buildButton(context, 'Print Form', Icons.print, Colors.green),
//               SizedBox(height: 20),
//               _buildStudentForm(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileCard(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Student Profile',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('Name: Yash Chavan'),
//             ),
//             ListTile(
//               leading: Icon(Icons.email),
//               title: Text('Email: yashchavan@gmail.com'),
//             ),
//             ListTile(
//               leading: Icon(Icons.school),
//               title: Text('University: SPPU University'),
//             ),
//             ListTile(
//               leading: Icon(Icons.location_on),
//               title: Text('Address: 123 Street, Pune'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildButton(
//       BuildContext context, String text, IconData icon, Color color) {
//     return ElevatedButton.icon(
//       onPressed: () {
//         _handleButtonPress(context, text);
//       },
//       icon: Icon(icon),
//       label: Text(
//         text,
//         style: TextStyle(fontSize: 18),
//       ),
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     );
//   }

//   void _handleButtonPress(BuildContext context, String action) {
//     switch (action) {
//       case 'Raise Request':
//         _showSnackbar(context, 'Request raised successfully!');
//         break;
//       case 'Check Status':
//         _showSnackbar(context, 'Checking status...');
//         break;
//       case 'Print Form':
//         _showSnackbar(context, 'Printing form...');
//         break;
//     }
//   }

//   void _showSnackbar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }

//   Widget _buildStudentForm(BuildContext context) {
//     TextEditingController fullNameController = TextEditingController();
//     TextEditingController departmentController = TextEditingController();
//     TextEditingController prnController = TextEditingController();
//     TextEditingController mobileController = TextEditingController();

//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Student Information',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: fullNameController,
//             decoration: InputDecoration(labelText: 'Full Name'),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: departmentController,
//             decoration: InputDecoration(labelText: 'Department'),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: prnController,
//             decoration: InputDecoration(labelText: 'PRN Number'),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: mobileController,
//             decoration: InputDecoration(labelText: 'Mobile Number'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               _handleSubmit(
//                   context,
//                   fullNameController.text,
//                   departmentController.text,
//                   prnController.text,
//                   mobileController.text);
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _handleSubmit(BuildContext context, String fullName, String department,
//       String prn, String mobile) {
//     // Implement your logic to handle form submission
//     // For demonstration, print the data
//     print('Full Name: $fullName');
//     print('Department: $department');
//     print('PRN Number: $prn');
//     print('Mobile Number: $mobile');
//   }
// }

// import 'package:flutter/material.dart';

// class StudentPage extends StatefulWidget {
//   @override
//   _StudentPageState createState() => _StudentPageState();
// }

// class _StudentPageState extends State<StudentPage> {
//   // Controllers for text fields
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _departmentController = TextEditingController();
//   final TextEditingController _prnController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();

//   // List to store submitted student information
//   List<Student> _submittedStudents = [];

//   // Flag to track whether the form has been submitted
//   bool _isFormSubmitted = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildStudentForm(context),
//             SizedBox(height: 20),
//             _buildButton(
//                 context, 'Raise Request', Icons.add_alert, Colors.orange),
//             SizedBox(height: 20),
//             _buildButton(context, 'Check Status', Icons.info, Colors.blue),
//             SizedBox(height: 20),
//             _buildButton(context, 'Print Form', Icons.print, Colors.green),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStudentForm(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Student Information',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: _fullNameController,
//             decoration: InputDecoration(labelText: 'Full Name'),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: _departmentController,
//             decoration: InputDecoration(labelText: 'Department'),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: _prnController,
//             decoration: InputDecoration(labelText: 'PRN Number'),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: _mobileController,
//             decoration: InputDecoration(labelText: 'Mobile Number'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               _handleSubmit(
//                 context,
//                 _fullNameController.text,
//                 _departmentController.text,
//                 _prnController.text,
//                 _mobileController.text,
//               );
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButton(
//       BuildContext context, String text, IconData icon, Color color) {
//     return ElevatedButton.icon(
//       onPressed: () {
//         // Add corresponding logic for each button
//         _handleButtonPress(context, text);
//       },
//       icon: Icon(icon),
//       label: Text(
//         text,
//         style: TextStyle(fontSize: 18),
//       ),
//       style: ElevatedButton.styleFrom(
//         // primary: color,
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//     );
//   }

//   void _handleSubmit(BuildContext context, String fullName, String department,
//       String prn, String mobile) {
//     // Create a Student object with the submitted data
//     Student student = Student(
//       fullName: fullName,
//       department: department,
//       prn: prn,
//       mobile: mobile,
//     );

//     // Add the student to a list to keep track of all submitted students
//     _submittedStudents.add(student);

//     // Show a snackbar to indicate successful form submission
//     _showSnackbar(context, 'Form submitted successfully!');

//     // Update the UI with the submitted student information
//     setState(() {
//       _isFormSubmitted = true;
//     });
//   }

//   void _handleButtonPress(BuildContext context, String action) {
//     // Perform action based on the button pressed
//     switch (action) {
//       case 'Raise Request':
//         _showSnackbar(context, 'Request raised successfully!');
//         break;
//       case 'Check Status':
//         _showSnackbar(context, 'Checking status...');
//         break;
//       case 'Print Form':
//         _showSnackbar(context, 'Printing form...');
//         break;
//     }
//   }

//   void _showSnackbar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
// }

// class Student {
//   final String fullName;
//   final String department;
//   final String prn;
//   final String mobile;

//   Student({
//     required this.fullName,
//     required this.department,
//     required this.prn,
//     required this.mobile,
//   });
// }
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // Controllers for text fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _prnController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  // List to store submitted student information
  List<Student> _submittedStudents = [];

  // Flag to track whether the form has been submitted
  bool _isFormSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildStudentForm(context),
      ),
    );
  }

  Widget _buildStudentForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _departmentController,
                  decoration: InputDecoration(labelText: 'Department'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _prnController,
                  decoration: InputDecoration(labelText: 'PRN Number'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _mobileController,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _handleSubmit(
                      context,
                      _fullNameController.text,
                      _departmentController.text,
                      _prnController.text,
                      _mobileController.text,
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          if (_isFormSubmitted)
            Text(
              'Submitted Student Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          if (_isFormSubmitted)
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _submittedStudents.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        'Full Name: ${_submittedStudents[index].fullName}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Department: ${_submittedStudents[index].department}'),
                        Text('PRN Number: ${_submittedStudents[index].prn}'),
                        Text(
                            'Mobile Number: ${_submittedStudents[index].mobile}'),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  void _handleSubmit(BuildContext context, String fullName, String department,
      String prn, String mobile) {
    // Create a Student object with the submitted data
    Student student = Student(
      fullName: fullName,
      department: department,
      prn: prn,
      mobile: mobile,
    );

    // Add the student to a list to keep track of all submitted students
    _submittedStudents.add(student);

    // Show a snackbar to indicate successful form submission
    _showSnackbar(context, 'Form submitted successfully!');

    // Update the UI with the submitted student information
    setState(() {
      _isFormSubmitted = true;
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class Student {
  final String fullName;
  final String department;
  final String prn;
  final String mobile;

  Student({
    required this.fullName,
    required this.department,
    required this.prn,
    required this.mobile,
  });
}
