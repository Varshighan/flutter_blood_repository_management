import 'package:flutter/material.dart';

void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HospitalHomePage(),
    );
  }
}

class HospitalHomePage extends StatefulWidget {
  const HospitalHomePage({super.key});

  @override
  HospitalHomePageState createState() => HospitalHomePageState();
}

class HospitalHomePageState extends State<HospitalHomePage> {
  int _selectedIndex = 0;
  bool _isSidebarExpanded = true;

  static const List<Widget> _pages = <Widget>[
    HospitalProfilePage(),
    InventoryPage(),
    DonationRecordsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_isSidebarExpanded) {
        _isSidebarExpanded = false; // Collapse sidebar after selecting a destination
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      appBar: AppBar(
        title: const Text('Hospital Home Page'),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isSidebarExpanded ? 200 : 60,
            child: NavigationRail(
              extended: _isSidebarExpanded,
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              leading: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(_isSidebarExpanded ? Icons.close : Icons.menu),
                  onPressed: () {
                    setState(() {
                      _isSidebarExpanded = !_isSidebarExpanded;
                    });
                  },
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle),
                  label: Text('Hospital Profile'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.inventory),
                  label: Text('Inventory'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history),
                  label: Text('Donation Records'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class HospitalProfilePage extends StatelessWidget {
  const HospitalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hospital Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Hospital details will be displayed here."),
          ],
        ),
      ),
    );
  }
}

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 5, // Placeholder count for blood donations
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Blood Donation Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Donor Name: Placeholder"),
              Text("Blood Type: A+"),
              Text("Donation Date: Placeholder"),
              Text("Hospital: Placeholder"),
            ],
          ),
        );
      },
    );
  }
}

class DonationRecordsPage extends StatelessWidget {
  const DonationRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 5, // Placeholder count for donation records
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Donation Record",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Donor Name: Placeholder"),
              Text("Blood Type: B+"),
              Text("Received Date: Placeholder"),
              Text("Quantity: 2 Units"),
            ],
          ),
        );
      },
    );
  }
}





// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const HospitalApp());
// }
//
// class HospitalApp extends StatelessWidget {
//   const HospitalApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Hospital Home Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HospitalHomePage(),
//     );
//   }
// }
//
// class HospitalHomePage extends StatefulWidget {
//   const HospitalHomePage({super.key});
//
//   @override
//   HospitalHomePageState createState() => HospitalHomePageState();
// }
//
// class HospitalHomePageState extends State<HospitalHomePage> {
//   int _selectedIndex = 0;
//
//   static const List<Widget> _pages = <Widget>[
//     HospitalProfilePage(),
//     InventoryPage(),
//     DonationRecordsPage(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade700, // Set background color
//       appBar: AppBar(
//         title: const Text('Hospital Home Page'),
//       ),
//       body: Row(
//         children: [
//           NavigationRail(
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: _onItemTapped,
//             labelType: NavigationRailLabelType.all,
//             destinations: const [
//               NavigationRailDestination(
//                 icon: Icon(Icons.account_circle),
//                 label: Text('Hospital Profile'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.inventory),
//                 label: Text('Inventory'),
//               ),
//               NavigationRailDestination(
//                 icon: Icon(Icons.history),
//                 label: Text('Donation Records'),
//               ),
//             ],
//           ),
//           Expanded(
//             child: _pages[_selectedIndex],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class HospitalProfilePage extends StatelessWidget {
//   const HospitalProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.7),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: const Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Hospital Profile",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text("Hospital details will be displayed here."),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class InventoryPage extends StatelessWidget {
//   const InventoryPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(8.0),
//       itemCount: 5, // Placeholder count for blood donations
//       itemBuilder: (context, index) {
//         return Container(
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.7),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Blood Donation Details",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text("Donor Name: Placeholder"),
//               Text("Blood Type: A+"),
//               Text("Donation Date: Placeholder"),
//               Text("Hospital: Placeholder"),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// class DonationRecordsPage extends StatelessWidget {
//   const DonationRecordsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(8.0),
//       itemCount: 5, // Placeholder count for donation records
//       itemBuilder: (context, index) {
//         return Container(
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.7),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Donation Record",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text("Donor Name: Placeholder"),
//               Text("Blood Type: B+"),
//               Text("Received Date: Placeholder"),
//               Text("Quantity: 2 Units"),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
