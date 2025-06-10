import 'package:fit_mentor/data/models/health_stats_model.dart';

class HealthService {

  final health_stats = HealthStats(
    name: "Yogesh",
    steps: 8442,
    sleep: 7.5,
    heartRate: 72,
    stress: STRESS.Low,
    calories: 450,
  );

  String getStress() {
    return health_stats.stress.toString().split('.').last;
  }

  Map<String, dynamic> getTodayHealthData() {
    return {
      "name": health_stats.name,
      "steps": health_stats.steps,
      "sleep": health_stats.sleep,
      "heartRate": health_stats.heartRate,
      "stress": getStress(),
      "calories": health_stats.calories,
    };
  }
}