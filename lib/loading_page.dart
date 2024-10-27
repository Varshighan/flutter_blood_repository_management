import 'package:flutter/material.dart';
import 'login_page.dart'; // Ensure this path is correct

class LoadingPage extends StatefulWidget {
  // Constructor with key parameter using super parameter syntax
  const LoadingPage({super.key});
  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000)); // Faster animation

    // Start the animation
    _controller.forward().then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );

    });
    }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400, // Set the background color to red
      body: Stack(
        children: [
          // Animated blood effect
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double size = 500 + (20 - 5) * _controller.value; // Expanding to 2000
              return Positioned(
                top: -size / 2, // Start from the top center
                left: (MediaQuery.of(context).size.width - size) / 2, // Center horizontally
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.shade400, // Keep the same color for the animation
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
