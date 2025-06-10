import 'package:flutter/material.dart';
import 'dart:math' as math;

class HealthScoreCircle extends StatelessWidget {
  final int score;
  final int maxScore;
  final double radius;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;
  final String label;

  const HealthScoreCircle({
    super.key,
    required this.score,
    this.maxScore = 100,
    this.radius = 70.0,
    this.strokeWidth = 8.0,
    this.progressColor = const Color(0xFF007BFF),
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.label = "Health Score",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),),
        const SizedBox(width: 50),
        SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CustomPaint(
            painter: _ScoreCirclePainter(
              score: score,
              maxScore: maxScore,
              strokeWidth: strokeWidth,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
            ),
            child: Center(
              child: Text(
                score.toString(),
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: radius * 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// CustomPainter to draw the circular progress bar
class _ScoreCirclePainter extends CustomPainter {
  final int score;
  final int maxScore;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;

  _ScoreCirclePainter({
    required this.score,
    required this.maxScore,
    required this.strokeWidth,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    // Adjust radius to account for stroke width so it draws within bounds
    final drawRadius = (size.width / 2) - (strokeWidth / 2);

    // Paint for the background track
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded ends for the track

    // Paint for the progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded ends for the progress

    // Draw the background circle track (full 360 degrees)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: drawRadius),
      -math.pi / 2, // Start from the top (12 o'clock)
      math.pi * 2, // Sweep 360 degrees
      false, // Do not include center (for a hollow arc)
      backgroundPaint,
    );

    // Calculate the sweep angle for the progress based on score
    final progress = score / maxScore;
    final sweepAngle = math.pi * 2 * progress; // Full circle (2*pi) * percentage

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: drawRadius),
      -math.pi / 2, // Start from the top (12 o'clock)
      sweepAngle, // Sweep based on calculated progress
      false, // Do not include center
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ScoreCirclePainter oldDelegate) {
    // Repaint only if any relevant property changes
    return oldDelegate.score != score ||
        oldDelegate.maxScore != maxScore ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}

// Example Usage (to demonstrate how to use HealthScoreCircle)
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Health Score Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HealthScoreCircle(
              score: 76,
              radius: 60.0,
              strokeWidth: 8.0,
              progressColor: const Color(0xFF007BFF),
              backgroundColor: const Color(0xFFE0E0E0),
              label: "Health Score",
            ),
            const SizedBox(height: 30),
            HealthScoreCircle(
              score: 45,
              radius: 50.0,
              progressColor: Colors.orange,
              label: "Daily Progress",
            ),
          ],
        ),
      ),
    ),
  ));
}