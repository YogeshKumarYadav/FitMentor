import 'package:fit_mentor/features/widgets/health_score_card.dart';
import 'package:fit_mentor/features/widgets/welcome_text_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/theme_provider.dart';
import 'widgets/health_stat_card.dart';
import '../core/services/health_service.dart';
import '../ml/ml_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final healthData = HealthService().getTodayHealthData();

    // final score = MLService().getHealthScore(healthData);
    final score = 68; // will replace this with above line

    return Scaffold(
      // backgroundColor: cardColor,
      appBar: AppBar(title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Text('Fit Mentor',
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const Spacer(),
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return IconButton(
                  icon: Icon(themeProvider.isDarkMode
                      ? Icons.nightlight_round
                      : Icons.wb_sunny
                  ),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                );
              },
            ),
          ],
        )
      )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WelcomeText(name: healthData["name"]),
            const SizedBox(height: 30),
            HealthScoreCircle(score: score),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: HealthStatCard(icon: Icons.directions_walk_rounded, title: "Steps", value: healthData["steps"].toString())),
              Expanded(child: HealthStatCard(icon: Icons.bedtime, title: "Sleep", value: healthData["sleep"].toString())),
            ]),
            Row(children: [
              Expanded(child: HealthStatCard(icon: Icons.favorite, title: "Heart Rate", value: "${healthData["heartRate"]} bpm")),
              Expanded(child: HealthStatCard(icon: Icons.mood_rounded, title: "Stress", value: healthData["stress"])),
            ]),
            const SizedBox(height: 60),
            const Text("Try a 3 min walk to reach your goal", style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: 450 / 600, color: Color(0xFF007BFF)),
            const SizedBox(height: 5),
            const Text("Today's Goal: 450 / 600 kcal"),
          ],
        ),
      ),
    );
  }
}