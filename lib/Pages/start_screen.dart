import 'dart:math';
import 'package:flutter/material.dart';
import 'package:calmcloud/Pages/breathing_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _breathingAnimation;

  @override
  void initState() {
    super.initState();

    // Set up a breathing animation to create a calming effect
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _breathingAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Sunrise-inspired background gradient with a breathing effect
          AnimatedBuilder(
            animation: _breathingAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _breathingAnimation.value,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB0BEC5),
                        Color(0xFF1E88E5)
                      ], // Grey to blue gradient
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Title Text without an icon
                const Text(
                  'Feeling Anxious?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    fontFamily: 'Serif', // Using a calming serif font
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Let’s take a moment to breathe together.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Serif',
                  ),
                ),
                const SizedBox(height: 30),
                // Rotated Image with a slight shadow
                Transform.rotate(
                  angle: -10 * pi / 180,
                  child: Image.asset(
                    'assets/sad.png',
                    width: screenSize.width * 0.65,
                    height: screenSize.width * 0.65,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 70),
                // Get Started Button with breathing effect
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _breathingAnimation.value,
                      child: ElevatedButton(
                        onPressed: () {
                          final startTime = DateTime.now();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BreathingScreen(startTime: startTime),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF0D47A1), // Peach button color
                          foregroundColor: Colors.white, // Text color
                          shadowColor:
                              Colors.black.withOpacity(0.2), // Shadow color
                          elevation: 5, // Shadow elevation
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25), // Rounded corners
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
