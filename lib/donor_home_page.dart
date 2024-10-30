import 'package:flutter/material.dart';

void main() => runApp(const DonorApp());

class DonorApp extends StatelessWidget {
  const DonorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donor Home Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const DonorHomePage(),
    );
  }
}

class DonorHomePage extends StatefulWidget {
  const DonorHomePage({super.key});

  @override
  DonorHomePageState createState() => DonorHomePageState();
}

class DonorHomePageState extends State<DonorHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = <Widget>[
    const DonorProfilePage(),
    const DonationHistoryPage(),
    const EligibilityStatusPage(),
    const UpdateDonationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
                child: Text(
                  'Donor Profile',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Donation History'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Eligibility Status'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Update Donation'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}

// Donor Profile Page
class DonorProfilePage extends StatelessWidget {
  const DonorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.red.shade400.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Donor's Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Blood Group: O+"),
            Text("Last Donation Date: 2023-06-15"),
            Text("Location: [Donor Location]"),
          ],
        ),
      ),
    );
  }
}

// Donation History Page
class DonationHistoryPage extends StatelessWidget {
  const DonationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        DonationHistoryItem(),
        DonationHistoryItem(),
        DonationHistoryItem(),
      ],
    );
  }
}

class DonationHistoryItem extends StatelessWidget {
  const DonationHistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red.shade400.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Donation Date: 2023-05-10",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Hospital: City Hospital"),
          Text("Location: [Hospital Location]"),
        ],
      ),
    );
  }
}

// Eligibility Status Page
class EligibilityStatusPage extends StatelessWidget {
  const EligibilityStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.red.shade400.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Eligibility Status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Eligible to Donate: Yes"),
            Text("Next Eligible Date: 2023-11-10"),
          ],
        ),
      ),
    );
  }
}

// Update Donation Page
class UpdateDonationPage extends StatefulWidget {
  const UpdateDonationPage({super.key});

  @override
  UpdateDonationPageState createState() => UpdateDonationPageState();
}

class UpdateDonationPageState extends State<UpdateDonationPage> {
  late DateTime _selectedDate = DateTime.now();
  late String _selectedHospital;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.red.shade400.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Update Donation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(_selectedDate == null
                  ? "Select Donation Date"
                  : "Donation Date: ${_selectedDate.toLocal()}"),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null && date != _selectedDate) {
                  setState(() {
                    _selectedDate = date;
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedHospital,
              hint: const Text("Select Hospital"),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedHospital = newValue;
                  });
                }
              },
              items: ["Hospital A", "Hospital B", "Hospital C"]
                  .map<DropdownMenuItem<String>>((String hospital) {
                return DropdownMenuItem<String>(
                  value: hospital,
                  child: Text(hospital),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save donation details logic
              },
              child: const Text("Update Donation"),
            ),
          ],
        ),
      ),
    );
  }
}
