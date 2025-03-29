import 'package:calmcloud/Pages/start_screen.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  final DateTime startTime; // Stores the start time of the activity.
  const FinishScreen({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    final endTime =
        DateTime.now(); // Captures the current time as the end time.
    final timeSpent = endTime.difference(
        startTime); // Calculates the duration spent on the activity.
    final minutesSpent =
        timeSpent.inMinutes; // Converts the duration to minutes.

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenSize = constraints.biggest;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFD194),
                  Color(0xFFEA5455)
                ], // Sunrise-inspired colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Yayyy!',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontFamily: 'Serif', // Consistent font style
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black26,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'You survived your panic attack, you are\nin control of your mind and body.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Serif', // Consistent font style
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Image.asset(
                      'assets/happy.png',
                      width: screenSize.width * 0.75,
                      height: screenSize.width *
                          0.75, // Maintain square aspect ratio
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Total Spent Time',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Serif', // Consistent font style
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$minutesSpent Minute',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    // Get Started Button with breathing effect
                    AnimatedBuilder(
                      animation: ValueNotifier(
                          1.0), // Dummy animation for breathing effect
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.05, // Adjust the scale for breathing effect
                          child: Container(
                            height:
                                60, // Increased height for better visibility
                            width: screenSize.width * 0.6, // Adjusted width
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const StartScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xff0F073E), // Dark blue color
                                elevation: 9,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25), // Rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15), // Adjusted padding
                              ),
                              child: const Text(
                                'Back to Home',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      20, // Increased font size for visibility
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
