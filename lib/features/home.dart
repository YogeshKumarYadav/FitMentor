import 'package:flutter/material.dart';
import '../constants/constant.dart';
import 'widgets/health_stat_card.dart';
import '../core/services/health_service.dart';
import '../ml/ml_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final healthData = HealthService().getTodayHealthData();
    // final score = MLService().getHealthScore(healthData);
    final score = 98; // will replace this with above line

    return Scaffold(
      // backgroundColor: cardColor,
      appBar: AppBar(title: const Text('Fit Mentor'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Hi Yogesh, you're doing great today!", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            HealthStatCard(title: "Health Score", value: "$score"),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: HealthStatCard(title: "Steps", value: healthData["steps"].toString())),
              Expanded(child: HealthStatCard(title: "Sleep", value: healthData["sleep"].toString())),
            ]),
            Row(children: [
              Expanded(child: HealthStatCard(title: "Heart Rate", value: "${healthData["heartRate"]} bpm")),
              Expanded(child: HealthStatCard(title: "Stress", value: healthData["stress"])),
            ]),
            const SizedBox(height: 20),
            const Text("Try a 3 min walk to reach your goal", style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            LinearProgressIndicator(value: 450 / 600),
            const SizedBox(height: 5),
            const Text("Today's Goal: 450 / 600 kcal"),
          ],
        ),
      ),
    );
  }
}