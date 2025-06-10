import 'package:fit_mentor/data/models/health_stats.dart';

class HealthService {

  final health_stats = HealthStats(
    steps: 8442,
    sleep: 7.5,
    heartRate: 72,
    stress: STRESS.High,
    calories: 450,
  );

  String getStress() {
    return health_stats.stress.toString().split('.').last;
  }

  Map<String, dynamic> getTodayHealthData() {
    return {
      "steps": health_stats.steps,
      "sleep": health_stats.sleep,
      "heartRate": health_stats.heartRate,
      "stress": getStress(),
      "calories": health_stats.calories,
    };
  }
}