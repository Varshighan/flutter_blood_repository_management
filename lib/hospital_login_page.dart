// import 'package:flutter/material.dart';
// import 'hospital_home_page.dart';
//
//
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'hospital_home_page.dart';
//
// Future<void> loginHospital(BuildContext context, String hospitalName, String hospitalId, String password) async {
//   final response = await http.post(
//     Uri.parse('http://your-flask-server-ip:5000/hospital_login'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({
//       'hospital_name': hospitalName,
//       'hospital_id': hospitalId,
//       'password': password,
//     }),
//   );
//
//   if (response.statusCode == 200) {
//     final responseData = jsonDecode(response.body);
//     if (responseData['status'] == 'success') {
//       // Navigate to HospitalHomePage if login successful
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => HospitalHomePage()),
//       );
//     } else {
//       // Show error message if login fails
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(responseData['message'])),
//       );
//     }
//   } else {
//     print("Error: ${response.reasonPhrase}");
//   }
// }
//
//
//
//
//
//
// class HospitalLoginPage extends StatelessWidget {
//   const HospitalLoginPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade800, // Hospital-specific background color
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Hospital Login',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // Hospital Name input
//               TextField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Enter hospital name',
//                   prefixIcon: Icon(Icons.local_hospital, color: Colors.blue.shade800),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Hospital ID/Registration Number input
//               TextField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Enter hospital ID',
//                   prefixIcon: Icon(Icons.badge, color: Colors.blue.shade800),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Password input
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   hintText: 'Enter password',
//                   prefixIcon: Icon(Icons.lock, color: Colors.blue.shade800),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // Login button
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HospitalHomePage()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white, // Button color
//                     foregroundColor: Colors.blue.shade800, // Text color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'hospital_home_page.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'hospital_home_page.dart';

Future<void> loginHospital(BuildContext context, String hospitalName, String hospitalId, String password) async {
  final response = await http.post(
    Uri.parse('http://your-flask-server-ip:5000/hospital_login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'hospital_name': hospitalName,
      'hospital_id': hospitalId,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    if (responseData['status'] == 'success') {
      // Navigate to HospitalHomePage if login successful
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HospitalHomePage()),
      );
    } else {
      // Show error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseData['message'])),
      );
    }
  } else {
    if (kDebugMode) {
      print("Error: ${response.reasonPhrase}");
    }
  }
}

class HospitalLoginPage extends StatelessWidget {
  const HospitalLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Text controllers to capture the input values
    final TextEditingController hospitalNameController = TextEditingController();
    final TextEditingController hospitalIdController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.blue.shade800, // Hospital-specific background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hospital Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // Hospital Name input
              TextField(
                controller: hospitalNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter hospital name',
                  prefixIcon: Icon(Icons.local_hospital, color: Colors.blue.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Hospital ID/Registration Number input
              TextField(
                controller: hospitalIdController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter hospital ID',
                  prefixIcon: Icon(Icons.badge, color: Colors.blue.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password input
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter password',
                  prefixIcon: Icon(Icons.lock, color: Colors.blue.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Login button
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Call loginHospital with the input values
                    loginHospital(
                      context,
                      hospitalNameController.text,
                      hospitalIdController.text,
                      passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    foregroundColor: Colors.blue.shade800, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
