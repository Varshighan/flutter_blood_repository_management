import 'package:flutter/material.dart';
import 'hospital_login_page.dart';
import 'donor_sign_up_page.dart'; // Import the donor sign-up page
import 'hospital_sign_up_page.dart'; // Import the hospital sign-up page

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Add the key parameter
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Bank Login',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400, // Red-based background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Blood Bank Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // Name input
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person, color: Colors.red.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Phone number input
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone, color: Colors.red.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Login button for users
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    foregroundColor: Colors.red.shade400, // Text color
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
              const SizedBox(height: 20),
              // Hospital login button
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7, // 70% of screen width
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HospitalLoginPage()),
                    );// Hospital login logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Button color
                    foregroundColor: Colors.blue.shade800, // Text color for hospital
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Hospital Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Sign-up button for users
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New user? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      _showRoleSelectionDialog(context);
                      },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.yellow.shade700), // Sign-up button color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRoleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Up As'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Donor ListTile wrapped in a Container
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigate to Donor Sign Up Page
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DonorSignUpPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent, // No background color
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.red.shade400),
                    title: const Text('Donor'),
                    tileColor: Colors.transparent, // Background color for tapped state
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between buttons
              // Hospital ListTile wrapped in a Container
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigate to Hospital Sign Up Page
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HospitalSignUpPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent, // No background color
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                  child: ListTile(
                    leading: Icon(Icons.local_hospital, color: Colors.blue.shade800),
                    title: const Text('Hospital'),
                    tileColor: Colors.transparent, // Background color for tapped state
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// Void _showRoleSelectionDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Sign Up As'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: Icon(Icons.person, color: Colors.red.shade400),
//               title: const Text('Donor'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 // Navigate to Donor Sign Up Page
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => const DonorSignUpPage()),
//                 );
//               },
//
//             ),
//             ListTile(
//               leading: Icon(Icons.local_hospital, color: Colors.blue.shade800),
//               title: const Text('Hospital'),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 // Navigate to Hospital Sign Up Page
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => const HospitalSignUpPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }