import 'package:flutter/material.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  final List<Map<String, String>> suggestions = const [
    {
      "title": "Hydration Reminder",
      "description": "You're under-hydrated today. Try drinking at least 2.5 liters of water."
    },
    {
      "title": "Sleep Improvement",
      "description": "Your deep sleep duration was low. Consider avoiding screens 1 hour before bed."
    },
    {
      "title": "Cardio Exercise",
      "description": "Add 30 minutes of moderate-intensity cardio to your routine."
    },
    {
      "title": "Mindfulness Break",
      "description": "Your stress levels are high. Try a 10-minute meditation session."
    },
    {
      "title": "Nutrition Tip",
      "description": "You're low on protein intake. Include more eggs, lentils, or lean meat in meals."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text("Insights", style: Theme.of(context).textTheme.headlineMedium),
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  title: Text(
                    suggestion['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(suggestion['description']!),
                  leading: const Icon(Icons.favorite, color: Colors.redAccent),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
