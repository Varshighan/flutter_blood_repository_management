import 'package:flutter/material.dart';
import 'donor_home_page.dart';

class DonorSignUpPage extends StatefulWidget {
  const DonorSignUpPage({super.key}); // Added const and key
  @override
  DonorSignUpPageState createState() => DonorSignUpPageState(); // Public class
}

class DonorSignUpPageState extends State<DonorSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController emergencyNameController = TextEditingController();
  final TextEditingController emergencyRelationshipController = TextEditingController();
  final TextEditingController emergencyContactController = TextEditingController();
  final TextEditingController medicalConditionsController = TextEditingController();
  final TextEditingController lastDonationDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400, // Red background
      body: Column(
        children: [
          // Custom AppBar without elevation and text
          Container(
            color: Colors.red.shade400, // Match the background color
            height: 56.0, // Default height of an AppBar
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Donor details inputs
                      const Text(
                        'Please enter your details below:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Full Name',
                          prefixIcon: Icon(Icons.person, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: dobController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Date of Birth',
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: genderController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Gender',
                          prefixIcon: Icon(Icons.wc, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: bloodGroupController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Blood Group',
                          prefixIcon: Icon(Icons.bloodtype, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: contactNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Contact Number',
                          prefixIcon: Icon(Icons.phone, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Email Address',
                          prefixIcon: Icon(Icons.email, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // TextField(
                      //   controller: streetController,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'Street',
                      //     prefixIcon: Icon(Icons.home, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      TextField(
                        controller: cityController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'City',
                          prefixIcon: Icon(Icons.location_city, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // TextField(
                      //   controller: stateController,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'State',
                      //     prefixIcon: Icon(Icons.map, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      // TextField(
                      //   controller: zipCodeController,
                      //   keyboardType: TextInputType.number,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'Zip Code',
                      //     prefixIcon: Icon(Icons.pin_drop, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      // TextField(
                      //   controller: emergencyNameController,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'Emergency Contact Name',
                      //     prefixIcon: Icon(Icons.person_outline, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      // TextField(
                      //   controller: emergencyRelationshipController,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'Emergency Contact Relationship',
                      //     prefixIcon: Icon(Icons.group, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      // TextField(
                      //   controller: emergencyContactController,
                      //   keyboardType: TextInputType.phone,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'Emergency Contact Number',
                      //     prefixIcon: Icon(Icons.phone_in_talk, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      // TextField(
                      //   controller: medicalConditionsController,
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Colors.white,
                      //     hintText: 'Medical Conditions (Optional)',
                      //     prefixIcon: Icon(Icons.medical_services, color: Colors.red.shade400),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(30),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),

                      TextField(
                        controller: lastDonationDateController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Last Donation Date (Optional)',
                          prefixIcon: Icon(Icons.event, color: Colors.red.shade400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonorAccountPage(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      child: const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 18),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class DonorAccountPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DonorAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400, // Red background for the entire screen
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title text
              const Text(
                'Create Login Credentials',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
              const SizedBox(height: 20),

              // Username field
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person, color: Colors.red.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password field
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock, color: Colors.red.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true, // Hides password
              ),
              const SizedBox(height: 40),

              // Create Login button
              ElevatedButton(
                onPressed: () {
                  // Handle the account creation logic here
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DonorHomePage())); // Navigate to DonorHomePage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Create Login', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class DonorSignUpPage extends StatefulWidget {
//   const DonorSignUpPage({super.key}); // Added const and key
//   @override
//   DonorSignUpPageState createState() => DonorSignUpPageState(); // Public class
// }
//
// class DonorSignUpPageState extends State<DonorSignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Form controllers
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController genderController = TextEditingController();
//   final TextEditingController bloodGroupController = TextEditingController();
//   final TextEditingController contactNumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController streetController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController zipCodeController = TextEditingController();
//   final TextEditingController emergencyNameController = TextEditingController();
//   final TextEditingController emergencyRelationshipController = TextEditingController();
//   final TextEditingController emergencyContactController = TextEditingController();
//   final TextEditingController medicalConditionsController = TextEditingController();
//   final TextEditingController lastDonationDateController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red.shade400, // Red background
//       appBar: AppBar(
//         title: const Text('Donor Sign Up',
//         style: TextStyle(
//           color: Colors.white,
//         ),
//       ),
//         backgroundColor: Colors.red.shade400,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Donor details inputs
//                 const Text(
//                   'Please enter your details below:',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: fullNameController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Full Name',
//                     prefixIcon: Icon(Icons.person, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: dobController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Date of Birth',
//                     prefixIcon: Icon(Icons.calendar_today, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: genderController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Gender',
//                     prefixIcon: Icon(Icons.wc, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: bloodGroupController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Blood Group',
//                     prefixIcon: Icon(Icons.bloodtype, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: contactNumberController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Contact Number',
//                     prefixIcon: Icon(Icons.phone, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Email Address',
//                     prefixIcon: Icon(Icons.email, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: streetController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Street',
//                     prefixIcon: Icon(Icons.home, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: cityController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'City',
//                     prefixIcon: Icon(Icons.location_city, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: stateController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'State',
//                     prefixIcon: Icon(Icons.map, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: zipCodeController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Zip Code',
//                     prefixIcon: Icon(Icons.pin_drop, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: emergencyNameController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Emergency Contact Name',
//                     prefixIcon: Icon(Icons.person_outline, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: emergencyRelationshipController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Emergency Contact Relationship',
//                     prefixIcon: Icon(Icons.group, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: emergencyContactController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Emergency Contact Number',
//                     prefixIcon: Icon(Icons.phone_in_talk, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: medicalConditionsController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Medical Conditions (Optional)',
//                     prefixIcon: Icon(Icons.medical_services, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 TextField(
//                   controller: lastDonationDateController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     hintText: 'Last Donation Date (Optional)',
//                     prefixIcon: Icon(Icons.event, color: Colors.red.shade400),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DonorAccountPage(),
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     foregroundColor: Colors.red.shade400,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: const Text(
//                     'Create Account',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// class DonorAccountPage extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   DonorAccountPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red.shade400, // Red background for the entire screen
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Title text
//               const Text(
//                 'Create Login Credentials',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white, // White text color
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Username field
//               TextFormField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: Icon(Icons.person, color: Colors.red.shade400),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Password field
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: Icon(Icons.lock, color: Colors.red.shade400),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 obscureText: true, // Hides password
//               ),
//               const SizedBox(height: 40),
//
//               // Create Login button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle the account creation logic here
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => DonorHomePage())); // Navigate to DonorHomePage
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.red.shade400,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text('Create Login', style: TextStyle(fontSize: 18)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
